import 'dart:io';

import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_db_store/dio_cache_interceptor_db_store.dart';
import 'package:path_provider/path_provider.dart';

class GlobalService {
  late final CacheOptions imageCacheOption;
  late final CacheOptions cacheOptions;

  late final DbCacheStore dbCacheStore;
  late final MemCacheStore memCacheStore;

  Future<GlobalService> init() async {
    dbCacheStore = DbCacheStore(
      databasePath: await getDocumentDir(),
    );

    memCacheStore = MemCacheStore(
      maxSize: 100 * 1024 * 1024,
      maxEntrySize: 10 * 1024 * 1024,
    );

    imageCacheOption = CacheOptions(
      store: dbCacheStore,
      policy: CachePolicy.forceCache,
      hitCacheOnErrorExcept: [401, 403, 500, 501],
      priority: CachePriority.normal,
      maxStale: const Duration(days: 14),
    );

    cacheOptions = CacheOptions(
      store: memCacheStore,
      policy: CachePolicy.noCache,
      maxStale: const Duration(days: 1),
    );
    return this;
  }

  Future<String> getDocumentDir() async {
    final path = Platform.isWindows
        ? await getApplicationSupportDirectory()
        : await getApplicationDocumentsDirectory();

    return path.path;
  }
}
