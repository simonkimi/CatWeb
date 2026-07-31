import 'dart:convert';

import 'package:catweb/data/database/database.dart';
import 'package:catweb/data/media/image_repository.dart';
import 'package:catweb/data/repositories/site_repository.dart';
import 'package:catweb/data/site_runtime/persistent_environment_store.dart';
import 'package:catweb/data/site_runtime/runtime_contracts.dart';
import 'package:catweb/data/site_runtime/site_definition.dart';
import 'package:catweb/network/runtime/site_runtime_factory.dart';
import 'package:catweb/network/runtime/site_session.dart';
import 'package:flutter/foundation.dart';

/// Flutter 应用层持有的站点运行配置。
///
/// 该对象只适配数据库实体、UI 可监听状态和已组装的 [SiteSession]；业务页面只通过
/// [session] 和 [imageRepository] 访问加载能力。切换站点时必须调用 [dispose]。
final class SiteRenderConfigModel {
  SiteRenderConfigModel({
    required this.definition,
    required WebTableData dbEntity,
    required this.repository,
    required SiteRuntimeFactory runtimeFactory,
    this.parserEngine = const UnavailableParserEngine(),
  }) : _dbEntity = dbEntity,
       favicon = dbEntity.favicon.isNotEmpty
           ? ValueNotifier<Uint8List?>(dbEntity.favicon)
           : ValueNotifier<Uint8List?>(null) {
    final environment = _decodeEnvironment(dbEntity.env);
    _environment = PersistentEnvironmentStore(
      initial: environment,
      persist: (values) async {
        await _replaceEntity(_dbEntity.copyWith(env: jsonEncode(values)));
      },
    );
    session = runtimeFactory.create(
      definition: definition,
      parser: parserEngine,
      entity: dbEntity,
      environment: _environment,
    );
  }

  WebTableData _dbEntity;
  final SiteDefinition definition;
  final SiteRepository repository;
  final ParserEngine parserEngine;
  final ValueNotifier<Uint8List?> favicon;
  late final PersistentEnvironmentStore _environment;
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
    await repository.replace(entity);
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
