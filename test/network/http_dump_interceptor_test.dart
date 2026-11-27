import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:catweb/data/site_runtime/site_definition.dart';
import 'package:catweb/network/interceptor/http_dump_interceptor.dart';
import 'package:catweb/network/runtime/site_dio_factory.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:path/path.dart' as p;
import 'package:test/test.dart';

void main() {
  test('DEBUG_HTTP_DUMP=1 enables dumping', () {
    expect(debugHttpDumpEnabled, isFalse);
    dotenv.loadFromString(envString: 'DEBUG_HTTP_DUMP=1');
    addTearDown(dotenv.clean);
    expect(debugHttpDumpEnabled, isTrue);

    dotenv.loadFromString(envString: 'DEBUG_HTTP_DUMP=0');
    expect(debugHttpDumpEnabled, isFalse);
  });

  test('writes the response body and a meta file with cookies', () async {
    final directory = _tempDir();
    final jar = CookieJar();
    await jar.saveFromResponse(Uri.parse('https://e-hentai.org/'), [
      Cookie('session', 'from-jar'),
    ]);
    final clients = _clients(directory: directory, jar: jar);
    final adapter = _ScriptedAdapter([
      ResponseBody.fromBytes(
        utf8.encode('<html>ok</html>'),
        200,
        headers: {
          Headers.contentTypeHeader: ['text/html; charset=utf-8'],
          HttpHeaders.setCookieHeader: ['theme=dark; Path=/; HttpOnly'],
        },
      ),
    ]);
    clients.document.httpClientAdapter = adapter;

    await clients.document.post<List<int>>(
      'https://e-hentai.org/g/1',
      data: {'q': 'cat'},
      options: Options(
        responseType: ResponseType.bytes,
        headers: {'X-Debug': '1'},
      ),
    );

    final dumped = _dumpedFiles(directory);
    expect(dumped.bodies, hasLength(1));
    expect(dumped.metas, hasLength(1));
    final bodyName = p.basename(dumped.bodies.single.path);
    final stem = p.basenameWithoutExtension(dumped.bodies.single.path);
    expect(
      bodyName,
      matches(
        RegExp(r'^\d{8}T\d{9}_\d{6}_document_POST_e-hentai\.org_g_1\.html$'),
      ),
    );
    expect(p.basename(dumped.metas.single.path), '$stem.meta.json');
    expect(dumped.bodies.single.readAsStringSync(), '<html>ok</html>');

    final meta = jsonDecode(dumped.metas.single.readAsStringSync()) as Map;
    expect(meta['channel'], 'document');
    expect(meta['request']['method'], 'POST');
    expect(meta['request']['url'], 'https://e-hentai.org/g/1');
    expect(meta['request']['body'], {'q': 'cat'});
    expect(_header(meta['request']['headers'] as Map, 'x-debug'), '1');
    expect(meta['request']['headers']['cookie'], contains('session=from-jar'));
    expect(meta['response']['statusCode'], 200);
    expect(meta['response']['bodyFile'], bodyName);
    expect(meta['response']['bodyLength'], '<html>ok</html>'.length);
    expect(meta['cookies']['request'], contains('session=from-jar'));
    expect(meta['cookies']['setCookie'], ['theme=dark; Path=/; HttpOnly']);
    final jarCookies = meta['cookies']['jar'] as List;
    expect(
      jarCookies
          .map((cookie) => '${cookie['name']}=${cookie['value']}')
          .toSet(),
      containsAll(['session=from-jar', 'theme=dark']),
    );
    expect(
      jarCookies.singleWhere((cookie) => cookie['name'] == 'theme')['httpOnly'],
      isTrue,
    );
    expect(meta['error'], isNull);
    _close(clients);
  });

  test('writes the error response without swallowing the failure', () async {
    final directory = _tempDir();
    final clients = _clients(directory: directory);
    clients.document.httpClientAdapter = _ScriptedAdapter([
      ResponseBody.fromBytes(
        utf8.encode('nope'),
        500,
        headers: {
          Headers.contentTypeHeader: ['text/plain'],
        },
      ),
    ]);

    await expectLater(
      clients.document.get<List<int>>(
        'https://e-hentai.org/missing',
        options: Options(responseType: ResponseType.bytes),
      ),
      throwsA(isA<DioException>()),
    );

    final dumped = _dumpedFiles(directory);
    expect(dumped.bodies.single.readAsStringSync(), 'nope');
    expect(p.basename(dumped.bodies.single.path), endsWith('.txt'));
    final meta = jsonDecode(dumped.metas.single.readAsStringSync()) as Map;
    expect(meta['response']['statusCode'], 500);
    expect(meta['error']['type'], 'badResponse');
    expect(meta['error']['statusCode'], 500);
    _close(clients);
  });

  test(
    'keeps the request alive when the dump directory cannot be created',
    () async {
      final clients = _clients(
        directory: Directory('unused'),
        directoryBuilder: () async => throw StateError('disk'),
      );
      clients.document.httpClientAdapter = _ScriptedAdapter([
        ResponseBody.fromBytes(utf8.encode('ok'), 200),
      ]);

      final response = await clients.document.get<List<int>>(
        'https://e-hentai.org/',
        options: Options(responseType: ResponseType.bytes),
      );

      expect(utf8.decode(response.data!), 'ok');
      _close(clients);
    },
  );

  test('does not dump a cache hit', () async {
    final directory = _tempDir();
    final clients = _clients(
      directory: directory,
      policy: CachePolicy.forceCache,
    );
    final adapter = _ScriptedAdapter([
      ResponseBody.fromBytes(
        utf8.encode('<html>cached</html>'),
        200,
        headers: {
          Headers.contentTypeHeader: ['text/html'],
        },
      ),
    ]);
    clients.document.httpClientAdapter = adapter;

    final options = Options(responseType: ResponseType.bytes);
    await clients.document.get<List<int>>(
      'https://e-hentai.org/g/9',
      options: options,
    );
    await clients.document.get<List<int>>(
      'https://e-hentai.org/g/9',
      options: options,
    );

    expect(adapter.fetches, 1);
    expect(_dumpedFiles(directory).bodies, hasLength(1));
    expect(_dumpedFiles(directory).metas, hasLength(1));
    _close(clients);
  });

  test('installs the interceptor after cookies and before the cache', () {
    final enabled = _clients(directory: _tempDir());
    final types = enabled.document.interceptors.map((item) => item.runtimeType);
    expect(
      types.toList().indexOf(CookieManager),
      lessThan(types.toList().indexOf(HttpDumpInterceptor)),
    );
    expect(
      types.toList().indexOf(HttpDumpInterceptor),
      lessThan(types.toList().indexOf(DioCacheInterceptor)),
    );
    expect(enabled.image.interceptors.whereType<HttpDumpInterceptor>(), isEmpty);

    final disabled = const SiteDioFactory().create(
      definition: const SiteDefinition(baseUrl: 'https://example.test/'),
      cookieJar: CookieJar(),
      documentCacheOptions: CacheOptions(store: MemCacheStore()),
      imageCacheOptions: CacheOptions(store: MemCacheStore()),
    );
    expect(
      disabled.document.interceptors.whereType<HttpDumpInterceptor>(),
      isEmpty,
    );
    _close(enabled);
    _close(disabled);
  });
}

