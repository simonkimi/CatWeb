import 'dart:io';
import 'package:catweb/data/controller/setting_enum.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_db_store/dio_cache_interceptor_db_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart' as p;

final pref = FutureProvider((ref) async {
  return await SharedPreferences.getInstance();
});

class SettingProvider {
  // 内部储存设置
  final ValueNotifier<int> defaultSite = ValueNotifier<int>(-1);
  final ValueNotifier<String> documentDir = ValueNotifier<String>('');

  // 阅读设置
  final ValueNotifier<bool> imageMaskInDarkMode = ValueNotifier<bool>(true);
  final ValueNotifier<CardSize> cardSize =
      ValueNotifier<CardSize>(CardSize.medium);
  final ValueNotifier<int> preloadCount = ValueNotifier<int>(7);
  final ValueNotifier<ReaderDirection> readerDirectory =
      ValueNotifier<ReaderDirection>(ReaderDirection.ltr);
  final ValueNotifier<ReaderDisplayType> displayType =
      ValueNotifier<ReaderDisplayType>(ReaderDisplayType.single);

  // 并发数量
  final ValueNotifier<int> concurrencyCount = ValueNotifier<int>(5);

  // 下载设置

  // 安全设置
  final ValueNotifier<bool> protectCookie = ValueNotifier<bool>(true);
  final ValueNotifier<bool> blurWhenBackground = ValueNotifier<bool>(false);

  // 其他数据
  late final CacheOptions imageCacheOption;
  late final CacheOptions cacheOptions;

  late final DbCacheStore dbCacheStore;
  late final MemCacheStore memCacheStore;

  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    defaultSite.value = prefs.getInt('defaultSite') ?? -1;
    documentDir.value = prefs.getString('documentDir') ?? '';
    imageMaskInDarkMode.value = prefs.getBool('imageMaskInDarkMode') ?? true;
    cardSize.value = CardSize.from(prefs.getInt('cardSize') ?? 1);
    preloadCount.value = prefs.getInt('preloadCount') ?? 7;
    readerDirectory.value =
        ReaderDirection.from(prefs.getInt('readerDirectory') ?? 0);
    displayType.value =
        ReaderDisplayType.from(prefs.getInt('displayType') ?? 0);
    protectCookie.value = prefs.getBool('protectCookie') ?? true;
    blurWhenBackground.value = prefs.getBool('blurWhenBackground') ?? false;

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

  Future<void> save() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('defaultSite', defaultSite.value);
    prefs.setString('documentDir', documentDir.value);
    prefs.setBool('imageMaskInDarkMode', imageMaskInDarkMode.value);
    prefs.setInt('cardSize', cardSize.value.size);
    prefs.setInt('preloadCount', preloadCount.value);
    prefs.setInt('readerDirectory', readerDirectory.value.direction);
    prefs.setInt('displayType', displayType.value.value);
    prefs.setBool('protectCookie', protectCookie.value);
    prefs.setBool('blurWhenBackground', blurWhenBackground.value);
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
