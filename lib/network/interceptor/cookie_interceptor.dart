import 'package:catweb/data/protocol/model/store.dart';
import 'package:catweb/utils/debug.dart';
import 'package:dio/dio.dart';

class HeaderCookieInterceptor extends Interceptor {
  HeaderCookieInterceptor(this.model);

  final SiteBlueprintModel model;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final baseCookies = options.headers['Cookie'] as String? ?? '';
    final uri = options.uri.toString();
    final cookie = _parseCookies(baseCookies);

    // Cookies
    for (final regField in model.cookies) {
      if (regField.reg.value.isEmpty ||
          RegExp(regField.reg.value).hasMatch(uri)) {
        cookie.addEntries(_parseCookies(regField.value.value).entries);
      }
    }
    options.headers['Cookie'] = _generateCookie(cookie);

    // Headers
    for (final regField in model.headers) {
      if (RegExp(regField.reg.value).hasMatch(uri)) {
        options.headers.addAll(_parseHeaders(regField.value.value));
      }
    }
    return handler.next(options);
  }

  Map<String, String> _parseCookies(String raw) => Map.fromEntries(raw
      .split(';')
      .map((e) => e.split('='))
      .where((e) => e.length == 2)
      .map((e) => MapEntry(e[0].trim(), e[1].trim())));

  Map<String, String> _parseHeaders(String raw) => Map.fromEntries(raw
      .split(';')
      .map((e) => e.split('='))
      .where((e) => e.length == 2)
      .map((e) => MapEntry(e[0].trim(), e[1].trim())));

  String _generateCookie(Map<String, String> cookies) => cookies.entries
      .where((e) => e.key.isNotEmpty && e.value.isNotEmpty)
      .map((e) => '${e.key}=${e.value}')
      .join('; ');
}

class CheckInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    trace('Request from internet');
  }
}
