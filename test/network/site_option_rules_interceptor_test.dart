import 'dart:typed_data';

import 'package:catweb/data/site_runtime/site_definition.dart';
import 'package:catweb/network/runtime/site_dio_factory.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:test/test.dart';

void main() {
  test('injects cookies and headers whose pattern matches the URL', () async {
    final jar = CookieJar();
    await jar.saveFromResponse(Uri.parse('https://e-hentai.org/'), [
      Cookie('session', 'from-jar'),
    ]);
    final clients = const SiteDioFactory().create(
      definition: SiteDefinition(
        baseUrl: 'https://e-hentai.org/',
        options: SiteOptions(
          headers: const [
            DomainValueRule(
              mode: DomainMatchMode.exact,
              pattern: 'e-hentai.org',
              value: 'host=e-hentai.org',
            ),
            DomainValueRule(
              mode: DomainMatchMode.exact,
              pattern: 'api.example',
              value: 'x-skip=1',
            ),
            DomainValueRule(mode: DomainMatchMode.all, value: 'x-all=1'),
          ],
          cookies: const [
            DomainValueRule(
              mode: DomainMatchMode.suffix,
              pattern: 'e-hentai.org',
              value: 'nw=1',
            ),
            DomainValueRule(
              mode: DomainMatchMode.keyword,
              pattern: 'hentai',
              value: 'ipb_member_id=42',
            ),
            DomainValueRule(
              mode: DomainMatchMode.regex,
              pattern: r'^e-hentai\.org$',
              value: 'seen=1',
            ),
            DomainValueRule(
              mode: DomainMatchMode.regex,
              pattern: r'e-hentai\.org',
              value: 'ipb_pass_hash=',
            ),
            DomainValueRule(
              mode: DomainMatchMode.suffix,
              pattern: 'other.example',
              value: 'skip=1',
            ),
            DomainValueRule(
              mode: DomainMatchMode.regex,
              pattern: '(',
              value: 'broken=1',
            ),
          ],
        ),
      ),
      cookieJar: jar,
      documentCacheOptions: CacheOptions(store: MemCacheStore()),
      imageCacheOptions: CacheOptions(store: MemCacheStore()),
    );
    final adapter = _CaptureAdapter();
    clients.document.httpClientAdapter = adapter;

    await clients.document.get<List<int>>(
      'https://e-hentai.org/?page=0&f_search',
      options: Options(responseType: ResponseType.bytes),
    );

    expect(adapter.headers?['host'], 'e-hentai.org');
    expect(adapter.headers?['x-all'], '1');
    expect(adapter.headers?.containsKey('x-skip'), isFalse);
    expect(_cookiePairs(adapter.headers?['cookie']), {
      'nw=1',
      'ipb_member_id=42',
      'seen=1',
      'session=from-jar',
    });
    clients.document.close(force: true);
    clients.image.close(force: true);
  });

  test('leaves the cookie header empty when no rule matches', () async {
    final clients = const SiteDioFactory().create(
      definition: SiteDefinition(
        baseUrl: 'https://example.test/',
        options: const SiteOptions(
          cookies: [
            DomainValueRule(
              mode: DomainMatchMode.exact,
              pattern: 'e-hentai.org',
              value: 'nw=1',
            ),
          ],
        ),
      ),
      cookieJar: CookieJar(),
      documentCacheOptions: CacheOptions(store: MemCacheStore()),
      imageCacheOptions: CacheOptions(store: MemCacheStore()),
    );
    final adapter = _CaptureAdapter();
    clients.document.httpClientAdapter = adapter;

    await clients.document.get<List<int>>(
      'https://example.test/',
      options: Options(responseType: ResponseType.bytes),
    );

    expect(adapter.headers?['cookie'], isNull);
    clients.document.close(force: true);
    clients.image.close(force: true);
  });
}

Set<String> _cookiePairs(Object? header) {
  final value = header as String?;
  if (value == null || value.isEmpty) return {};
  return value.split('; ').map((part) => part.trim()).toSet();
}

final class _CaptureAdapter implements HttpClientAdapter {
  Map<String, dynamic>? headers;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    headers = options.headers;
    return ResponseBody.fromBytes(const [1], 200);
  }

  @override
  void close({bool force = false}) {}
}
