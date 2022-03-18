import 'package:catweb/data/controller/site_controller.dart';
import 'package:catweb/data/models/load_more_model.dart';
import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/data/protocol/model/page.dart';
import 'package:catweb/data/protocol/model/templete.dart';
import 'package:catweb/gen/protobuf/model.pbserver.dart';
import 'package:catweb/network/client/image_concurrency.dart';
import 'package:catweb/ui/pages/view_page/viewer_subpage/image/image_controller.dart';
import 'package:catweb/utils/handle.dart';
import 'package:catweb/utils/replace_utils.dart';
import 'package:catweb/data/protocol/model/model.dart';
import 'package:get/get.dart';
import 'package:tuple/tuple.dart';

class GalleryBaseData {
  final String? title;
  final String? subtitle;
  final String? language;
  final double? star;
  final TagRpcModel? tag;
  final ImageRpcModel? image;
  final int? imageCount;

  GalleryBaseData({
    this.title,
    this.subtitle,
    this.tag,
    this.image,
    this.language,
    this.star,
    this.imageCount,
  });
}

class GalleryPreviewController
    extends LoadMoreMap<GalleryRpcModel, GalleryRpcModel_Item>
    implements ReaderInfo<Map<int, GalleryRpcModel_Item?>> {
  GalleryPreviewController({
    required this.target,
    SiteEnvModel? outerEnv,
    Object? base,
    GalleryRpcModel? detailModel,
  })  : localEnv = SiteEnvModel(outerEnv?.env),
        baseData = GalleryPreviewController.fromModel(base),
        _detailModel = Rx(detailModel) {
    onLoadMore();
  }

  final PageBlueprintModel target;
  final SiteEnvModel localEnv;

  // 信息
  final Rx<GalleryRpcModel?> _detailModel;
  GalleryBaseData? baseData;

  final global = Get.find<GlobalController>();
  late final ImageListConcurrency concurrency = ImageListConcurrency(
    dio: global.website.client.imageDio,
  );

  @override
  bool isItemExist(GalleryRpcModel_Item item) => false;

  GalleryRpcModel? get detailModel => _detailModel.value;

  Future<void> refresh() async {
    _detailModel.value = null;
    await onRefresh();
  }

  @override
  Future<Tuple2<GalleryRpcModel, List<GalleryRpcModel_Item>>> loadPage(
      int page) async {
    var baseUrl = target.url.value;
    if (hasPageExpression(baseUrl) || page == 0) {
      // 有面数
      baseUrl = pageReplace(baseUrl, page);
    } else {
      if (pages.isNotEmpty) {
        final preUrl = pages[page - 1]?.nextPage;
        if (preUrl == null) throw Exception('看起来莫名其妙跳页了: index $page');
        baseUrl = preUrl;
      }
    }
    baseUrl = localEnv.replace(baseUrl);

    final detail = await global.website.client.getGallery(
      url: baseUrl,
      model: target,
      localEnv: localEnv,
    );
    _detailModel.value = detail;

    if (!hasPageExpression(target.url.value) &&
        (detail.nextPage == baseUrl || detail.nextPage.isEmpty)) {
      loadNoData();
    }

    return Tuple2(detail, detail.items);
  }

  static GalleryBaseData? fromModel(Object? model) {
    if (model != null && model is ListRpcModel_Item) {
      return GalleryBaseData(
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
      (state.isLoading && items.isEmpty) || errorMessage != null;

  @override
  int? get chunkSize => detailModel?.getCountPrePage();

  @override
  int? get totalSize => detailModel?.getImageCount();

  @override
  String get baseUrl => target.url.value;

  @override
  int? get pageCount => detailModel?.getImageCount();

  TemplateGalleryModel get extra => target.templateData as TemplateGalleryModel;

  @override
  TransmissionBufferStream<Map<int, GalleryRpcModel_Item?>, Map<int, String?>>
      get bufferStream => TransmissionBufferStream(
            initData: items,
            stream: items.stream.asBroadcastStream(),
            transmission: (Map<int, GalleryRpcModel_Item?> from) {
              return from.map((key, value) => MapEntry(key, value?.target));
            },
          );
}
