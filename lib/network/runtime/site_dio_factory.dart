import 'package:catweb/data/site_runtime/site_definition.dart';
import 'package:catweb/network/interceptor/encode_transform.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:dio_http_formatter/dio_http_formatter.dart';

/// 一个站点会话使用的文档与图片 Dio 客户端。
final class SiteDioClients {
  const SiteDioClients({required this.document, required this.image});

  final Dio document;
  final Dio image;
}

/// 按站点定义创建隔离 Dio 客户端的工厂。
///
/// 文档与图片共享 cookie jar，但使用各自的缓存配置和生命周期。
final class SiteDioFactory {
  const SiteDioFactory();

  /// 创建站点专用客户端。
  SiteDioClients create({
    required SiteDefinition definition,
    required CookieJar cookieJar,
    required CacheOptions documentCacheOptions,
    required CacheOptions imageCacheOptions,
  }) {
    return SiteDioClients(
      document: _createClient(
        definition: definition,
        cookieJar: cookieJar,
        cacheOptions: documentCacheOptions,
        image: false,
      ),
      image: _createClient(
        definition: definition,
        cookieJar: cookieJar,
        cacheOptions: imageCacheOptions,
        image: true,
      ),
    );
  }

  Dio _createClient({
    required SiteDefinition definition,
    required CookieJar cookieJar,
    required CacheOptions cacheOptions,
    required bool image,
  }) {
    final dio = Dio(
      BaseOptions(
        baseUrl: definition.baseUrl,
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(minutes: 5),
        sendTimeout: const Duration(seconds: 60),
      ),
    );
    dio.transformer = EncodeTransformer();
    dio.interceptors.add(CookieManager(cookieJar));
    dio.interceptors.add(DioCacheInterceptor(options: cacheOptions));
    if (!image) {
      dio.interceptors.add(HttpFormatter(includeResponseBody: false));
    }
    return dio;
  }
}
