import 'dart:async';
import 'dart:convert';

import 'package:catweb/data/controller/settings.dart';
import 'package:catweb/data/database/database.dart';
import 'package:catweb/data/models/site_model/site_blue_map.dart';
import 'package:catweb/data/models/site_render_model.dart';
import 'package:catweb/utils/iter_helper.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'db.dart';

final siteProvider =
    StateNotifierProvider<SiteNotifier, SiteRenderConfigModel?>(
  (ref) => SiteNotifier(
    setting: ref.watch(settingsProvider.notifier),
    db: ref.read(dbProvider),
  ),
);

class SiteNotifier extends StateNotifier<SiteRenderConfigModel?> {
  SiteNotifier({
    required this.setting,
    required this.db,
  }) : super(null);

  late final StreamSubscription<List<WebTableData>> siteDbChangeListener;

  final SettingsNotifier setting;
  final DbService db;

  Future setNewSite([WebTableData? db]) async {
    if (db == null) {
      state = null;
      return;
    }

    state = SiteRenderConfigModel(
      dbEntity: db,
      blueMap: SiteBlueMap.fromJson(jsonDecode(db.blueprint)),
    );
    setting.setDefaultSite(state!.id);
  }

  Future setDefaultSite() async {
    final sites = await db.webDao.getAll();
    final df = sites.get((e) => e.id == setting.state.defaultSite);
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
      if (currentNewSite.loginCookies != state!.dbEntity.loginCookies ||
          currentNewSite.blueprint != state!.dbEntity.blueprint) {
        setNewSite(currentNewSite);
        return;
      }
    }

    // 检测是否被删除
    if (id != null && currentNewSite == null) {
      autoSelectNewSite();
      return;
    }

    if (state == null && event.isNotEmpty) {
      autoSelectNewSite();
      return;
    }
  }

  int? get id => state?.id;
}
