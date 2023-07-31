import 'dart:convert';

import 'package:catweb/data/controller/db_service.dart';
import 'package:catweb/data/controller/site_service.dart';
import 'package:catweb/data/database/database.dart';
import 'package:catweb/data/models/site_model/site_blue_map.dart';
import 'package:get/get.dart';

class RulesEditController extends GetxController {
  RulesEditController({
    SiteBlueMap? blueprint,
    this.db,
  }) : blueprint = blueprint ?? SiteBlueMap();

  SiteBlueMap blueprint;
  final WebTableData? db;


  Future<void> save() async {
    if (db == null) {
      await Get.find<DbService>().webDao.insert(WebTableCompanion.insert(
            blueprint: jsonEncode(blueprint.toJson()),
            env: '{}',
          ));
    } else {
      final newDb = db!.copyWith(blueprint: jsonEncode(blueprint.toJson()));
      await Get.find<DbService>().webDao.replace(newDb);
      // 检测是否为当前配置
      final controller = Get.find<SiteService>();
      if (controller.site.value?.id == db!.id) {
        controller.setNewSite(newDb);
      }
    }
  }
}
