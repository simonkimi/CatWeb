import 'package:catweb/data/database/database.dart';
import 'package:catweb/data/protocol/model/store.dart';
import 'package:catweb/network/client/dio_builder.dart';
import 'package:dio/dio.dart';
import 'package:moor/moor.dart';
import 'package:get/get.dart';

class SiteRenderConfigModel {
  SiteRenderConfigModel({
    required this.config,
    required this.dbEntity,
  })  : net = DioBuilder.build(config),
        favicon = dbEntity.favicon.isNotEmpty ? dbEntity.favicon.obs : Rx(null);

  final SiteProtobufModel config;
  final SiteTableData dbEntity;
  final Dio net;

  final Rx<Uint8List?> favicon;

  String get name => config.name.value;

  int get id => dbEntity.id;

  Future<void> setFavicon(Uint8List bin) async {
    favicon.value = bin;
    await DB().siteDao.replace(dbEntity.copyWith(favicon: bin));
  }
}
