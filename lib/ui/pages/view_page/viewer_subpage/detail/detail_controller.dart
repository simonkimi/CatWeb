import 'package:catweb/data/controller/site_controller.dart';
import 'package:catweb/data/models/load_more_model.dart';
import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/data/protocol/model/model.dart';
import 'package:catweb/data/protocol/model/page.dart';
import 'package:catweb/ui/model/detail_model.dart';
import 'package:catweb/utils/replace_utils.dart';
import 'package:get/get.dart';

class DetailPreviewController extends LoadMoreModel<ImageModel> {
  DetailPreviewController({required this.model, SiteEnvModel? outerEnv})
      : localEnv = SiteEnvModel(outerEnv?.env);

  final SitePageModel model;

  GalleryDetailModel? detailModel;

  final SiteEnvModel localEnv;

  final site = Get.find<SiteController>();

  @override
  bool isItemExist(ImageModel item) => items.contains(item);

  @override
  Future<List<ImageModel>> loadPage(int page) async {
    var baseUrl = model.url.value;
    baseUrl = pageReplace(baseUrl, page);
    baseUrl = localEnv.replace(baseUrl);

    final gallery = await site.website.client.getGallery(
      url: baseUrl,
      model: model,
      localEnv: localEnv,
    );

    return gallery.previewList ?? [];
  }
}
