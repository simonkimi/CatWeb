import 'package:catweb/data/controller/db_service.dart';
import 'package:catweb/data/controller/site_service.dart';
import 'package:catweb/data/database/database.dart';
import 'package:catweb/data/protocol/model/store.dart';
import 'package:catweb/gen/protobuf/store.pbserver.dart';
import 'package:get/get.dart';

class RulesEditController extends GetxController {
  RulesEditController({
    SiteBlueprint? pb,
    this.db,
  }) : blueprint = SiteBlueprintModel(pb);

  final SiteBlueprintModel blueprint;
  final WebTableData? db;

  Future<void> save() async {
    if (db == null) {
      await Get.find<DbService>().webDao.insert(WebTableCompanion.insert(
            blueprint: blueprint.toPb().writeToBuffer(),
            env: EnvStore().writeToBuffer(),
          ));
    } else {
      final newDb = db!.copyWith(blueprint: blueprint.toPb().writeToBuffer());
      await Get.find<DbService>().webDao.replace(newDb);
      // 检测是否为当前配置
      final controller = Get.find<SiteService>();
      if (controller.site.value?.id == db!.id) {
        controller.setNewSite(newDb);
      }
    }
  }
}
