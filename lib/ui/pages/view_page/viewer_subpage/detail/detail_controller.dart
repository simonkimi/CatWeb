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

  DetailBaseData({
    this.title,
    this.subtitle,
    this.tag,
    this.image,
    this.language,
    this.star,
  });
}

class DetailPreviewController extends LoadMoreModel<ImageRpcModel> {
  DetailPreviewController({
    required this.target,
    SiteEnvModel? outerEnv,
    Object? base,
    this.detailModel,
  })  : localEnv = SiteEnvModel(outerEnv?.env),
        baseData = DetailPreviewController.fromModel(base);
  final site = Get.find<SiteController>();
  final SitePageModel target;
  final SiteEnvModel localEnv;

  // 信息
  DetailRpcModel? detailModel;
  DetailBaseData? baseData;

  @override
  bool isItemExist(ImageRpcModel item) => items.contains(item);

  DetailRpcModel get model {
    if (detailModel == null) {
      throw Exception('detailModel is null');
    }
    return detailModel!;
  }

  @override
  Future<List<ImageRpcModel>> loadPage(int page) async {
    var baseUrl = target.url.value;
    baseUrl = localEnv.replace(pageReplace(baseUrl, page));

    final detail = await site.website.client.getDetail(
      url: baseUrl,
      model: target,
      localEnv: localEnv,
    );

    return detail.previewImg;
  }

  static DetailBaseData? fromModel(Object? model) {
    if (model != null && model is ListRpcModel_Item) {
      return DetailBaseData(
        title: model.title,
        subtitle: model.subtitle,
        tag: model.tag,
        image: model.previewImg,
      );
    }
    return null;
  }

  bool get isInitialling =>
      detailModel == null &&
      baseData == null &&
      items.isEmpty &&
      (state == LoadMoreState.loading || state == LoadMoreState.refreshing);

  bool get isLoadingDetail =>
      baseData != null &&
      detailModel == null &&
      (state == LoadMoreState.loading || state == LoadMoreState.refreshing);
}
