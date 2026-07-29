import 'dart:async';
import 'dart:convert';

import 'package:catweb/app.dart';
import 'package:catweb/data/controller/db.dart';
import 'package:catweb/data/controller/global.dart';
import 'package:catweb/data/controller/settings.dart';
import 'package:catweb/data/database/cookie_jar_storage.dart';
import 'package:catweb/data/database/database.dart';
import 'package:catweb/data/media/image_repository.dart';
import 'package:catweb/data/site_runtime/json_values.dart';
import 'package:catweb/data/site_runtime/runtime_contracts.dart';
import 'package:catweb/data/site_runtime/site_definition.dart';
import 'package:catweb/network/runtime/dio_http_transport.dart';
import 'package:catweb/network/runtime/site_dio_factory.dart';
import 'package:catweb/network/runtime/site_session.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:flutter/foundation.dart';

/// Flutter 应用层持有的站点运行配置。
///
/// 该对象负责把数据库、设置和 Dio 适配器组装为一个 [SiteSession]；业务页面只通过
/// [session] 和 [imageRepository] 访问加载能力。切换站点时必须调用 [dispose]。
final class SiteRenderConfigModel {
  SiteRenderConfigModel({
    required this.definition,
    required WebTableData dbEntity,
    this.parserEngine = const UnavailableParserEngine(),
  }) : _dbEntity = dbEntity,
       favicon = dbEntity.favicon.isNotEmpty
           ? ValueNotifier<Uint8List?>(dbEntity.favicon)
           : ValueNotifier<Uint8List?>(null) {
    final environment = _decodeEnvironment(dbEntity.env);
    final globalService = getIt.get<GlobalService>();
    final clients = const SiteDioFactory().create(
      definition: definition,
      cookieJar: PersistCookieJar(
        ignoreExpires: false,
        storage: CookieJarStorage(dbEntity.uuid),
      ),
      documentCacheOptions: globalService.cacheOptions,
      imageCacheOptions: globalService.imageCacheOption,
    );
    _environment = _PersistentEnvironmentStore(
      initial: environment,
      persist: (values) async {
        await _replaceEntity(_dbEntity.copyWith(env: jsonEncode(values)));
      },
    );
    final configuredConcurrency = getIt.get<SettingService>().concurrencyCount;
    session = SiteSession(
      definition: definition,
      parser: parserEngine,
      environment: _environment,
      documentDio: clients.document,
      imageDio: clients.image,
      documentCacheOptions: globalService.cacheOptions,
      imageCacheOptions: globalService.imageCacheOption,
      imageConcurrency: configuredConcurrency < 1 ? 1 : configuredConcurrency,
      failureMapper: const SiteRuntimeFailureMapper(),
    );
  }

  WebTableData _dbEntity;
  final SiteDefinition definition;
  final ParserEngine parserEngine;
  final ValueNotifier<Uint8List?> favicon;
  late final _PersistentEnvironmentStore _environment;
  late final SiteSession session;

  WebTableData get dbEntity => _dbEntity;
  String get name => definition.name;
  int get id => _dbEntity.id;
  ImageRepository get imageRepository => session.images;

  /// 顶层导航中可见的列表 endpoint。
  List<EndpointRule> get displayPage => definition.endpoints
      .where(
        (endpoint) => endpoint.visible && endpoint.kind == EndpointKind.list,
      )
      .toList(growable: false);

  /// 根据 ID 返回当前站点已校验的 endpoint。
  EndpointRule endpoint(String id) => session.site.endpoint(id);

  /// 更新并持久化站点图标。
  Future<void> setFavicon(Uint8List bytes) async {
    await _replaceEntity(_dbEntity.copyWith(favicon: bytes));
    favicon.value = bytes;
  }

  Future<void> _replaceEntity(WebTableData entity) async {
    await getIt.get<DbService>().webDao.replace(entity);
    _dbEntity = entity;
  }

  /// 销毁站点会话和可监听资源。
  Future<void> dispose() async {
    await session.dispose();
    favicon.dispose();
  }

  static Map<String, Object?> _decodeEnvironment(String source) {
    try {
      final decoded = jsonDecode(source);
      if (decoded is Map) {
        return decoded.map<String, Object?>(
          (key, value) => MapEntry(key.toString(), value),
        );
      }
    } catch (_) {}
    return const {};
  }
}

final class _PersistentEnvironmentStore implements EnvironmentStore {
  _PersistentEnvironmentStore({
    required Map<String, Object?> initial,
    required this.persist,
  }) : _values = Map<String, Object?>.of(
         freezeScalarMap(initial, path: r'$.environment'),
       );

  final Future<void> Function(Map<String, Object?> values) persist;
  Map<String, Object?> _values;
  Future<void> _tail = Future<void>.value();

  @override
  Future<Map<String, Object?>> snapshot() async {
    await _tail;
    return Map<String, Object?>.unmodifiable(_values);
  }

  @override
  Future<void> apply(Map<String, Object?> patch) {
    final frozen = freezeScalarMap(patch, path: r'$.environment.patch');
    final commit = _tail.then((_) async {
      final next = <String, Object?>{..._values, ...frozen};
      await persist(next);
      _values = next;
    });
    _tail = commit.catchError((_) {});
    return commit;
  }
}
