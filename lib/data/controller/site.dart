import 'dart:async';
import 'dart:convert';
import 'package:catweb/data/controller/settings.dart';
import 'package:catweb/data/database/database.dart';
import 'package:catweb/data/models/site/site_blueprint.dart';
import 'package:catweb/data/models/site_render_model.dart';
import 'package:catweb/get.dart';
import 'package:catweb/utils/iter_helper.dart';
import 'package:flutter/cupertino.dart';
import 'db.dart';

class SiteService {
  final ValueNotifier<SiteRenderConfigModel?> currentSiteNotifier =
      ValueNotifier(null);

  SiteRenderConfigModel? get currentSite => currentSiteNotifier.value;

  set currentSite(SiteRenderConfigModel? v) => currentSiteNotifier.value = v;

  late final StreamSubscription<List<WebTableData>> siteDbChangeListener;

  final SettingService setting = inject();
  final DbService db = inject();

  Future setNewSite([WebTableData? db]) async {
    if (db == null) {
      currentSite = null;
      return;
    }

    currentSite = SiteRenderConfigModel(
      dbEntity: db,
      blueMap: SiteBlueprint.fromJson(jsonDecode(db.blueprint)),
    );
    setting.setDefaultSite(currentSite!.id);
  }

  Future setDefaultSite() async {
    final sites = await db.webDao.getAll();
    final df = sites.get((e) => e.id == setting.defaultSite);
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
    final currentNewSite = event.get((e) => e.id == id);
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
