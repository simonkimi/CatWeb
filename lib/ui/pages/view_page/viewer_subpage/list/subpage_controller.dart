import 'package:catweb/data/controller/site_controller.dart';
import 'package:catweb/data/models/load_more_model.dart';
import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/data/protocol/model/page.dart';
import 'package:catweb/gen/protobuf/model.pbserver.dart';
import 'package:catweb/utils/replace_utils.dart';
import 'package:get/get.dart';

class SubListController extends LoadMoreModel<ListRpcModel_Item> {
  SubListController({required this.model, required this.subPageModel});

  final SitePageModel model;
  final SubPageModel? subPageModel;
  final SiteEnvModel localEnv = SiteEnvModel();

  final site = Get.find<SiteController>();

  SiteEnvModel get env => site.website.globalEnv.create(localEnv);

  @override
  bool isItemExist(ListRpcModel_Item item) => items.contains(item);

  @override
  Future<List<ListRpcModel_Item>> loadPage(int page) async {
    var baseUrl = model.url.value;

    // 页数匹配
    baseUrl = pageReplace(baseUrl, page);

    // 添加缓存
    if (subPageModel != null && subPageModel!.key.value.isNotEmpty) {
      localEnv.mergeMap({
        subPageModel!.key.value: subPageModel!.value.value,
      });
    }

    baseUrl = localEnv.replace(baseUrl);
    print('加载网址: $baseUrl');
    final data = await site.website.client.getList(
      url: baseUrl,
      model: model,
      localEnv: localEnv,
    );

    return data.items;
  }
}
