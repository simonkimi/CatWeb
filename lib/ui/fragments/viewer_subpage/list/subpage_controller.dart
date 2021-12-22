import 'package:catweb/data/controller/site_controller.dart';
import 'package:catweb/data/models/load_more_model.dart';
import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/data/protocol/model/page.dart';
import 'package:catweb/ui/model/viewer_list_model.dart';
import 'package:get/get.dart';

class SubListController extends LoadMoreModel<ViewerListModel> {
  SubListController({required this.model, required this.subPageModel});

  final SitePageModel model;
  final SubPageModel? subPageModel;

  final site = Get.find<SiteController>();

  @override
  bool isItemExist(ViewerListModel item) => items.contains(item);

  @override
  Future<List<ViewerListModel>> loadPage(int page) async {
    final localEnv = SiteEnvModel({}).copy(); // TODO 真实env

    var baseUrl = model.url.value;

    // 页数匹配
    final pageReg = RegExp(r'\{page:(?<start>\d+):?(?<step>\d*)\}');
    final match = pageReg.firstMatch(baseUrl);
    if (match != null) {
      final start = int.tryParse(match.namedGroup('start') ?? '') ?? 0;
      final step = int.tryParse(match.namedGroup('step') ?? '') ?? 1;
      baseUrl =
          baseUrl.replaceAll(match.group(0)!, '${start + (page - 1) * step}');
    }

    // 添加缓存
    if (subPageModel != null && subPageModel!.key.value.isNotEmpty) {
      localEnv.mergeMap({
        subPageModel!.key.value: subPageModel!.value.value,
      });
    }

    baseUrl = localEnv.replace(baseUrl);

    return site.website.client.getList(
      url: baseUrl,
      model: model,
      localEnv: SiteEnvModel({}),
    );
  }
}
