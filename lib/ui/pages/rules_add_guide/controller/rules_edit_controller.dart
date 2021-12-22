import 'package:catweb/data/controller/site_controller.dart';
import 'package:catweb/data/database/database.dart';
import 'package:catweb/data/protocol/model/store.dart';
import 'package:catweb/gen/protobuf/store.pbserver.dart';
import 'package:get/get.dart';

class RulesEditController extends GetxController {
  RulesEditController({
    SiteConfig? pb,
    this.db,
  }) : siteConfigModel = SiteConfigModel(pb);

  final SiteConfigModel siteConfigModel;
  final SiteTableData? db;

  Future<void> save() async {
    if (db == null) {
      await DB().siteDao.insert(SiteTableCompanion.insert(
            bin: siteConfigModel.toPb().writeToBuffer(),
            env: EnvStore().writeToBuffer(),
          ));
    } else {
      final newDb = db!.copyWith(bin: siteConfigModel.toPb().writeToBuffer());
      await DB().siteDao.replace(newDb);
      // 检测是否为当前配置
      final controller = Get.find<SiteController>();
      if (controller.site.value?.id == db!.id) {
        controller.setNewSite(newDb);
      }
    }
  }
}
