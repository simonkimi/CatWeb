import 'dart:async';
import 'dart:typed_data';

import 'package:catweb/data/loading/cancellation.dart';
import 'package:catweb/data/loading/load_failure.dart';
import 'package:catweb/data/site_runtime/runtime_contracts.dart';
import 'package:catweb/data/site_runtime/site_compiler.dart';
import 'package:catweb/data/site_runtime/site_definition.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

/// 传输层可分类、可判断重试能力的异常。
final class TransportException implements Exception {
  const TransportException({
    required this.message,
    required this.retryable,
    this.statusCode,
    this.cause,
  });

  final String message;
  final bool retryable;
  final int? statusCode;
  final Object? cause;

  @override
  String toString() => message;
}

/// 使用 Dio 实现的结构化 HTTP 传输层。
///
/// 仅对允许重试的幂等请求处理连接错误、超时、HTTP 429 和 5xx；取消会直接向上传播，
/// 不会被转换成网络失败。
final class DioHttpTransport implements HttpTransport {
  const DioHttpTransport({
    required this.dio,
    required this.cacheOptions,
    this.retryPolicy = const TransportRetryPolicy(),
  });

  final Dio dio;
  final CacheOptions cacheOptions;
  final TransportRetryPolicy retryPolicy;

  @override
  Future<RawResponse> send(
    ResolvedRequest request,
    CancellationScope cancellation,
  ) async {
    for (var attempt = 1; ; attempt++) {
      try {
        return await _sendOnce(request, cancellation);
      } on TransportException catch (error) {
        if (!error.retryable || attempt >= retryPolicy.maxAttempts) rethrow;
        await _waitBeforeRetry(attempt, cancellation);
      }
    }
  }

  Future<RawResponse> _sendOnce(
    ResolvedRequest request,
    CancellationScope cancellation,
  ) async {
    cancellation.throwIfCancelled();
    final cancelToken = CancelToken();
    unawaited(
      cancellation.whenCancelled.then((reason) {
        if (!cancelToken.isCancelled) cancelToken.cancel(reason);
      }),
    );

    final (data, contentType) = switch (request.body) {
      NoResolvedRequestBody() => (null, null),
      JsonResolvedRequestBody(:final value) => (value, Headers.jsonContentType),
      FormResolvedRequestBody(:final fields) => (
        fields,
        Headers.formUrlEncodedContentType,
      ),
      TextResolvedRequestBody(:final value) => (
        value,
        Headers.textPlainContentType,
      ),
    };
    final options = Options(
      method: request.method.name.toUpperCase(),
      headers: request.headers,
      contentType: contentType,
      responseType: ResponseType.bytes,
      validateStatus: (_) => true,
      extra: _cacheOptions(request).toExtra(),
    );

    try {
      final response = await dio.request<List<int>>(
        request.uri.toString(),
        data: data,
        options: options,
        cancelToken: cancelToken,
      );
      cancellation.throwIfCancelled();
      final statusCode = response.statusCode ?? 0;
      if (statusCode < 200 || statusCode >= 300) {
        throw TransportException(
          message: 'HTTP $statusCode for ${request.uri}',
          statusCode: statusCode,
          retryable:
              request.canRetryAutomatically &&
              (statusCode == 429 || statusCode >= 500),
        );
      }
      return RawResponse(
        statusCode: statusCode,
        body: Uint8List.fromList(response.data ?? const []),
        headers: response.headers.map,
      );
    } on DioException catch (error) {
      if (cancellation.isCancelled || error.type == DioExceptionType.cancel) {
        throw CancellationException(cancellation.reason);
      }
      throw TransportException(
        message: error.message ?? 'Network request failed',
        retryable: request.canRetryAutomatically && _isRetryable(error),
        statusCode: error.response?.statusCode,
        cause: error,
      );
    }
  }

  Future<void> _waitBeforeRetry(
    int failedAttempt,
    CancellationScope cancellation,
  ) async {
    cancellation.throwIfCancelled();
    await Future.any<void>([
      Future<void>.delayed(retryPolicy.delayFor(failedAttempt)),
      cancellation.whenCancelled.then<void>((reason) {
        throw CancellationException(reason);
      }),
    ]);
    cancellation.throwIfCancelled();
  }

