import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:catweb/env.dart';
import 'package:catweb/utils/debug.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

const _startedAtKey = 'httpDumpStartedAt';
const _maxMetaText = 64 * 1024;

const _contentTypeExtensions = <String, String>{
  'text/html': 'html',
  'application/xhtml+xml': 'html',
  'application/json': 'json',
  'text/json': 'json',
  'text/plain': 'txt',
  'text/css': 'css',
  'application/javascript': 'js',
  'text/javascript': 'js',
  'image/jpeg': 'jpg',
  'image/jpg': 'jpg',
  'image/png': 'png',
  'image/gif': 'gif',
  'image/webp': 'webp',
  'image/avif': 'avif',
  'application/xml': 'xml',
  'text/xml': 'xml',
  'image/svg+xml': 'svg',
};

/// `.env` 中 `DEBUG_HTTP_DUMP=1` 时为真。
bool get debugHttpDumpEnabled => AppEnv.maybeGet('DEBUG_HTTP_DUMP') == '1';

/// 调试落盘目录。优先使用 `DEBUG_HTTP_DUMP_DIR`，否则写到项目下的 `http_dump`。
Future<Directory> defaultHttpDumpDirectory() async {
  final override = AppEnv.maybeGet('DEBUG_HTTP_DUMP_DIR');
  if (override != null && override.isNotEmpty) {
    return Directory(override);
  }
  final project = _projectRoot(Directory.current);
  if (project != null) {
    return Directory(p.join(project.path, 'http_dump'));
  }
  try {
    final support = Platform.isWindows || Platform.isLinux
        ? await getApplicationSupportDirectory()
        : await getApplicationDocumentsDirectory();
    return Directory(p.join(support.path, 'http_dump'));
  } catch (_) {
    return Directory(p.join(Directory.current.path, 'http_dump'));
  }
}

/// 同一次会话里的文档请求共用序号，避免文件名冲突。
final class HttpDumpSink {
  HttpDumpSink({Future<Directory> Function()? directory})
    : _directory = directory ?? defaultHttpDumpDirectory;

  final Future<Directory> Function() _directory;
  int _sequence = 0;
  Future<Directory>? _cached;

  int nextSequence() => ++_sequence;

  Future<Directory> directory() {
    return _cached ??= _open();
  }

  Future<Directory> _open() async {
    final directory = await _directory();
    await directory.create(recursive: true);
    logger.i('HTTP dump -> ${directory.path}');
    return directory;
  }
}

/// 把一次网络请求写成响应文件和 `.meta.json`。
///
/// 响应文件是 Dio 解压后的字节，文件名带时间戳。
/// meta 记录请求、响应头、重定向和 cookie。缓存命中不写文件。
final class HttpDumpInterceptor extends Interceptor {
  HttpDumpInterceptor({
    required this.cookieJar,
    required this.sink,
    required this.channel,
  });

  final CookieJar cookieJar;
  final HttpDumpSink sink;
  final String channel;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.extra[_startedAtKey] = DateTime.now().microsecondsSinceEpoch;
    handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) async {
    try {
      await _dump(options: response.requestOptions, response: response);
    } catch (error, stackTrace) {
      logger.e('HTTP dump failed', error, stackTrace);
    }
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    try {
      await _dump(
        options: err.requestOptions,
        response: err.response,
        error: err,
      );
    } catch (error, stackTrace) {
      logger.e('HTTP dump failed', error, stackTrace);
    }
    handler.next(err);
  }

  Future<void> _dump({
    required RequestOptions options,
    Response<dynamic>? response,
    DioException? error,
  }) async {
    if (error == null && response?.extra[extraFromNetworkKey] == false) {
      return;
    }
    final sequence = sink.nextSequence();
    final finished = DateTime.now();
    final directory = await sink.directory();
    final uri = options.uri;
    final method = options.method.toUpperCase();
    final slug = _slug(uri);
    final stamp = _stamp(finished);
    final stem =
        '${stamp}_${sequence.toString().padLeft(6, '0')}'
        '_${channel}_$method${slug.isEmpty ? '' : '_$slug'}';
    final body = response == null ? null : _copyBody(response.data);
    final bodyExtension = _bodyExtension(
      response?.headers.value(Headers.contentTypeHeader),
      uri,
    );
    final bytes = body?.bytes;
    String? bodyName;
    if (bytes != null) {
      bodyName = '$stem.$bodyExtension';
      await File(p.join(directory.path, bodyName))
          .writeAsBytes(bytes, flush: true);
    }

    final startedUs = options.extra[_startedAtKey];
    final elapsedMs = startedUs is int
        ? (finished.microsecondsSinceEpoch - startedUs) ~/ 1000
        : null;
    final jar = await _loadJar(uri);
    final meta = <String, Object?>{
      'dumpedAt': finished.toIso8601String(),
      'elapsedMs': elapsedMs,
      'channel': channel,
      'request': {
        'method': method,
        'url': uri.toString(),
        'headers': _headers(options.headers),
        'queryParameters': _jsonSafe(options.queryParameters),
        'body': _requestBody(options.data),
      },
      'response': response == null
          ? null
          : {
              'statusCode': response.statusCode,
              'statusMessage': response.statusMessage,
              'headers': response.headers.map,
              'isRedirect': response.isRedirect,
              'realUri': response.realUri.toString(),
              'redirects': [
                for (final redirect in response.redirects)
                  {
                    'statusCode': redirect.statusCode,
                    'method': redirect.method,
                    'location': redirect.location.toString(),
                  },
              ],
              'fromNetwork': response.extra[extraFromNetworkKey] != false,
              'bodyFile': bodyName,
              'bodyPath': bodyName == null
                  ? null
                  : p.join(directory.path, bodyName),
              'bodyLength': bytes?.length,
              'bodySkipped': body?.skippedReason,
            },
      'cookies': {
        'request': options.headers[HttpHeaders.cookieHeader],
        'setCookie': response?.headers[HttpHeaders.setCookieHeader],
        'jar': jar.cookies,
        'jarError': jar.error,
      },
      'error': error == null
          ? null
          : {
              'type': error.type.name,
              'message': error.message,
              'statusCode': error.response?.statusCode,
            },
    };
    await File(p.join(directory.path, '$stem.meta.json')).writeAsString(
      const JsonEncoder.withIndent('  ').convert(meta),
      flush: true,
    );
  }

  Future<({List<Map<String, Object?>>? cookies, String? error})> _loadJar(
    Uri uri,
  ) async {
    try {
      final cookies = await cookieJar.loadForRequest(uri);
      return (
        cookies: [for (final cookie in cookies) _cookieJson(cookie)],
        error: null,
      );
    } catch (error) {
      return (cookies: null, error: error.toString());
    }
  }
}

