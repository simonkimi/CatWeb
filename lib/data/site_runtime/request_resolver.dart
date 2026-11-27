import 'runtime_contracts.dart';
import 'site_definition.dart';

/// 将 endpoint 请求规则和变量解析为结构化 HTTP 请求。
///
/// 模板写在 `{{ }}` 中。`{{name!}}` 必填；`{{name}}` 和 `{{name??}}` 为空时使用空串；
/// `{{name??abc}}` 为空时使用 `abc`；`{{name?}}` 为空时丢掉所在的 query、header 或
/// body 字段。`?` 不能出现在 URL 和纯文本 body 中。整个字段只有一个模板且结果非空时
/// 保留原始标量类型，嵌进普通字符串时转换为字符串。
final class RequestResolver {
  const RequestResolver();

  /// 与 [SiteCompiler] 共用的合法模板。`??` 必须写在 `?` 前面。
  static final RegExp templatePattern = RegExp(
    r'\{\{([a-zA-Z_][\w.-]*)(?:(!)|\?\?([^}]*)|(\?))?\}\}',
  );

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
        baseUri.resolve(
          _resolveText(
            endpoint.request.url,
            variables,
            location: _TemplateLocation.url,
          ),
        );
    final query = <String, List<String>>{
      for (final entry in resolvedUrl.queryParametersAll.entries)
        entry.key: List<String>.of(entry.value),
    };
    for (final entry in endpoint.request.query.entries) {
      final value = _resolveValue(entry.value, variables);
      if (value == null || identical(value, _omitted)) {
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
      if (value != null && !identical(value, _omitted)) {
        headers[entry.key] = value.toString();
      }
    }

    final encodedQuery = _encodeQuery(query);
    return ResolvedRequest(
      method: endpoint.request.method,
      uri: encodedQuery == null
          ? resolvedUrl
          : resolvedUrl.replace(query: encodedQuery),
      headers: headers,
      body: _resolveBody(endpoint.request.body, variables),
      cachePolicy: endpoint.cachePolicy,
      cacheDirective: cacheDirective,
      canRetryAutomatically: endpoint.request.canRetryAutomatically,
    );
  }

  /// 空字符串也要保留 `=`。`Uri.queryParameters` 会把 `key=` 编成 `key`。
  static String? _encodeQuery(Map<String, List<String>> query) {
    if (query.isEmpty) return null;
    final buffer = StringBuffer();
    var first = true;
    for (final entry in query.entries) {
      final key = Uri.encodeQueryComponent(entry.key);
      for (final value in entry.value) {
        if (!first) buffer.write('&');
        first = false;
        buffer
          ..write(key)
          ..write('=')
          ..write(Uri.encodeQueryComponent(value));
      }
    }
    final encoded = buffer.toString();
    return encoded.isEmpty ? null : encoded;
  }

  ResolvedRequestBody _resolveBody(
    RequestBodyRule body,
    Map<String, Object?> variables,
  ) {
    return switch (body) {
      NoRequestBodyRule() => const ResolvedRequestBody.none(),
      JsonRequestBodyRule(:final value) => ResolvedRequestBody.json(
        _resolveValue(value, variables, location: _TemplateLocation.textBody),
      ),
      FormRequestBodyRule(:final fields) => ResolvedRequestBody.form(
        _resolveFields(fields, variables),
      ),
      TextRequestBodyRule(:final value) => ResolvedRequestBody.text(
        _resolveText(value, variables, location: _TemplateLocation.textBody),
      ),
    };
  }

  Map<String, Object?> _resolveFields(
    Map<String, Object?> fields,
    Map<String, Object?> variables,
  ) {
    final resolved = <String, Object?>{};
    for (final entry in fields.entries) {
      final value = _resolveValue(entry.value, variables);
      if (identical(value, _omitted)) continue;
      resolved[entry.key] = value;
    }
    return resolved;
  }

  Object? _resolveValue(
    Object? value,
    Map<String, Object?> variables, {
    _TemplateLocation location = _TemplateLocation.field,
  }) {
    return switch (value) {
      String string => _resolveTemplateValue(
        string,
        variables,
        location: location,
      ),
      List<Object?> list => [
        for (final item in list)
          if (_resolveValue(item, variables) case final resolved
              when !identical(resolved, _omitted))
            resolved,
      ],
      Map<Object?, Object?> map => _resolveFields(
        map.map((key, item) => MapEntry(key.toString(), item)),
        variables,
      ),
      _ => value,
    };
  }

  Object? _resolveTemplateValue(
    String input,
    Map<String, Object?> variables, {
    required _TemplateLocation location,
  }) {
    final matches = templatePattern.allMatches(input).toList(growable: false);
    if (matches.isEmpty) return input;

    final placeholders = [
      for (final match in matches) _Placeholder.fromMatch(match),
    ];
    if (location != _TemplateLocation.field) {
      for (final placeholder in placeholders) {
        if (placeholder.mode == _TemplateMode.omit) {
          throw SiteRuntimeException(
            'Omit template is not allowed in ${location.label}: '
            '{{${placeholder.name}?}}',
          );
        }
      }
    }

    final resolved = [
      for (final placeholder in placeholders)
        _readPlaceholder(placeholder, variables),
    ];
    if (resolved.any((value) => identical(value, _omitted))) return _omitted;
    if (matches.length == 1 && matches.single.group(0) == input) {
      return resolved.single;
    }

    final buffer = StringBuffer();
    var start = 0;
    for (var index = 0; index < matches.length; index++) {
      buffer
        ..write(input.substring(start, matches[index].start))
        ..write(resolved[index]);
      start = matches[index].end;
    }
    buffer.write(input.substring(start));
    return buffer.toString();
  }

  String _resolveText(
    String input,
    Map<String, Object?> variables, {
    required _TemplateLocation location,
  }) {
    final resolved = _resolveTemplateValue(
      input,
      variables,
      location: location,
    );
    return resolved.toString();
  }

  Object? _readPlaceholder(
    _Placeholder placeholder,
    Map<String, Object?> variables,
  ) {
    final present = variables.containsKey(placeholder.name);
    final value = present ? variables[placeholder.name] : null;
    final empty =
        !present || value == null || (value is String && value.isEmpty);
    return switch (placeholder.mode) {
      _TemplateMode.required when !present || value == null =>
        throw SiteRuntimeException(
          'Missing request variable: ${placeholder.name}',
        ),
      _TemplateMode.required => value,
      _TemplateMode.omit when empty => _omitted,
      _TemplateMode.omit => value,
      _TemplateMode.fallback when empty => placeholder.fallback,
      _TemplateMode.fallback => value,
    };
  }
}

enum _TemplateLocation {
  url('URL'),
  textBody('text body'),
  field('field');

  const _TemplateLocation(this.label);

  final String label;
}

enum _TemplateMode { required, fallback, omit }

final class _Placeholder {
  const _Placeholder(this.name, this.mode, [this.fallback = '']);

  factory _Placeholder.fromMatch(RegExpMatch match) {
    final name = match.group(1)!;
    if (match.group(2) != null)
      return _Placeholder(name, _TemplateMode.required);
    if (match.group(4) != null) return _Placeholder(name, _TemplateMode.omit);
    final fallback = match.group(3);
    if (fallback != null) {
      return _Placeholder(name, _TemplateMode.fallback, fallback);
    }
    return _Placeholder(name, _TemplateMode.fallback);
  }

  final String name;
  final _TemplateMode mode;
  final String fallback;
}

/// `?` 模板为空时的内部标记。调用方据此丢掉整项，不能写进最终请求。
const _omitted = Object();
