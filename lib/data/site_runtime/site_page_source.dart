import 'package:catweb/data/loading/cancellation.dart';
import 'package:catweb/data/loading/paged_loader.dart';

import 'json_values.dart';
import 'runtime_contracts.dart';
import 'site_definition.dart';
import 'site_executor.dart';

/// 将解析 payload 转换为当前页面项目的函数。
typedef PageItemsDecoder<P, T> = List<T> Function(P payload);

/// 页面 payload 成功解析后的观察回调。
typedef PagePayloadListener<P> = void Function(P payload);

/// 解析器直接返回 `List<T>` 时使用的页面数据源。
final class SitePageSource<T> extends MappedSitePageSource<List<T>, T> {
  SitePageSource({
    required super.executor,
    required super.endpointId,
    super.context,
    super.inputs,
  }) : super(itemsOf: _identity);

  static List<T> _identity<T>(List<T> items) => items;
}

/// 将任意解析 payload 映射为分页项目的数据源。
///
/// 该类型把声明式 endpoint 适配为 [PageSource]，并在内部保存 continuation 对应的
/// 局部上下文和绝对起始索引。它不负责持有 UI 状态。
final class MappedSitePageSource<P, T>
    implements PageSource<T>, RefreshablePageSource {
  MappedSitePageSource({
    required this.executor,
    required this.endpointId,
    required this.itemsOf,
    this.onPayload,
    RequestContext? context,
    Map<String, Object?> inputs = const {},
  }) : _initialContext = context ?? RequestContext(),
       _inputs = freezeScalarMap(inputs, path: r'$.pageSource.inputs') {
    final endpoint = executor.site.endpoint(endpointId);
    capabilities = switch (endpoint.pagination) {
      PageNumberPaginationRule(:final pageSize) =>
        PaginationCapabilities.indexed(pageSize: pageSize),
      NoPaginationRule() ||
      ContinuationPaginationRule() => const PaginationCapabilities.sequential(),
    };
  }

  final SiteExecutor executor;
  final String endpointId;
  final PageItemsDecoder<P, T> itemsOf;
  final PagePayloadListener<P>? onPayload;
  final RequestContext _initialContext;
  Map<String, Object?> _inputs;
  final Map<PageCursor, RequestContext> _cursorContexts = {};
  final Map<PageCursor, int> _cursorStartIndices = {};
  bool _refreshPending = false;

  @override
  late final PaginationCapabilities capabilities;

  /// 替换后续请求使用的本次输入快照。
  ///
  /// 搜索和筛选更新输入后通常应立即调用 `PagedLoader.refresh`。
  void updateInputs(Map<String, Object?> inputs) {
    _inputs = freezeScalarMap(inputs, path: r'$.pageSource.inputs');
  }

  @override
  void beginRefresh() {
    _refreshPending = true;
  }

  @override
  Future<PageChunk<T>> load(
    PageRequest request,
    CancellationScope cancellation,
  ) async {
    final endpoint = executor.site.endpoint(endpointId);
    if (request is InitialPageRequest) {
      _cursorContexts.clear();
      _cursorStartIndices.clear();
    }
    final context = switch (request) {
      NextPageRequest(:final cursor) =>
        _cursorContexts[cursor] ?? _initialContext,
      _ => _initialContext,
    };
    final result = await executor.execute<P>(
      SiteOperation<P>(
        endpointId: endpointId,
        context: context,
        inputs: _inputs,
        pageRequest: request,
        cacheDirective: request is InitialPageRequest && _refreshPending
            ? CacheDirective.refresh
            : CacheDirective.normal,
      ),
      cancellation,
    );
    cancellation.throwIfCancelled();
    if (request is InitialPageRequest) _refreshPending = false;
    final items = List<T>.unmodifiable(itemsOf(result.data));
    onPayload?.call(result.data);
    final startIndex = _startIndex(endpoint.pagination, request);
    if (result.nextCursor case final cursor?) {
      _cursorContexts[cursor] = result.context;
      _cursorStartIndices[cursor] = startIndex + items.length;
    }
    return PageChunk<T>(
      startIndex: startIndex,
      items: items,
      nextCursor: result.nextCursor,
      totalCount: result.totalCount,
      isLast: result.isLast,
    );
  }

  int _startIndex(PaginationRule pagination, PageRequest request) {
    return switch ((pagination, request)) {
      (_, InitialPageRequest()) => 0,
      (
        PageNumberPaginationRule(:final initial, :final step, :final pageSize),
        NextPageRequest(cursor: NumberPageCursor(:final value)),
      ) =>
        ((value - initial) ~/ step) * pageSize,
      (
        PageNumberPaginationRule(:final pageSize),
        IndexedPageRequest(:final pageIndex),
      ) =>
        pageIndex * pageSize,
      (_, NextPageRequest(:final cursor)) =>
        _cursorStartIndices[cursor] ??
            (throw const SiteRuntimeException('Unknown continuation cursor')),
      _ => throw const SiteRuntimeException('Invalid page request'),
    };
  }
}
