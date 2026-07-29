import 'dart:async';
import 'dart:convert';
import 'package:catweb/data/controller/settings.dart';
import 'package:catweb/data/database/database.dart';
import 'package:catweb/data/models/site_render_model.dart';
import 'package:catweb/data/site_runtime/site_compiler.dart';

import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'db.dart';

class SiteService {
  final SettingService setting;
  final DbService db;

  SiteService({required this.setting, required this.db});

  final ValueNotifier<SiteRenderConfigModel?> currentSiteNotifier =
      ValueNotifier(null);
  final ValueNotifier<String?> loadFailureNotifier = ValueNotifier(null);

  SiteRenderConfigModel? get currentSite => currentSiteNotifier.value;

  set currentSite(SiteRenderConfigModel? v) => currentSiteNotifier.value = v;

  late final StreamSubscription<List<WebTableData>> siteDbChangeListener;

  Future setNewSite([WebTableData? db]) async {
    final previous = currentSite;
    if (db == null) {
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
      currentSite = SiteRenderConfigModel(dbEntity: db, definition: definition);
      loadFailureNotifier.value = null;
    } catch (error) {
      currentSite = null;
      final detail = error is SiteCompileException
          ? error.errors.join('\n')
          : error.toString();
      loadFailureNotifier.value = '$detail\n请重新导入 schemaVersion 2 站点规则。';
    }
    await previous?.dispose();
    if (currentSite case final site?) setting.setDefaultSite(site.id);
  }

  Future setDefaultSite() async {
    final sites = await db.webDao.getAll();
    final df = sites.firstWhereOrNull((e) => e.id == setting.defaultSite);
    await setNewSite(df);
  }

  Future autoSelectNewSite() async {
    final sites = await db.webDao.getAll();
    if (sites.isNotEmpty) {
      await setNewSite(sites.first);
    } else {
      await setNewSite();
    }
  }

  Future init() async {
    try {
      await setDefaultSite();
    } catch (e) {
      print(e);
    }
    siteDbChangeListener = db.webDao.getAllStream().listen(onDbChanged);
  }

  void onDbChanged(List<WebTableData> event) {
    // 检测当前网站的配置是否被更新
    final currentNewSite = event.firstWhereOrNull((e) => e.id == id);
    if (currentNewSite != null) {
      if (currentNewSite.loginCookies != currentSite!.dbEntity.loginCookies ||
          currentNewSite.blueprint != currentSite!.dbEntity.blueprint) {
        setNewSite(currentNewSite);
        return;
      }
    }

    // 检测是否被删除
    if (id != null && currentNewSite == null) {
      autoSelectNewSite();
      return;
    }

    if (currentSite == null && event.isNotEmpty) {
      autoSelectNewSite();
      return;
    }
  }

  int? get id => currentSite?.id;
}