final class _BodyCopy {
  const _BodyCopy(this.bytes, {this.skippedReason});

  final Uint8List? bytes;
  final String? skippedReason;
}

_BodyCopy _copyBody(Object? data) {
  if (data == null) return _BodyCopy(Uint8List(0));
  if (data is ResponseBody) {
    return const _BodyCopy(null, skippedReason: 'stream');
  }
  if (data is String) return _BodyCopy(Uint8List.fromList(utf8.encode(data)));
  if (data is Uint8List) return _BodyCopy(data);
  if (data is List<int>) return _BodyCopy(Uint8List.fromList(data));
  try {
    return _BodyCopy(Uint8List.fromList(utf8.encode(jsonEncode(data))));
  } catch (_) {
    return _BodyCopy(Uint8List.fromList(utf8.encode(data.toString())));
  }
}

Map<String, Object?> _cookieJson(Cookie cookie) {
  return {
    'name': cookie.name,
    'value': cookie.value,
    'domain': cookie.domain,
    'path': cookie.path,
    'expires': cookie.expires?.toIso8601String(),
    'maxAge': cookie.maxAge,
    'secure': cookie.secure,
    'httpOnly': cookie.httpOnly,
    'sameSite': cookie.sameSite?.name,
  };
}

Map<String, Object?> _headers(Map<dynamic, dynamic> headers) {
  final encoded = <String, Object?>{};
  headers.forEach((key, value) {
    if (value == null) return;
    encoded['$key'] = value is List
        ? [for (final item in value) '$item']
        : '$value';
  });
  return encoded;
}

Object? _jsonSafe(Object? value) {
  try {
    jsonEncode(value);
    return value;
  } catch (_) {
    return value?.toString();
  }
}

Object? _requestBody(Object? data) {
  if (data == null) return null;
  if (data is FormData) {
    return {
      'type': 'formData',
      'fields': {for (final field in data.fields) field.key: field.value},
      'files': [
        for (final file in data.files)
          {
            'key': file.key,
            'filename': file.value.filename,
            'length': file.value.length,
          },
      ],
    };
  }
  if (data is String) return _clipText(data);
  if (data is List<int>) {
    final preview = _utf8Preview(data);
    return preview ?? {'type': 'bytes', 'length': data.length};
  }
  try {
    jsonEncode(data);
    return data;
  } catch (_) {
    return data.toString();
  }
}

Object? _clipText(String text) {
  if (text.length <= _maxMetaText) return text;
  return {
    'text': text.substring(0, _maxMetaText),
    'truncated': true,
    'length': text.length,
  };
}

Object? _utf8Preview(List<int> bytes) {
  try {
    return _clipText(utf8.decode(bytes));
  } on FormatException {
    return null;
  }
}

String _bodyExtension(String? contentType, Uri uri) {
  final type = contentType?.split(';').first.trim().toLowerCase();
  final mapped = type == null ? null : _contentTypeExtensions[type];
  if (mapped != null) return mapped;
  final ext = p.extension(uri.path).replaceFirst('.', '').toLowerCase();
  if (RegExp(r'^[a-z0-9]{1,5}$').hasMatch(ext)) return ext;
  return 'bin';
}

String _slug(Uri uri) {
  final slug = '${uri.host}${uri.path}'
      .replaceAll(RegExp(r'[^A-Za-z0-9._-]+'), '_')
      .replaceAll(RegExp(r'_+'), '_')
      .replaceAll(RegExp(r'^[._]+|[._]+$'), '');
  if (slug.length <= 60) return slug;
  return slug.substring(0, 60).replaceAll(RegExp(r'[._]+$'), '');
}

String _stamp(DateTime time) {
  String two(int value) => value.toString().padLeft(2, '0');
  String three(int value) => value.toString().padLeft(3, '0');
  return '${time.year}${two(time.month)}${two(time.day)}'
      'T${two(time.hour)}${two(time.minute)}${two(time.second)}'
      '${three(time.millisecond)}';
}

Directory? _projectRoot(Directory start) {
  var dir = start;
  for (var i = 0; i < 8; i++) {
    if (File(p.join(dir.path, 'pubspec.yaml')).existsSync()) return dir;
    final parent = dir.parent;
    if (parent.path == dir.path) return null;
    dir = parent;
  }
  return null;
}
