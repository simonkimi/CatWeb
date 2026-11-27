import 'dart:convert';

import 'package:cookie_jar/cookie_jar.dart';

/// One cookie parsed from a Netscape HTTP cookie file.
final class NetscapeCookie {
  const NetscapeCookie({required this.host, required this.cookie});

  /// Host used as the request target when saving this cookie.
  final String host;
  final Cookie cookie;
}

String decodeCookieFile(List<int> bytes) {
  try {
    final text = utf8.decode(bytes);
    return text.startsWith('\uFEFF') ? text.substring(1) : text;
  } on FormatException {
    return latin1.decode(bytes);
  }
}

List<NetscapeCookie> parseNetscapeCookies(String content) {
  final cookies = <NetscapeCookie>[];
  for (final rawLine in const LineSplitter().convert(content)) {
    final cookie = _parseNetscapeCookieLine(rawLine);
    if (cookie != null) cookies.add(cookie);
  }
  return cookies;
}

Future<int> saveNetscapeCookies(CookieJar jar, String content) async {
  final cookies = parseNetscapeCookies(content);
  final grouped = <String, List<Cookie>>{};
  for (final item in cookies) {
    grouped.putIfAbsent(item.host, () => []).add(item.cookie);
  }
  for (final entry in grouped.entries) {
    await jar.saveFromResponse(Uri.https(entry.key, '/'), entry.value);
  }
  return cookies.length;
}

NetscapeCookie? _parseNetscapeCookieLine(String rawLine) {
  var line = rawLine.trim();
  if (line.isEmpty) return null;

  var httpOnly = false;
  if (line.startsWith('#HttpOnly_')) {
    httpOnly = true;
    line = line.substring('#HttpOnly_'.length).trimLeft();
  } else if (line.startsWith('#')) {
    return null;
  }

  final fields =
      (line.contains('\t') ? line.split('\t') : line.split(RegExp(r'\s+')))
          .map((field) => field.trim())
          .toList(growable: false);
  if (fields.length < 7) return null;

  final domain = fields[0];
  if (domain.isEmpty) return null;
  final includeSubdomains = fields[1].toUpperCase() == 'TRUE';
  final path = fields[2].isEmpty ? '/' : fields[2];
  final secure = fields[3].toUpperCase() == 'TRUE';
  final expiresAt = int.tryParse(fields[4]) ?? 0;
  final name = fields[5];
  if (name.isEmpty) return null;
  final value = fields.sublist(6).join(line.contains('\t') ? '\t' : ' ');

  final host = domain.startsWith('.') ? domain.substring(1) : domain;
  if (Uri.tryParse('https://$host/')?.host != host) return null;

  try {
    final cookie = Cookie(name, value)
      ..path = path
      ..secure = secure
      ..httpOnly = httpOnly;
    if (includeSubdomains) cookie.domain = domain;
    if (expiresAt > 0) {
      final expires = DateTime.fromMillisecondsSinceEpoch(
        expiresAt * 1000,
        isUtc: true,
      );
      if (!expires.isAfter(DateTime.now())) return null;
      cookie.expires = expires;
    }
    return NetscapeCookie(host: host, cookie: cookie);
  } on FormatException {
    return null;
  }
}
