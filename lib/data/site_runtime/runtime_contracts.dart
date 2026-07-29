import 'dart:convert';
import 'dart:typed_data';

import 'package:catweb/data/loading/cancellation.dart';

import 'json_values.dart';
import 'site_definition.dart';

/// 单个页面或路由范围内的不可变变量上下文。
final class RequestContext {
  RequestContext([Map<String, Object?> variables = const {}])
    : variables = freezeScalarMap(variables, path: r'$.context');

  final Map<String, Object?> variables;

  /// 合并局部补丁并返回新上下文；原对象不变。
  RequestContext apply(Map<String, Object?> patch) =>
      RequestContext({...variables, ...patch});
}

/// 解析器在成功后请求提交的环境更新。
///
/// [global] 写入站点持久环境，[local] 只传递给当前业务流程的后续请求。
final class EnvironmentPatch {
  EnvironmentPatch({
    Map<String, Object?> global = const {},
    Map<String, Object?> local = const {},
  }) : global = freezeScalarMap(global, path: r'$.environment.global'),
       local = freezeScalarMap(local, path: r'$.environment.local');

  final Map<String, Object?> global;
  final Map<String, Object?> local;

  bool get isEmpty => global.isEmpty && local.isEmpty;
}

/// 站点全局环境的持久化接口。
abstract interface class EnvironmentStore {
  /// 返回当前环境的不可变快照。
  Future<Map<String, Object?>> snapshot();

  /// 原子应用补丁；失败时不得静默吞掉持久化异常。
  Future<void> apply(Map<String, Object?> patch);
}

/// 供测试和临时会话使用的内存环境存储。
final class InMemoryEnvironmentStore implements EnvironmentStore {
  InMemoryEnvironmentStore([Map<String, Object?> initial = const {}])
    : _values = Map<String, Object?>.of(freezeScalarMap(initial));

  Map<String, Object?> _values;

  @override
  Future<Map<String, Object?>> snapshot() async =>
      Map<String, Object?>.unmodifiable(_values);

  @override
  Future<void> apply(Map<String, Object?> patch) async {
    _values = {..._values, ...freezeScalarMap(patch)};
  }
}

/// 单次请求对 endpoint 默认缓存策略的覆盖指令。
enum CacheDirective { normal, refresh }

/// 解析完成后的结构化请求体。
sealed class ResolvedRequestBody {
  const ResolvedRequestBody();

  const factory ResolvedRequestBody.none() = NoResolvedRequestBody;
  const factory ResolvedRequestBody.json(Object? value) =
      JsonResolvedRequestBody;
  const factory ResolvedRequestBody.form(Map<String, Object?> fields) =
      FormResolvedRequestBody;
  const factory ResolvedRequestBody.text(String value) =
      TextResolvedRequestBody;
}

/// 无请求体。
final class NoResolvedRequestBody extends ResolvedRequestBody {
  const NoResolvedRequestBody();
}

/// JSON 请求体。
final class JsonResolvedRequestBody extends ResolvedRequestBody {
  const JsonResolvedRequestBody(this.value);
  final Object? value;
}

/// 表单请求体。
final class FormResolvedRequestBody extends ResolvedRequestBody {
  const FormResolvedRequestBody(this.fields);
  final Map<String, Object?> fields;
}

/// 纯文本请求体。
final class TextResolvedRequestBody extends ResolvedRequestBody {
  const TextResolvedRequestBody(this.value);
  final String value;
}

/// 已完成变量解析、可直接交给传输层的请求。
final class ResolvedRequest {
  ResolvedRequest({
    required this.method,
    required this.uri,
    required Map<String, String> headers,
    required this.body,
    required this.cachePolicy,
    required this.cacheDirective,
    required this.canRetryAutomatically,
  }) : headers = Map<String, String>.unmodifiable(headers);

  final RequestMethod method;
  final Uri uri;
  final Map<String, String> headers;
  final ResolvedRequestBody body;
  final EndpointCachePolicy cachePolicy;
  final CacheDirective cacheDirective;
  final bool canRetryAutomatically;
}

/// 与具体 HTTP 客户端无关的原始响应。
final class RawResponse {
  RawResponse({
    required this.statusCode,
    required Uint8List body,
    Map<String, List<String>> headers = const {},
  }) : body = Uint8List.fromList(body),
       headers = Map<String, List<String>>.unmodifiable(
         headers.map(
           (key, value) => MapEntry(key, List<String>.unmodifiable(value)),
         ),
       );

  final int statusCode;
  final Uint8List body;
  final Map<String, List<String>> headers;

  /// 以 UTF-8 解码响应体；非法字节会被替换而不是抛错。
  String get bodyText => utf8.decode(body, allowMalformed: true);
}

/// 结构化 HTTP 传输接口。
abstract interface class HttpTransport {
  /// 发送 [request]，并传播 [cancellation]。
  Future<RawResponse> send(
    ResolvedRequest request,
    CancellationScope cancellation,
  );
}

/// 传递给解析器的一次解析任务。
final class ParseJob<T> {
  const ParseJob({
    required this.endpoint,
    required this.parser,
    required this.response,
  });

  final EndpointRule endpoint;
  final ParserRule parser;
  final RawResponse response;
}

/// 解析器成功返回的业务数据、分页元数据和环境补丁。
final class ParsedPayload<T> {
  ParsedPayload({
    required this.data,
    this.continuation,
    this.totalCount,
    this.isLast,
    this.itemCount,
    EnvironmentPatch? environment,
  }) : environment = environment ?? EnvironmentPatch();

  final T data;
  final String? continuation;
  final int? totalCount;
  final bool? isLast;
  final int? itemCount;
  final EnvironmentPatch environment;
}

/// 可独立注入的页面解析引擎接口。
///
/// CSS、XPath、JSONPath 或 JS 等具体实现不属于加载核心。
abstract interface class ParserEngine {
  /// 根据 endpoint 和 parser 规则解析响应。
  Future<ParsedPayload<T>> parse<T>(
    ParseJob<T> job,
    CancellationScope cancellation,
  );
}

/// 解析失败的基础异常。
class ParserException implements Exception {
  const ParserException(this.message, [this.cause]);

  final String message;
  final Object? cause;

  @override
  String toString() => message;
}

/// 尚未注入具体解析引擎时抛出的明确异常。
final class ParserUnavailableException extends ParserException {
  const ParserUnavailableException() : super('No parser engine is registered');

  @override
  String toString() => message;
}

/// 环境读取或原子提交失败。
final class PersistenceException implements Exception {
  const PersistenceException(this.message, this.cause);

  final String message;
  final Object cause;

  @override
  String toString() => '$message: $cause';
}

/// 明确表示当前构建没有可用解析器的占位实现。
///
/// 它不会返回空数据，以免把配置缺失伪装成成功响应。
final class UnavailableParserEngine implements ParserEngine {
  const UnavailableParserEngine();

  @override
  Future<ParsedPayload<T>> parse<T>(
    ParseJob<T> job,
    CancellationScope cancellation,
  ) async {
    cancellation.throwIfCancelled();
    throw const ParserUnavailableException();
  }
}

/// 站点规则在执行阶段违反运行时约束。
final class SiteRuntimeException implements Exception {
  const SiteRuntimeException(this.message);
  final String message;

  @override
  String toString() => message;
}
