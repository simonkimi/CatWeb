import 'dart:async';
import 'dart:typed_data';

import 'package:catweb/data/loading/cancellation.dart';
import 'package:catweb/data/site_runtime/runtime_contracts.dart';
import 'package:catweb/data/site_runtime/site_definition.dart';
import 'package:catweb/network/runtime/dio_http_transport.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:test/test.dart';

void main() {
  group('DioHttpTransport', () {
    test('retries a retryable idempotent 5xx response', () async {
      final adapter = _ScriptedAdapter([500, 200]);
      final dio = Dio()..httpClientAdapter = adapter;
      final transport = DioHttpTransport(
        dio: dio,
        cacheOptions: CacheOptions(store: MemCacheStore()),
        retryPolicy: const TransportRetryPolicy(baseDelay: Duration.zero),
      );

      final response = await transport.send(
        _request(method: RequestMethod.get, canRetryAutomatically: true),
        CancellationScope(),
      );

      expect(response.statusCode, 200);
      expect(adapter.calls, 2);
      dio.close(force: true);
    });

    test('does not retry a non-idempotent request', () async {
      final adapter = _ScriptedAdapter([500, 200]);
      final dio = Dio()..httpClientAdapter = adapter;
      final transport = DioHttpTransport(
        dio: dio,
        cacheOptions: CacheOptions(store: MemCacheStore()),
        retryPolicy: const TransportRetryPolicy(baseDelay: Duration.zero),
      );

      await expectLater(
        transport.send(
          _request(method: RequestMethod.post, canRetryAutomatically: false),
          CancellationScope(),
        ),
        throwsA(isA<TransportException>()),
      );
      expect(adapter.calls, 1);
      dio.close(force: true);
    });

    test('cancels while waiting to retry', () async {
      final adapter = _ScriptedAdapter([500, 200]);
      final dio = Dio()..httpClientAdapter = adapter;
      final transport = DioHttpTransport(
        dio: dio,
        cacheOptions: CacheOptions(store: MemCacheStore()),
        retryPolicy: const TransportRetryPolicy(baseDelay: Duration(days: 1)),
      );
      final cancellation = CancellationScope();
      final future = transport.send(
        _request(method: RequestMethod.get, canRetryAutomatically: true),
        cancellation,
      );
      await adapter.firstResponse;

      cancellation.cancel('test');

      await expectLater(future, throwsA(isA<CancellationException>()));
      expect(adapter.calls, 1);
      dio.close(force: true);
    });
  });
}

ResolvedRequest _request({
  required RequestMethod method,
  required bool canRetryAutomatically,
}) {
  return ResolvedRequest(
    method: method,
    uri: Uri.parse('https://example.test/data'),
    headers: const {},
    body: const ResolvedRequestBody.none(),
    cachePolicy: EndpointCachePolicy.noCache,
    cacheDirective: CacheDirective.normal,
    canRetryAutomatically: canRetryAutomatically,
  );
}

final class _ScriptedAdapter implements HttpClientAdapter {
  _ScriptedAdapter(this.statusCodes);

  final List<int> statusCodes;
  final Completer<void> _firstResponse = Completer<void>();
  int calls = 0;

  Future<void> get firstResponse => _firstResponse.future;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    final statusCode = statusCodes[calls++];
    if (!_firstResponse.isCompleted) _firstResponse.complete();
    return ResponseBody.fromBytes(const [1], statusCode);
  }

  @override
  void close({bool force = false}) {}
}
