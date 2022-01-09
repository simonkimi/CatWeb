import 'dart:typed_data';

import 'package:catweb/data/database/database.dart';
import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/data/protocol/model/page.dart';
import 'package:catweb/data/protocol/model/store.dart';
import 'package:catweb/gen/protobuf/page.pbserver.dart';
import 'package:catweb/network/client/cilent.dart';
import 'package:get/get.dart';

/// 渲染时所创建的模型
class SiteRenderConfigModel {
  SiteRenderConfigModel({
    required this.configModel,
    required this.dbEntity,
  })  : globalEnv = SiteEnvModel.fromBuffer(dbEntity.env),
        favicon =
            dbEntity.favicon.isNotEmpty ? dbEntity.favicon.obs : Rx(null) {
    client = NetClient(configModel);
  }

  // 需求字段
  final WebTableData dbEntity;
  late final NetClient client;

  // 储存字段
  final SiteEnvModel globalEnv;
  final SiteConfigModel configModel;
  final Rx<Uint8List?> favicon;

  String get name => configModel.name.value;

  int get id => dbEntity.id;

  Future<void> setFavicon(Uint8List bin) async {
    favicon.value = bin;
    await DB().webDao.replace(dbEntity.copyWith(favicon: bin));
  }

  List<SitePageModel> get displayPage => configModel.pageList
      .where((p0) => p0.display.value == SiteDisplayType.show)
      .where((e) => [PageTemplate.imageList, PageTemplate.imageWaterfall]
          .contains(e.template.value))
      .toList();

  Future<void> updateGlobalEnv() async {
    await DB()
        .webDao
        .replace(dbEntity.copyWith(env: globalEnv.writeToBuffer()));
  }
}
