import 'runtime_contracts.dart';
import 'site_definition.dart';

/// 将 endpoint 请求规则和变量解析为结构化 HTTP 请求。
///
/// 模板使用 `{{variable}}` 语法。整个字段只有一个模板时保留原始标量类型；模板嵌入
/// 普通字符串时转换为字符串。URI、query、header 和 body 始终分别处理。
final class RequestResolver {
  const RequestResolver();

  static final RegExp _template = RegExp(r'\{\{([a-zA-Z_][\w.-]*)\}\}');

  /// 解析一次请求。
  ///
  /// [overrideUri] 用于 continuation URL；[cacheDirective] 用于刷新时覆盖默认缓存策略。
  ResolvedRequest resolve({
    required Uri baseUri,
    required EndpointRule endpoint,
    required Map<String, Object?> variables,
    Uri? overrideUri,
    CacheDirective cacheDirective = CacheDirective.normal,
  }) {
    final resolvedUrl =
        overrideUri ??
        baseUri.resolve(_resolveString(endpoint.request.url, variables));
    final query = <String, List<String>>{
      for (final entry in resolvedUrl.queryParametersAll.entries)
        entry.key: List<String>.of(entry.value),
    };
    for (final entry in endpoint.request.query.entries) {
      final value = _resolveValue(entry.value, variables);
      if (value == null) {
        query.remove(entry.key);
      } else if (value is Iterable<Object?>) {
        query[entry.key] = value.map((item) => item.toString()).toList();
      } else {
        query[entry.key] = [value.toString()];
      }
    }

    final headers = <String, String>{};
    for (final entry in endpoint.request.headers.entries) {
      final value = _resolveValue(entry.value, variables);
      if (value != null) headers[entry.key] = value.toString();
    }

    return ResolvedRequest(
      method: endpoint.request.method,
      uri: resolvedUrl.replace(queryParameters: query.isEmpty ? null : query),
      headers: headers,
      body: _resolveBody(endpoint.request.body, variables),
      cachePolicy: endpoint.cachePolicy,
      cacheDirective: cacheDirective,
      canRetryAutomatically: endpoint.request.canRetryAutomatically,
    );
  }

  ResolvedRequestBody _resolveBody(
    RequestBodyRule body,
    Map<String, Object?> variables,
  ) {
    return switch (body) {
      NoRequestBodyRule() => const ResolvedRequestBody.none(),
      JsonRequestBodyRule(:final value) => ResolvedRequestBody.json(
        _resolveValue(value, variables),
      ),
      FormRequestBodyRule(:final fields) => ResolvedRequestBody.form(
        fields.map(
          (key, value) => MapEntry(key, _resolveValue(value, variables)),
        ),
      ),
      TextRequestBodyRule(:final value) => ResolvedRequestBody.text(
        _resolveString(value, variables),
      ),
    };
  }

  Object? _resolveValue(Object? value, Map<String, Object?> variables) {
    return switch (value) {
      String string => _resolveTemplateValue(string, variables),
      List<Object?> list =>
        list.map((item) => _resolveValue(item, variables)).toList(),
      Map<Object?, Object?> map => map.map(
        (key, item) => MapEntry(key.toString(), _resolveValue(item, variables)),
      ),
      _ => value,
    };
  }

  Object? _resolveTemplateValue(String input, Map<String, Object?> variables) {
    final matches = _template.allMatches(input).toList(growable: false);
    if (matches.length == 1 && matches.single.group(0) == input) {
      return _readVariable(matches.single.group(1)!, variables);
    }
    return _resolveString(input, variables);
  }

  String _resolveString(String input, Map<String, Object?> variables) {
    return input.replaceAllMapped(_template, (match) {
      final value = _readVariable(match.group(1)!, variables);
      return value?.toString() ?? '';
    });
  }

  Object? _readVariable(String name, Map<String, Object?> variables) {
    if (!variables.containsKey(name)) {
      throw SiteRuntimeException('Missing request variable: $name');
    }
    return variables[name];
  }
}