SiteDioClients _clients({
  required Directory directory,
  CookieJar? jar,
  CachePolicy policy = CachePolicy.noCache,
  Future<Directory> Function()? directoryBuilder,
}) {
  return SiteDioFactory().create(
    definition: const SiteDefinition(baseUrl: 'https://e-hentai.org/'),
    cookieJar: jar ?? CookieJar(),
    documentCacheOptions: CacheOptions(store: MemCacheStore(), policy: policy),
    imageCacheOptions: CacheOptions(store: MemCacheStore()),
    dumpSink: HttpDumpSink(
      directory: directoryBuilder ?? () async => directory,
    ),
  );
}

Directory _tempDir() {
  final directory = Directory.systemTemp.createTempSync('catweb_http_dump');
  addTearDown(() {
    if (directory.existsSync()) directory.deleteSync(recursive: true);
  });
  return directory;
}

({List<File> bodies, List<File> metas}) _dumpedFiles(Directory directory) {
  final files = directory.listSync().whereType<File>().toList();
  return (
    bodies: files.where((file) => !file.path.endsWith('.meta.json')).toList(),
    metas: files.where((file) => file.path.endsWith('.meta.json')).toList(),
  );
}

String? _header(Map<dynamic, dynamic> headers, String name) {
  for (final entry in headers.entries) {
    if ('${entry.key}'.toLowerCase() == name) return entry.value?.toString();
  }
  return null;
}

void _close(SiteDioClients clients) {
  clients.document.close(force: true);
  clients.image.close(force: true);
}

final class _ScriptedAdapter implements HttpClientAdapter {
  _ScriptedAdapter(this._responses);

  final List<ResponseBody> _responses;
  var fetches = 0;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    final response = _responses[fetches];
    fetches += 1;
    return response;
  }

  @override
  void close({bool force = false}) {}
}
