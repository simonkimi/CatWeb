import 'dart:async';
import 'package:catweb/data/controller/setting_controller.dart';
import 'package:catweb/data/database/database.dart';
import 'package:catweb/data/models/site_render_model.dart';
import 'package:catweb/data/protocol/model/store.dart';
import 'package:catweb/network/client/cilent.dart';
import 'package:catweb/utils/helper.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController {
  late final StreamSubscription<List<WebTableData>> siteDbChangeListener;

  var lastClickBack = DateTime.now().millisecondsSinceEpoch;

  final site = Rx<SiteRenderConfigModel?>(null);

  SiteRenderConfigModel get website {
    assert(site.value != null);
    return site.value!;
  }

  Future<void> setNewSite([WebTableData? db]) async {
    if (db != null) {
      site.value = SiteRenderConfigModel(
        dbEntity: db,
        configModel: SiteBlueprintModel.fromBuffer(db.blueprint),
      );
      Get.find<SettingController>().defaultSite.value = db.id;
    } else {
      site.value = null;
    }
  }

  Future<void> setDefaultSite() async {
    final setting = Get.find<SettingController>();
    final df = (await DB().webDao.getAll())
        .get((e) => e.id == setting.defaultSite.value);
    await setNewSite(df);
  }

  Future<void> autoSelectNewSite() async {
    final sitesList = await DB().webDao.getAll();
    if (sitesList.isNotEmpty) {
      final site = sitesList.first;
      await setNewSite(site);
    } else {
      await setNewSite();
    }
  }

  @override
  void onInit() {
    try {
      setDefaultSite();
    } catch (e) {
      print(e); // TODO 错误处理
    }
    siteDbChangeListener = DB().webDao.getAllStream().listen((event) {
      // 检测当前网站的配置是否被更新
      final currentNewSite = event.get((e) => e.id == id);
      if (currentNewSite != null) {
        if (currentNewSite.loginCookies != website.dbEntity.loginCookies ||
            currentNewSite.blueprint != website.dbEntity.blueprint) {
          setNewSite(currentNewSite);
          return;
        }
      }

      // 检测是否被删除
      if (id != null && currentNewSite == null) {
        autoSelectNewSite();
        return;
      }
      if (site.value == null && event.isNotEmpty) {
        autoSelectNewSite();
        return;
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

  NetClient? get client => site.value?.client;
}
