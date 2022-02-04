import 'package:catweb/data/controller/site_controller.dart';
import 'package:catweb/data/models/load_more_model.dart';
import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/data/protocol/model/model.dart';
import 'package:catweb/data/protocol/model/page.dart';
import 'package:catweb/gen/protobuf/model.pbserver.dart';
import 'package:catweb/utils/replace_utils.dart';
import 'package:get/get.dart';

class DetailPreviewController extends LoadMoreModel<ImageModel> {
  DetailPreviewController({required this.model, SiteEnvModel? outerEnv})
      : localEnv = SiteEnvModel(outerEnv?.env);

  final SitePageModel model;

  DetailRpcModel? detailModel;

  final SiteEnvModel localEnv;

  final site = Get.find<SiteController>();

  @override
  bool isItemExist(ImageModel item) => items.contains(item);

  @override
  Future<List<ImageModel>> loadPage(int page) async {
    var baseUrl = model.url.value;
    baseUrl = localEnv.replace(pageReplace(baseUrl, page));

    final detail = await site.website.client.getDetail(
      url: baseUrl,
      model: model,
      localEnv: localEnv,
    );

    return detail.previewImg.map((e) => ImageModel.fromPb(e)).toList();
  }
}
