import 'package:catweb/data/loading/cancellation.dart';
import 'package:catweb/data/loading/paged_loader.dart';

import 'request_resolver.dart';
import 'runtime_contracts.dart';
import 'site_compiler.dart';
import 'site_definition.dart';
import 'json_values.dart';

/// 一次站点业务操作的不可变输入。
///
/// 变量覆盖顺序固定为：全局环境 < [context] < [inputs] < 分页变量。
final class SiteOperation<T> {
  SiteOperation({
    required this.endpointId,
    RequestContext? context,
    Map<String, Object?> inputs = const {},
    this.pageRequest,
    this.cacheDirective = CacheDirective.normal,
  }) : context = context ?? RequestContext(),
       inputs = freezeScalarMap(inputs, path: r'$.operation.inputs');

  final String endpointId;
  final RequestContext context;
  final Map<String, Object?> inputs;
  final PageRequest? pageRequest;
  final CacheDirective cacheDirective;
}

/// 站点操作成功后的业务结果。
///
/// 除 [data] 外还携带更新后的局部上下文、原始响应和统一分页元数据。
final class ExecutionResult<T> {
  const ExecutionResult({
    required this.data,
    required this.context,
    required this.response,
    required this.isLast,
    this.nextCursor,
    this.totalCount,
    this.itemCount,
  });

  final T data;
  final RequestContext context;
  final RawResponse response;
  final PageCursor? nextCursor;
  final int? totalCount;
  final int? itemCount;
  final bool isLast;
}

/// 统一执行声明式站点操作的接口。
abstract interface class SiteExecutor {
  /// 当前会话已经编译的站点。
  CompiledSite get site;

  /// 执行 [operation] 并传播 [cancellation]。
  Future<ExecutionResult<T>> execute<T>(
    SiteOperation<T> operation,
    CancellationScope cancellation,
  );
}

/// [SiteExecutor] 的标准流水线实现。
///
/// 执行顺序为：读取环境、合并变量、解析请求、HTTP 传输、解析响应、校验分页元数据、
/// 原子提交全局环境。请求或解析失败时不会提交环境补丁。
final class DefaultSiteExecutor implements SiteExecutor {
  const DefaultSiteExecutor({
    required this.site,
    required this.transport,
    required this.parser,
    required this.environment,
    this.resolver = const RequestResolver(),
  });

  @override
  final CompiledSite site;
  final HttpTransport transport;
  final ParserEngine parser;
  final EnvironmentStore environment;
  final RequestResolver resolver;

  @override
  Future<ExecutionResult<T>> execute<T>(
    SiteOperation<T> operation,
    CancellationScope cancellation,
  ) async {
    cancellation.throwIfCancelled();
    final endpoint = site.endpoint(operation.endpointId);
    final parserRule = site.parser(endpoint.parserId);
    final globalVariables = await _environmentSnapshot();
    cancellation.throwIfCancelled();

    final page = _resolvePage(endpoint.pagination, operation.pageRequest);
    final variables = <String, Object?>{
      ...globalVariables,
      ...operation.context.variables,
      ...operation.inputs,
      ...page.variables,
    };
    final request = resolver.resolve(
      baseUri: site.baseUri,
      endpoint: endpoint,
      variables: variables,
      overrideUri: page.overrideUri,
      cacheDirective: operation.cacheDirective,
    );
    final response = await transport.send(request, cancellation);
    cancellation.throwIfCancelled();
    final payload = await parser.parse<T>(
      ParseJob<T>(endpoint: endpoint, parser: parserRule, response: response),
      cancellation,
    );
    cancellation.throwIfCancelled();
    final itemCount =
        payload.itemCount ??
        (payload.data is List<Object?>
            ? (payload.data as List<Object?>).length
            : null);
    _validatePayload(endpoint.pagination, payload, itemCount);
    final pagination = _resolveResultPagination(
      endpoint.pagination,
      page,
      payload,
      itemCount,
    );
    if (payload.environment.global.isNotEmpty) {
      await _applyEnvironment(payload.environment.global);
    }
    cancellation.throwIfCancelled();
    return ExecutionResult<T>(
      data: payload.data,
      context: operation.context.apply(payload.environment.local),
      response: response,
      nextCursor: pagination.nextCursor,
      totalCount: payload.totalCount,
      itemCount: itemCount,
      isLast: pagination.isLast,
    );
  }

  Future<Map<String, Object?>> _environmentSnapshot() async {
    try {
      return await environment.snapshot();
    } catch (error) {
      if (error is PersistenceException) rethrow;
      throw PersistenceException('Failed to read site environment', error);
    }
  }

  Future<void> _applyEnvironment(Map<String, Object?> patch) async {
    try {
      await environment.apply(patch);
    } catch (error) {
      if (error is PersistenceException) rethrow;
      throw PersistenceException('Failed to persist site environment', error);
    }
  }

