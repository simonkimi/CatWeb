import 'dart:async';
import 'dart:convert';

import 'package:catweb/data/controller/settings.dart';
import 'package:catweb/data/controller/site_load_failure.dart';
import 'package:catweb/data/database/database.dart';
import 'package:catweb/data/loading/load_failure.dart';
import 'package:catweb/data/models/site_render_model.dart';
import 'package:catweb/data/repositories/site_repository.dart';
import 'package:catweb/data/site_runtime/site_compiler.dart';
import 'package:catweb/network/runtime/site_runtime_factory.dart';

import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';

class SiteService {
  final SettingService setting;
  final SiteRepository repository;
  final SiteRuntimeFactory runtimeFactory;

  SiteService({
    required this.setting,
    required this.repository,
    required this.runtimeFactory,
  });

  final ValueNotifier<SiteRenderConfigModel?> currentSiteNotifier =
      ValueNotifier(null);
  final ValueNotifier<LoadFailure?> loadFailureNotifier = ValueNotifier(null);
  WebTableData? _failedSite;

  SiteRenderConfigModel? get currentSite => currentSiteNotifier.value;
  WebTableData? get failedSite => _failedSite;

  set currentSite(SiteRenderConfigModel? v) => currentSiteNotifier.value = v;

  StreamSubscription<List<WebTableData>>? _siteDbChangeListener;

  Future<void> setNewSite([WebTableData? db]) async {
    final previous = currentSite;
    if (db == null) {
      _failedSite = null;
      currentSite = null;
      loadFailureNotifier.value = null;
      await previous?.dispose();
      return;
    }

    try {
      final decoded = jsonDecode(db.blueprint);
      if (decoded is! Map) {
        throw const FormatException('站点规则必须是 JSON object');
      }
      final json = decoded.map<String, Object?>(
        (key, value) => MapEntry(key.toString(), value),
      );
      final definition = const SiteCompiler().compileJson(json).definition;
      final next = SiteRenderConfigModel(
        dbEntity: db,
        definition: definition,
        repository: repository,
        runtimeFactory: runtimeFactory,
      );
      currentSite = next;
      _failedSite = null;
      loadFailureNotifier.value = null;
    } catch (error, stackTrace) {
      _failedSite = db;
      loadFailureNotifier.value = const SiteLoadFailureMapper().map(
        error,
        stackTrace,
      );
      return;
    }
    await previous?.dispose();
    if (currentSite case final site?) setting.setDefaultSite(site.id);
  }

  Future<void> setDefaultSite() async {
    final sites = await repository.getAll();
    final df = sites.firstWhereOrNull((e) => e.id == setting.defaultSite);
    await setNewSite(df);
  }

  Future<void> autoSelectNewSite() async {
    final sites = await repository.getAll();
    if (sites.isNotEmpty) {
      await setNewSite(sites.first);
    } else {
      await setNewSite();
    }
  }

  Future<void> init() async {
    try {
      await setDefaultSite();
    } catch (e) {
      print(e);
    }
    _siteDbChangeListener = repository.watchAll().listen(onDbChanged);
  }

  void onDbChanged(List<WebTableData> event) {
    final activeSite = currentSite;
    final activeId = activeSite?.id;

    // 检测当前网站的配置是否被更新
    final currentNewSite = findSiteById(event, activeId);
    if (activeSite != null && currentNewSite != null) {
      if (currentNewSite.loginCookies != activeSite.dbEntity.loginCookies ||
          currentNewSite.blueprint != activeSite.dbEntity.blueprint) {
        unawaited(setNewSite(currentNewSite));
        return;
      }
    }

    // 检测是否被删除
    if (activeId != null && currentNewSite == null) {
      unawaited(autoSelectNewSite());
      return;
    }

    if (activeSite == null) {
      if (event.isEmpty) {
        _failedSite = null;
        loadFailureNotifier.value = null;
        return;
      }

      final failedSiteId = _failedSite?.id;
      final nextSite = failedSiteId == null
          ? event.first
          : findSiteById(event, failedSiteId) ?? event.first;
      unawaited(setNewSite(nextSite));
      return;
    }
  }

  Future<void> dispose() async {
    await _siteDbChangeListener?.cancel();
    await currentSite?.dispose();
    currentSiteNotifier.dispose();
    loadFailureNotifier.dispose();
  }

  int? get id => currentSite?.id;
}

WebTableData? findSiteById(List<WebTableData> sites, int? id) {
  if (id == null) return null;
  return sites.firstWhereOrNull((site) => site.id == id);
}
