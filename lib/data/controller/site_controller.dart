import 'dart:async';

import 'package:catweb/data/controller/setting_controller.dart';
import 'package:catweb/data/database/database.dart';
import 'package:catweb/data/models/site_render_model.dart';
import 'package:catweb/data/protocol/model/store.dart';
import 'package:catweb/gen/protobuf/store.pbserver.dart';
import 'package:catweb/utils/utils.dart';
import 'package:get/get.dart';

class SiteController extends GetxController {
  late final StreamSubscription<List<SiteTableData>> siteDbChangeListener;

  final site = Rx<SiteRenderConfigModel?>(null);

  Future<void> setNewSite([SiteTableData? db]) async {
    if (db != null) {
      site.value = SiteRenderConfigModel(
        dbEntity: db,
        config: SiteProtobufModel(SiteProtobuf.fromBuffer(db.bin)),
      );
      final setting = Get.find<SettingController>();
      setting.defaultSite.value = db.id;
    } else {
      site.value = null;
    }
  }

  Future<void> setDefaultSite() async {
    final setting = Get.find<SettingController>();
    final df = (await DB().siteDao.getAll())
        .get((e) => e.id == setting.defaultSite.value);
    await setNewSite(df);
  }

  Future<void> autoSelectNewSite() async {
    final sitesList = await DB().siteDao.getAll();
    if (sitesList.isNotEmpty) {
      final site = sitesList.first;
      await setNewSite(site);
    }
  }

  @override
  void onInit() {
    setDefaultSite();
    siteDbChangeListener = DB().siteDao.getAllStream().listen((event) {
      if (site.value != null &&
          event.get((element) => element.id == id) == null) {
        autoSelectNewSite();
      }
    });
    super.onInit();
  }

  @override
  void onClose() {
    siteDbChangeListener.cancel();
    super.onClose();
  }

  int? get id => site.value?.id;
}