  void _validatePayload<T>(
    PaginationRule rule,
    ParsedPayload<T> payload,
    int? itemCount,
  ) {
    if (itemCount != null && itemCount < 0) {
      throw const SiteRuntimeException('Parser returned a negative itemCount');
    }
    if (payload.totalCount case final total?) {
      if (total < 0) {
        throw const SiteRuntimeException(
          'Parser returned a negative totalCount',
        );
      }
      if (itemCount != null && itemCount > total) {
        throw const SiteRuntimeException('Page itemCount exceeds totalCount');
      }
    }
    if (payload.isLast == true) return;
    switch (rule) {
      case NoPaginationRule():
        break;
      case PageNumberPaginationRule(:final endCondition)
          when endCondition != PageEndCondition.missingContinuation &&
              itemCount == null:
        throw const SiteRuntimeException(
          'Parser must return itemCount for this page end condition',
        );
      case PageNumberPaginationRule(
        endCondition: PageEndCondition.missingContinuation,
      ):
        break;
      case ContinuationPaginationRule():
        if (payload.isLast == false &&
            (payload.continuation == null || payload.continuation!.isEmpty)) {
          throw const SiteRuntimeException(
            'Parser marked the page as non-final without a continuation',
          );
        }
      case PageNumberPaginationRule():
        break;
    }
  }

  _ResolvedPage _resolvePage(PaginationRule rule, PageRequest? request) {
    switch (rule) {
      case NoPaginationRule():
        if (request != null && request is! InitialPageRequest) {
          throw const SiteRuntimeException('Endpoint is not paginated');
        }
        return const _ResolvedPage();
      case PageNumberPaginationRule(
        :final variable,
        :final initial,
        :final step,
      ):
        final pageNumber = switch (request) {
          null || InitialPageRequest() => initial,
          NextPageRequest(cursor: NumberPageCursor(:final value)) => value,
          IndexedPageRequest(:final pageIndex) => initial + pageIndex * step,
          _ => throw const SiteRuntimeException(
            'Page-number endpoint requires a numeric cursor',
          ),
        };
        return _ResolvedPage(
          variables: {variable: pageNumber},
          pageNumber: pageNumber,
        );
      case ContinuationPaginationRule(:final target, :final variable):
        switch (request) {
          case null || InitialPageRequest():
            return const _ResolvedPage();
          case NextPageRequest(:final cursor):
            final cursorValue = switch (cursor) {
              NumberPageCursor(:final value) => value.toString(),
              TokenPageCursor(:final value) => value,
              UriPageCursor(:final value) => value.toString(),
            };
            return switch (target) {
              ContinuationTarget.url => _ResolvedPage(
                overrideUri: site.baseUri.resolve(cursorValue),
              ),
              ContinuationTarget.variable => _ResolvedPage(
                variables: {variable!: cursorValue},
              ),
            };
          case IndexedPageRequest():
            throw const SiteRuntimeException(
              'Continuation endpoint does not support random access',
            );
        }
    }
  }

  _ResolvedPagination _resolveResultPagination<T>(
    PaginationRule rule,
    _ResolvedPage page,
    ParsedPayload<T> payload,
    int? itemCount,
  ) {
    if (payload.isLast == true) {
      return const _ResolvedPagination(isLast: true);
    }
    switch (rule) {
      case NoPaginationRule():
        return const _ResolvedPagination(isLast: true);
      case PageNumberPaginationRule(
        :final step,
        :final pageSize,
        :final endCondition,
      ):
        final isLast = switch (endCondition) {
          PageEndCondition.emptyItems => itemCount == 0,
          PageEndCondition.shortPage =>
            itemCount != null && itemCount < pageSize,
          PageEndCondition.missingContinuation =>
            payload.continuation == null || payload.continuation!.isEmpty,
        };
        return _ResolvedPagination(
          nextCursor: isLast
              ? null
              : PageCursor.number(page.pageNumber! + step),
          isLast: isLast,
        );
      case ContinuationPaginationRule(:final target):
        final continuation = payload.continuation;
        if (continuation == null || continuation.isEmpty) {
          return const _ResolvedPagination(isLast: true);
        }
        return _ResolvedPagination(
          nextCursor: target == ContinuationTarget.url
              ? PageCursor.uri(site.baseUri.resolve(continuation))
              : PageCursor.token(continuation),
          isLast: false,
        );
    }
  }
}

final class _ResolvedPage {
  const _ResolvedPage({
    this.variables = const {},
    this.overrideUri,
    this.pageNumber,
  });

  final Map<String, Object?> variables;
  final Uri? overrideUri;
  final int? pageNumber;
}

final class _ResolvedPagination {
  const _ResolvedPagination({required this.isLast, this.nextCursor});
  final PageCursor? nextCursor;
  final bool isLast;
}