  CacheOptions _cacheOptions(ResolvedRequest request) {
    final policy = switch ((request.cachePolicy, request.cacheDirective)) {
      (EndpointCachePolicy.noCache, _) => CachePolicy.noCache,
      (_, CacheDirective.refresh) => CachePolicy.refreshForceCache,
      (EndpointCachePolicy.cacheFirst, _) => CachePolicy.forceCache,
      (EndpointCachePolicy.networkFirst, _) => CachePolicy.request,
    };
    return cacheOptions.copyWith(policy: policy);
  }

  bool _isRetryable(DioException error) {
    return switch (error.type) {
      DioExceptionType.connectionTimeout ||
      DioExceptionType.sendTimeout ||
      DioExceptionType.receiveTimeout ||
      DioExceptionType.transformTimeout ||
      DioExceptionType.connectionError ||
      DioExceptionType.unknown => true,
      DioExceptionType.badResponse =>
        error.response?.statusCode == 429 ||
            (error.response?.statusCode ?? 0) >= 500,
      DioExceptionType.cancel || DioExceptionType.badCertificate => false,
    };
  }
}

/// 自动重试次数和退避间隔策略。
final class TransportRetryPolicy {
  const TransportRetryPolicy({
    this.maxAttempts = 3,
    this.baseDelay = const Duration(milliseconds: 250),
  }) : assert(maxAttempts > 0);

  final int maxAttempts;
  final Duration baseDelay;

  /// 返回第 [failedAttempt] 次失败后的等待时间。
  Duration delayFor(int failedAttempt) =>
      Duration(microseconds: baseDelay.inMicroseconds * failedAttempt);
}

/// 将站点运行时及 Dio 异常映射为统一加载失败。
final class SiteRuntimeFailureMapper implements LoadFailureMapper {
  const SiteRuntimeFailureMapper();

  @override
  LoadFailure map(Object error, StackTrace stackTrace) {
    return switch (error) {
      CancellationException() => LoadFailure(
        kind: LoadFailureKind.cancelled,
        error: error,
        stackTrace: stackTrace,
        retryable: false,
      ),
      TransportException(:final statusCode, :final retryable) => LoadFailure(
        kind: statusCode == null
            ? LoadFailureKind.network
            : LoadFailureKind.http,
        error: error,
        stackTrace: stackTrace,
        retryable: retryable,
      ),
      ParserUnavailableException() => LoadFailure(
        kind: LoadFailureKind.parsing,
        error: error,
        stackTrace: stackTrace,
        retryable: false,
      ),
      ParserException() => LoadFailure(
        kind: LoadFailureKind.parsing,
        error: error,
        stackTrace: stackTrace,
        retryable: false,
      ),
      PersistenceException() => LoadFailure(
        kind: LoadFailureKind.persistence,
        error: error,
        stackTrace: stackTrace,
        retryable: true,
      ),
      DioException(:final response) => LoadFailure(
        kind: response?.statusCode == null
            ? LoadFailureKind.network
            : LoadFailureKind.http,
        error: error,
        stackTrace: stackTrace,
        retryable: _isRetryableDioFailure(error),
      ),
      SiteCompileException() || SiteRuntimeException() => LoadFailure(
        kind: LoadFailureKind.configuration,
        error: error,
        stackTrace: stackTrace,
        retryable: false,
      ),
      _ => LoadFailure(
        kind: LoadFailureKind.unknown,
        error: error,
        stackTrace: stackTrace,
        retryable: true,
      ),
    };
  }
}

bool _isRetryableDioFailure(DioException error) {
  final statusCode = error.response?.statusCode;
  if (statusCode != null) return statusCode == 429 || statusCode >= 500;
  return switch (error.type) {
    DioExceptionType.connectionTimeout ||
    DioExceptionType.sendTimeout ||
    DioExceptionType.receiveTimeout ||
    DioExceptionType.transformTimeout ||
    DioExceptionType.connectionError ||
    DioExceptionType.unknown => true,
    DioExceptionType.badResponse ||
    DioExceptionType.cancel ||
    DioExceptionType.badCertificate => false,
  };
}
