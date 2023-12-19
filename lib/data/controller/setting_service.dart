import 'dart:io';
import 'package:catweb/data/controller/setting_enum.dart';
import 'package:catweb/utils/pref_value.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_db_store/dio_cache_interceptor_db_store.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart' as p;

class SettingService {
  // 内部储存设置
  final PrefValue<int> defaultSite = PrefValue<int>('defaultSite', -1);
  final PrefValue<String> documentDir = PrefValue<String>('documentDir', '');

  // 阅读设置
  final PrefValue<bool> imageMaskInDarkMode =
      PrefValue<bool>('imageMaskInDarkMode', true);
  final PrefValue<CardSize> cardSize = PrefValue<CardSize>(
      'cardSize', CardSize.medium,
      converter: CardSize.from);
  final PrefValue<int> preloadCount = PrefValue<int>('preloadCount', 7);
  final PrefValue<ReaderDirection> readerDirectory =
      PrefValue<ReaderDirection>('readerDirectory', ReaderDirection.ltr);
  final PrefValue<ReaderDisplayType> displayType =
      PrefValue<ReaderDisplayType>('displayType', ReaderDisplayType.single);

  // 并发数量
  final PrefValue<int> concurrencyCount = PrefValue<int>('concurrencyCount', 5);

  // 下载设置

  // 安全设置
  final PrefValue<bool> protectCookie = PrefValue<bool>('protectCookie', true);
  final PrefValue<bool> blurWhenBackground =
      PrefValue<bool>('blurWhenBackground', false);

  // 其他数据
  late final CacheOptions imageCacheOption;
  late final CacheOptions cacheOptions;

  late final DbCacheStore dbCacheStore;
  late final MemCacheStore memCacheStore;

  Future<void> init() async {
    defaultSite.initValue();
    documentDir.initValue();
    imageMaskInDarkMode.initValue();
    cardSize.initValue();
    preloadCount.initValue();
    readerDirectory.initValue();
    displayType.initValue();
    concurrencyCount.initValue();
    protectCookie.initValue();
    blurWhenBackground.initValue();

    if (documentDir.value.isEmpty) {
      documentDir.value = await getDocumentDir();
    }

    dbCacheStore = DbCacheStore(
      databasePath: p.join(documentDir.value, 'cache'),
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
  }

  Future<String> getDocumentDir() async {
    final path = Platform.isWindows
        ? await getApplicationSupportDirectory()
        : await getApplicationDocumentsDirectory();

    final sp = await SharedPreferences.getInstance();
    await sp.setString('documentDir', path.path);
    return path.path;
  }
}
