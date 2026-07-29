import 'dart:async';
import 'dart:typed_data';

import 'package:catweb/data/loading/cancellation.dart';
import 'package:catweb/data/loading/load_failure.dart';
import 'package:catweb/data/loading/resource_loader.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

/// 图片资源的业务用途；用途会参与缓存键计算。
enum ImageResourceVariant { preview, reader }

/// 与 Flutter 图片组件无关的图片请求描述。
final class ImageResourceDescriptor {
  const ImageResourceDescriptor({
    required this.uri,
    required this.cacheIdentity,
  });

  /// 从字符串 URL 创建描述；未指定 [cacheKey] 时使用 URL 作为缓存身份。
  factory ImageResourceDescriptor.fromUrl(String url, {String? cacheKey}) {
    if (url.isEmpty) throw StateError('Image URL is empty');
    return ImageResourceDescriptor(
      uri: Uri.parse(url),
      cacheIdentity: cacheKey ?? url,
    );
  }

  final Uri uri;
  final String cacheIdentity;
}

/// 图片资源的稳定去重键。
///
/// [siteId]、[cacheIdentity] 和 [variant] 决定相等性，使同一站点内的预览图与
/// 阅读图可以共享各自稳定的任务和磁盘缓存。
final class ImageResourceKey {
  const ImageResourceKey({
    required this.siteId,
    required this.uri,
    required this.cacheIdentity,
    required this.variant,
  });

  final String siteId;
  final Uri uri;
  final String cacheIdentity;
  final ImageResourceVariant variant;

  @override
  bool operator ==(Object other) =>
      other is ImageResourceKey &&
      other.siteId == siteId &&
      other.cacheIdentity == cacheIdentity &&
      other.variant == variant;

  @override
  int get hashCode => Object.hash(siteId, cacheIdentity, variant);
}

/// 统一管理预览图与阅读图字节加载的仓库。
///
/// 仓库只返回字节资源 handle，Flutter codec 和 widget 生命周期由 UI 适配层负责。
final class ImageRepository {
  ImageRepository({
    required this.siteId,
    required Dio dio,
    required CacheOptions cacheOptions,
    required int maxConcurrency,
    LoadFailureMapper failureMapper = const DefaultLoadFailureMapper(),
  }) : _loader = ResourceLoader<ImageResourceKey, Uint8List>(
         source: DioImageResourceSource(dio: dio, cacheOptions: cacheOptions),
         maxConcurrency: maxConcurrency,
         retention: ResourceRetention.whileReferenced,
         failureMapper: failureMapper,
       );

  final String siteId;
  final ResourceLoader<ImageResourceKey, Uint8List> _loader;

  /// 获取图片资源；返回的 handle 必须由调用方释放。
  ResourceHandle<ImageResourceKey, Uint8List> acquire(
    ImageResourceDescriptor image, {
    ImageResourceVariant variant = ImageResourceVariant.preview,
    int priority = 0,
  }) {
    return _loader.acquire(
      ImageResourceKey(
        siteId: siteId,
        uri: image.uri,
        cacheIdentity: image.cacheIdentity,
        variant: variant,
      ),
      priority: priority,
    );
  }

  /// 取消全部图片任务并释放调度器。
  Future<void> dispose() => _loader.dispose();
}

/// 使用 Dio 和磁盘缓存实现的图片资源源。
final class DioImageResourceSource
    implements ResourceSource<ImageResourceKey, Uint8List> {
  const DioImageResourceSource({required this.dio, required this.cacheOptions});

  final Dio dio;
  final CacheOptions cacheOptions;

  @override
  Future<ResourceLoadResult<Uint8List>> load(
    ImageResourceKey key,
    CancellationScope cancellation,
    void Function(ResourceProgress progress) onProgress,
  ) async {
    cancellation.throwIfCancelled();
    final cancelToken = CancelToken();
    unawaited(
      cancellation.whenCancelled.then((reason) {
        if (!cancelToken.isCancelled) cancelToken.cancel(reason);
      }),
    );
    try {
      final response = await dio.get<Uint8List>(
        key.uri.toString(),
        cancelToken: cancelToken,
        onReceiveProgress: (loaded, total) {
          onProgress(
            ResourceProgress(loaded: loaded, total: total > 0 ? total : null),
          );
        },
        options: cacheOptions
            .copyWith(
              policy: CachePolicy.forceCache,
              keyBuilder: ({headers, required url, body}) =>
                  '${key.siteId}:${key.variant.name}:${key.cacheIdentity}',
            )
            .toOptions()
            .copyWith(responseType: ResponseType.bytes),
      );
      cancellation.throwIfCancelled();
      final bytes = response.data;
      if (bytes == null || bytes.isEmpty) {
        throw StateError('Image response is empty: ${key.uri}');
      }
      return ResourceLoadResult(
        bytes,
        fromCache: response.extra[extraFromNetworkKey] == false,
      );
    } on DioException catch (error) {
      if (cancellation.isCancelled || error.type == DioExceptionType.cancel) {
        throw CancellationException(cancellation.reason);
      }
      rethrow;
    }
  }
}
