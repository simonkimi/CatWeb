import 'package:catweb/data/database/database.dart';
import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/data/protocol/model/store.dart';
import 'package:catweb/network/client/cilent.dart';
import 'package:get/get.dart';
import 'package:moor/moor.dart';

/// 渲染时所创建的模型
class SiteRenderConfigModel {
  SiteRenderConfigModel({
    required this.configModel,
    required this.dbEntity,
  })  : globalEnv = SiteEnvModel({}),
        favicon =
            dbEntity.favicon.isNotEmpty ? dbEntity.favicon.obs : Rx(null) {
    client = NetClient(configModel, globalEnv);
  }

  // 需求字段
  final SiteTableData dbEntity;
  late final NetClient client;

  // 储存字段
  final SiteEnvModel globalEnv;
  final SiteConfigModel configModel;
  final Rx<Uint8List?> favicon;

  String get name => configModel.name.value;

  int get id => dbEntity.id;

  Future<void> setFavicon(Uint8List bin) async {
    favicon.value = bin;
    await DB().siteDao.replace(dbEntity.copyWith(favicon: bin));
  }
}
