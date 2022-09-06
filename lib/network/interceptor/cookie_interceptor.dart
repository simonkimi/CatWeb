import 'dart:io';

import 'package:catweb/data/database/database.dart';
import 'package:catweb/data/protocol/model/store.dart';
import 'package:dio/dio.dart';

class HeaderCookieInterceptor extends Interceptor {
  HeaderCookieInterceptor({
    required this.model,
    required this.db,
  });

  final SiteBlueprintModel model;
  final WebTableData db;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final baseCookies =
        options.headers[HttpHeaders.cookieHeader] as String? ?? '';

    final path = options.path;
    final uri =
        path.startsWith(RegExp(r'https?://')) ? path : options.uri.toString();

    final cookie = _parseCookies(baseCookies);

    // Cookies
    for (final regField in model.cookies) {
      if (regField.reg.value.isEmpty ||
          RegExp(regField.reg.value).hasMatch(uri)) {
        cookie.addEntries(_parseCookies(regField.value.value).entries);
      }
    }

    // 登录Cookies
    if (db.loginCookies.isNotEmpty) {
      if (model.loginCookieReg.value.isEmpty ||
          RegExp(model.loginCookieReg.value).hasMatch(uri)) {
        if (db.securityModel &&
            options.uri.host == Uri.tryParse(model.baseUrl.value)?.host) {
          cookie.addEntries(_parseCookies(db.loginCookies).entries);
        } else if (!db.securityModel) {
          cookie.addEntries(_parseCookies(db.loginCookies).entries);
        }
      }
    }

    options.headers[HttpHeaders.cookieHeader] = _generateCookie(cookie);
    options.headers[HttpHeaders.userAgentHeader] =
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:105.0) Gecko/20100101 Firefox/105.0';

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
