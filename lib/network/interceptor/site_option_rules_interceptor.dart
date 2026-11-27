import 'dart:io';

import 'package:catweb/data/site_runtime/site_definition.dart';
import 'package:dio/dio.dart';

/// 把站点规则里匹配当前主机名的 Header 和 Cookie 写进请求。
///
/// 必须排在 `CookieManager` 之前。`CookieManager` 会把这里的 Cookie 与 cookie jar
/// 合并，并写出最终的 Cookie 头。
final class SiteOptionRulesInterceptor extends Interceptor {
  SiteOptionRulesInterceptor(SiteOptions options)
    : _headers = _compile(options.headers, cookies: false),
      _cookies = _compile(options.cookies, cookies: true);

  final List<_CompiledRule> _headers;
  final List<_CompiledRule> _cookies;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final host = options.uri.host;
    for (final rule in _headers) {
      if (!rule.matchesHost(host)) continue;
      options.headers[rule.name] = rule.value;
    }

    final existing = options.headers[HttpHeaders.cookieHeader];
    final cookies = existing is String
        ? _parseCookieHeader(existing)
        : <String, String>{};
    var matched = false;
    for (final rule in _cookies) {
      if (!rule.matchesHost(host)) continue;
      cookies[rule.name] = rule.value;
      matched = true;
    }
    if (matched) {
      options.headers[HttpHeaders.cookieHeader] = cookies.entries
          .map((entry) => '${entry.key}=${entry.value}')
          .join('; ');
    }
    handler.next(options);
  }

  static List<_CompiledRule> _compile(
    List<DomainValueRule> rules, {
    required bool cookies,
  }) {
    final compiled = <_CompiledRule>[];
    for (final rule in rules) {
      final assignment = _assignment(rule.value);
      if (assignment == null) continue;
      if (cookies && !_canSerializeCookie(assignment.$1, assignment.$2)) {
        continue;
      }
      compiled.add(
        _CompiledRule(rule: rule, name: assignment.$1, value: assignment.$2),
      );
    }
    return compiled;
  }

  /// `Cookie.fromSetCookieValue` 拒绝空值，带上这种头会让整个请求失败。
  static bool _canSerializeCookie(String name, String value) {
    try {
      Cookie.fromSetCookieValue('$name=$value');
      return true;
    } on HttpException {
      return false;
    } on FormatException {
      return false;
    }
  }

  static (String, String)? _assignment(String raw) {
    final separator = raw.indexOf('=');
    if (separator <= 0) return null;
    final name = raw.substring(0, separator).trim();
    if (name.isEmpty) return null;
    return (name, raw.substring(separator + 1).trim());
  }

  static Map<String, String> _parseCookieHeader(String header) {
    final cookies = <String, String>{};
    for (final part in header.split(';')) {
      final assignment = _assignment(part);
      if (assignment == null) continue;
      cookies[assignment.$1] = assignment.$2;
    }
    return cookies;
  }
}

final class _CompiledRule {
  const _CompiledRule({
    required this.rule,
    required this.name,
    required this.value,
  });

  final DomainValueRule rule;
  final String name;
  final String value;

  bool matchesHost(String host) => rule.matchesHost(host);
}
