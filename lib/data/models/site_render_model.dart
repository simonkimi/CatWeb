import 'dart:convert';
import 'dart:typed_data';

import 'package:catweb/data/database/cookie_jar_storage.dart';
import 'package:catweb/data/database/database.dart';
import 'package:catweb/data/models/ffi/result/base.dart';
import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/data/models/site_model/pages/site_page.dart';
import 'package:catweb/data/models/site_model/pages/template.dart';
import 'package:catweb/data/models/site_model/site_blue_map.dart';
import 'package:catweb/network/client/client.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:get/get.dart';

import '../controller/db_service.dart';

/// 渲染时所创建的模型
class SiteRenderConfigModel {
  SiteRenderConfigModel({
    required this.blueMap,
    required this.dbEntity,
  })  : globalEnv = SiteEnvStore.fromJson(jsonDecode(dbEntity.env)),
        favicon =
            dbEntity.favicon.isNotEmpty ? dbEntity.favicon.obs : Rx(null) {
    client = NetClient(
      blueMap: blueMap,
      db: dbEntity,
      cookieJar: PersistCookieJar(
        ignoreExpires: false,
        storage: CookieJarStorage(dbEntity.uuid),
      ),
    );
  }

  // 需求字段
  final WebTableData dbEntity;
  late final NetClient client;

  // 储存字段
  final SiteEnvStore globalEnv;
  final SiteBlueMap blueMap;
  final Rx<Uint8List?> favicon;

  String get name => blueMap.name.value;

  int get id => dbEntity.id;

  Future<void> setFavicon(Uint8List bin) async {
    favicon.value = bin;
    await Get.find<DbService>().webDao.replace(dbEntity.copyWith(favicon: bin));
  }

  Future<void> updateCookies() async {}

  List<SitePage> get displayPage => blueMap.pageList
      .where((p0) =>
          p0.displayType.value == SiteDisplayType.show ||
          (p0.displayType.value == SiteDisplayType.login &&
              dbEntity.loginCookies.isNotEmpty))
      .where((e) => [TemplateType.imageList, TemplateType.imageWaterFall]
          .contains(e.template.type))
      .toList();

  void updateGlobalEnv(Iterable<EnvResult> envs) async {
    var didUpdate = false;
    for (final env in envs.where((e) =>
        e.global == true &&
        e.id?.isNotEmpty == true &&
        e.value?.isNotEmpty == true)) {
      if (!globalEnv.env.containsKey(env.id) ||
          globalEnv.env[env.id] != env.value) {
        didUpdate = true;
        globalEnv.env[env.id!] = env.value!;
      }
    }
    if (didUpdate) {
      await Get.find<DbService>()
          .webDao
          .replace(dbEntity.copyWith(env: globalEnv.toJsonString()));
    }
  }
}
