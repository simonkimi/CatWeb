import 'dart:async';
import 'dart:typed_data';

import 'package:catweb/data/loading/cancellation.dart';
import 'package:catweb/data/site_runtime/runtime_contracts.dart';
import 'package:catweb/data/site_runtime/site_definition.dart';
import 'package:catweb/data/site_runtime/site_executor.dart';
import 'package:catweb/network/runtime/site_session.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:test/test.dart';

void main() {
  test(
    'disposing a site session cancels and drains document requests',
    () async {
      final adapter = _BlockingAdapter();
      final documentDio = Dio()..httpClientAdapter = adapter;
      final session = SiteSession(
        definition: _definition(),
        parser: const UnavailableParserEngine(),
        environment: InMemoryEnvironmentStore(),
        documentDio: documentDio,
        imageDio: Dio(),
        documentCacheOptions: CacheOptions(store: MemCacheStore()),
        imageCacheOptions: CacheOptions(store: MemCacheStore()),
        imageConcurrency: 1,
      );
      final request = session.execute<String>(
        SiteOperation<String>(endpointId: 'reader'),
        CancellationScope(),
      );
      final expectation = expectLater(
        request,
        throwsA(isA<CancellationException>()),
      );
      await adapter.started;

      await session.dispose();
      await expectation;

      expect(
        () => session.execute<String>(
          SiteOperation<String>(endpointId: 'reader'),
          CancellationScope(),
        ),
        throwsStateError,
      );
    },
  );
}

SiteDefinition _definition() => SiteDefinition(
  schemaVersion: SiteDefinition.currentSchemaVersion,
  id: 'session',
  name: 'Session',
  baseUrl: 'https://example.test/',
  parsers: [ParserRule(id: 'reader-parser', kind: EndpointKind.reader)],
  endpoints: [
    EndpointRule(
      id: 'reader',
      kind: EndpointKind.reader,
      name: 'Reader',
      request: RequestRule(method: RequestMethod.get, url: '/reader'),
      parserId: 'reader-parser',
      pagination: const PaginationRule.none(),
    ),
  ],
);

final class _BlockingAdapter implements HttpClientAdapter {
  final Completer<void> _started = Completer<void>();

  Future<void> get started => _started.future;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    _started.complete();
    await cancelFuture;
    throw DioException.requestCancelled(
      requestOptions: options,
      reason: 'cancelled',
    );
  }

  @override
  void close({bool force = false}) {}
}
