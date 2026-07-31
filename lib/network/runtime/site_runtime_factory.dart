import 'package:catweb/data/database/cookie_jar_storage.dart';
import 'package:catweb/data/database/daos/cookie_jar_dao.dart';
import 'package:catweb/data/database/database.dart';
import 'package:catweb/data/site_runtime/runtime_contracts.dart';
import 'package:catweb/data/site_runtime/site_definition.dart';
import 'package:catweb/network/runtime/dio_http_transport.dart';
import 'package:catweb/network/runtime/site_dio_factory.dart';
import 'package:catweb/network/runtime/site_session.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

final class SiteRuntimeFactory {
  const SiteRuntimeFactory({
    required this.documentCacheOptions,
    required this.imageCacheOptions,
    required this.imageConcurrency,
    required this.cookieJarDao,
  });

  final CacheOptions documentCacheOptions;
  final CacheOptions imageCacheOptions;
  final int Function() imageConcurrency;
  final CookieJarDao cookieJarDao;

  SiteSession create({
    required SiteDefinition definition,
    required WebTableData entity,
    required ParserEngine parser,
    required EnvironmentStore environment,
  }) {
    final configuredConcurrency = imageConcurrency();
    final clients = const SiteDioFactory().create(
      definition: definition,
      cookieJar: PersistCookieJar(
        ignoreExpires: false,
        storage: CookieJarStorage(entity.uuid, cookieJarDao),
      ),
      documentCacheOptions: documentCacheOptions,
      imageCacheOptions: imageCacheOptions,
    );
    return SiteSession(
      definition: definition,
      parser: parser,
      environment: environment,
      documentDio: clients.document,
      imageDio: clients.image,
      documentCacheOptions: documentCacheOptions,
      imageCacheOptions: imageCacheOptions,
      imageConcurrency: configuredConcurrency < 1 ? 1 : configuredConcurrency,
      failureMapper: const SiteRuntimeFailureMapper(),
    );
  }
}
