import 'dart:typed_data';

import 'package:catweb/data/database/cookie_jar_storage.dart';
import 'package:catweb/data/database/database.dart';
import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/data/protocol/model/page.dart';
import 'package:catweb/data/protocol/model/store.dart';
import 'package:catweb/gen/protobuf/page.pbserver.dart';
import 'package:catweb/gen/protobuf/template.pbenum.dart';
import 'package:catweb/network/client/cilent.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:get/get.dart';

import '../controller/db_service.dart';

/// 渲染时所创建的模型
class SiteRenderConfigModel {
  SiteRenderConfigModel({
    required this.configModel,
    required this.dbEntity,
  })  : globalEnv = SiteEnvModel.fromBuffer(dbEntity.env),
        favicon =
            dbEntity.favicon.isNotEmpty ? dbEntity.favicon.obs : Rx(null) {
    client = NetClient(
      configModel: configModel,
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
  final SiteEnvModel globalEnv;
  final SiteBlueprintModel configModel;
  final Rx<Uint8List?> favicon;

  String get name => configModel.name.value;

  int get id => dbEntity.id;

  Future<void> setFavicon(Uint8List bin) async {
    favicon.value = bin;
    await Get.find<DbService>().webDao.replace(dbEntity.copyWith(favicon: bin));
  }

  Future<void> updateCookies() async {}

  List<PageBlueprintModel> get displayPage => configModel.pageList
      .where((p0) => p0.display.value == SiteDisplayType.show)
      .where((e) => e.containsFlag('requireLogin')
          ? dbEntity.loginCookies.isNotEmpty
          : true)
      .where((e) => [
            Template.TEMPLATE_IMAGE_LIST,
            Template.TEMPLATE_IMAGE_WATERFALL
          ].contains(e.template.value))
      .toList();

  void updateGlobalEnv(Map<String, String> env) async {
    var didUpdate = false;
    for (final entity in env.entries) {
      if (!globalEnv.env.containsKey(entity.key) ||
          globalEnv.env[entity.key] != entity.value) {
        didUpdate = true;
        globalEnv.env[entity.key] = entity.value;
      }
    }
    if (didUpdate) {
      await Get.find<DbService>()
          .webDao
          .replace(dbEntity.copyWith(env: globalEnv.writeToBuffer()));
    }
  }
}
