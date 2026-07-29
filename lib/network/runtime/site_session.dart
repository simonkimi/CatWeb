import 'dart:async';

import 'package:catweb/data/loading/cancellation.dart';
import 'package:catweb/data/loading/load_failure.dart';
import 'package:catweb/data/loading/paged_loader.dart';
import 'package:catweb/data/media/image_repository.dart';
import 'package:catweb/data/site_runtime/runtime_contracts.dart';
import 'package:catweb/data/site_runtime/site_compiler.dart';
import 'package:catweb/data/site_runtime/site_definition.dart';
import 'package:catweb/data/site_runtime/site_executor.dart';
import 'package:catweb/data/site_runtime/site_page_source.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

import 'dio_http_transport.dart';

/// 一个已启用站点的运行时会话。
///
/// 会话拥有编译结果、统一执行器、文档/图片客户端和图片仓库。切换站点时应销毁整个
/// 会话；[dispose] 会立即取消站点内所有请求并等待它们退出。
final class SiteSession {
  SiteSession({
    required SiteDefinition definition,
    required ParserEngine parser,
    required EnvironmentStore environment,
    required Dio documentDio,
    required Dio imageDio,
    required CacheOptions documentCacheOptions,
    required CacheOptions imageCacheOptions,
    required int imageConcurrency,
    LoadFailureMapper failureMapper = const SiteRuntimeFailureMapper(),
  }) : site = const SiteCompiler().compile(definition),
       documentDio = documentDio,
       imageDio = imageDio {
    final delegate = DefaultSiteExecutor(
      site: site,
      transport: DioHttpTransport(
        dio: documentDio,
        cacheOptions: documentCacheOptions,
      ),
      parser: parser,
      environment: environment,
    );
    _executor = _SessionExecutor(delegate: delegate, lifetime: _lifetime);
    images = ImageRepository(
      siteId: definition.id,
      dio: imageDio,
      cacheOptions: imageCacheOptions,
      maxConcurrency: imageConcurrency,
      failureMapper: failureMapper,
    );
  }

  final CompiledSite site;
  final Dio documentDio;
  final Dio imageDio;
  final CancellationScope _lifetime = CancellationScope();
  late final _SessionExecutor _executor;
  late final ImageRepository images;
  bool _disposed = false;

  /// 当前站点的统一执行器。
  SiteExecutor get executor => _executor;

  /// 为直接返回项目列表的 endpoint 创建分页加载器。
  PagedLoader<T> createPagedLoader<T>({
    required String endpointId,
    RequestContext? context,
    Map<String, Object?> inputs = const {},
    LoadFailureMapper failureMapper = const SiteRuntimeFailureMapper(),
  }) {
    _checkNotDisposed();
    return PagedLoader<T>(
      source: SitePageSource<T>(
        executor: _executor,
        endpointId: endpointId,
        context: context,
        inputs: inputs,
      ),
      failureMapper: failureMapper,
    );
  }

  /// 为需要从解析 payload 提取项目的 endpoint 创建分页加载器。
  PagedLoader<T> createMappedPagedLoader<P, T>({
    required String endpointId,
    required PageItemsDecoder<P, T> itemsOf,
    PagePayloadListener<P>? onPayload,
    RequestContext? context,
    Map<String, Object?> inputs = const {},
    LoadFailureMapper failureMapper = const SiteRuntimeFailureMapper(),
  }) {
    _checkNotDisposed();
    return PagedLoader<T>(
      source: MappedSitePageSource<P, T>(
        executor: _executor,
        endpointId: endpointId,
        itemsOf: itemsOf,
        onPayload: onPayload,
        context: context,
        inputs: inputs,
      ),
      failureMapper: failureMapper,
    );
  }

  /// 执行一次非分页或由调用方直接管理的站点操作。
  Future<ExecutionResult<T>> execute<T>(
    SiteOperation<T> operation,
    CancellationScope cancellation,
  ) {
    _checkNotDisposed();
    return _executor.execute(operation, cancellation);
  }

  /// 取消并排空当前站点的全部请求，然后关闭网络客户端。
  Future<void> dispose() async {
    if (_disposed) return;
    _disposed = true;
    _lifetime.cancel('Site session disposed');
    await _executor.drain();
    await images.dispose();
    documentDio.close(force: true);
    imageDio.close(force: true);
  }

  void _checkNotDisposed() {
    if (_disposed) throw StateError('SiteSession is disposed');
  }
}

final class _SessionExecutor implements SiteExecutor {
  _SessionExecutor({required this.delegate, required this.lifetime});

  final DefaultSiteExecutor delegate;
  final CancellationScope lifetime;
  final Set<Future<Object?>> _active = {};

  @override
  CompiledSite get site => delegate.site;

  @override
  Future<ExecutionResult<T>> execute<T>(
    SiteOperation<T> operation,
    CancellationScope cancellation,
  ) async {
    final linked = CancellationScope.linked([lifetime, cancellation]);
    final future = delegate.execute<T>(operation, linked);
    _active.add(future);
    try {
      return await future;
    } finally {
      _active.remove(future);
      linked.unlink();
    }
  }

  Future<void> drain() async {
    while (_active.isNotEmpty) {
      await Future.wait<Object?>(
        _active.toList(),
        eagerError: false,
      ).catchError((_) => <Object?>[]);
    }
  }
}
