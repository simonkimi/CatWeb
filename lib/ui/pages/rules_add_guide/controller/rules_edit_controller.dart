import 'package:catweb/data/controller/db_service.dart';
import 'package:catweb/data/controller/site_service.dart';
import 'package:catweb/data/database/database.dart';
import 'package:catweb/data/models/site_model/site_blue_map.dart';
import 'package:get/get.dart';

class RulesEditController extends GetxController {
  RulesEditController({
    SiteBlueMap? blueMap,
    this.db,
  }) : blueprint = Rx(blueMap ?? const SiteBlueMap());

  Rx<SiteBlueMap> blueprint;
  final WebTableData? db;

  void updateBlueMap(SiteBlueMap entity) {
    blueprint(entity);
  }

  Future<void> save() async {
    if (db == null) {
      await Get.find<DbService>().webDao.insert(WebTableCompanion.insert(
            blueprint: blueprint.toJson(),
            env: '{}',
          ));
    } else {
      final newDb = db!.copyWith(blueprint: blueprint.toJson());
      await Get.find<DbService>().webDao.replace(newDb);
      // 检测是否为当前配置
      final controller = Get.find<SiteService>();
      if (controller.site.value?.id == db!.id) {
        controller.setNewSite(newDb);
      }
    }
  }
}
