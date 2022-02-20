import 'package:catweb/data/controller/site_controller.dart';
import 'package:catweb/data/models/load_more_model.dart';
import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/data/protocol/model/page.dart';
import 'package:catweb/gen/protobuf/model.pbserver.dart';
import 'package:catweb/utils/replace_utils.dart';
import 'package:get/get.dart';

class DetailBaseData {
  final String? title;
  final String? subtitle;
  final String? language;
  final double? star;
  final TagRpcModel? tag;
  final ImageRpcModel? image;
  final int? imageCount;

  DetailBaseData({
    this.title,
    this.subtitle,
    this.tag,
    this.image,
    this.language,
    this.star,
    this.imageCount,
  });
}

class DetailPreviewController extends LoadMoreModel<ImageRpcModel> {
  DetailPreviewController({
    required this.target,
    SiteEnvModel? outerEnv,
    Object? base,
    GalleryRpcModel? detailModel,
  })  : localEnv = SiteEnvModel(outerEnv?.env),
        baseData = DetailPreviewController.fromModel(base),
        _detailModel = Rx(detailModel) {
    onLoadMore();
  }

  final global = Get.find<GlobalController>();
  final SitePageModel target;
  final SiteEnvModel localEnv;

  // 信息
  final Rx<GalleryRpcModel?> _detailModel;
  DetailBaseData? baseData;

  @override
  bool isItemExist(ImageRpcModel item) => items.contains(item);

  GalleryRpcModel? get detailModel => _detailModel.value;

  @override
  Future<List<ImageRpcModel>> loadPage(int page) async {
    var baseUrl = target.url.value;
    baseUrl = localEnv.replace(pageReplace(baseUrl, page));

    final detail = await global.website.client.getGallery(
      url: baseUrl,
      model: target,
      localEnv: localEnv,
    );
    _detailModel.value = detail;
    return detail.previewImg;
  }

  static DetailBaseData? fromModel(Object? model) {
    if (model != null && model is ListRpcModel_Item) {
      return DetailBaseData(
        title: model.title,
        subtitle: model.subtitle,
        tag: model.tag,
        image: model.previewImg,
        imageCount: model.imgCount,
        language: model.language,
      );
    }
    return null;
  }

  bool get fillRemaining =>
      state == LoadMoreState.loading || errorMessage != null;
}
