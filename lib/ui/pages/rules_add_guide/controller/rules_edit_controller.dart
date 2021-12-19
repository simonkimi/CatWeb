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
      DB().siteDao.insert(SiteTableCompanion.insert(
            bin: siteConfigModel.toPb().writeToBuffer(),
            env: EnvStore().writeToBuffer(),
          ));
    } else {
      DB()
          .siteDao
          .replace(db!.copyWith(bin: siteConfigModel.toPb().writeToBuffer()));
    }
  }
}
