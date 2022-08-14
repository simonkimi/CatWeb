import 'package:catweb/data/controller/site_controller.dart';
import 'package:catweb/data/database/database.dart';
import 'package:catweb/data/models/image_with_preview.dart';
import 'package:catweb/data/loaders/load_more_model.dart';
import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/data/protocol/model/page.dart';
import 'package:catweb/data/protocol/model/templete.dart';
import 'package:catweb/gen/protobuf/model.pbserver.dart';
import 'package:catweb/network/client/image_concurrency.dart';
import 'package:catweb/ui/pages/view_page/viewer_subpage/image/controller/image_load_controller.dart';
import 'package:catweb/utils/replace_utils.dart';
import 'package:get/get.dart';
import 'package:catweb/data/protocol/model/model.dart';

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

/// Gallery带预览的加载项目
class GalleryImageWithPreview
    extends ImageWithPreviewModel<GalleryRpcModel_Item> {
  GalleryImageWithPreview(super.previewModel);

  @override
  ImageRpcModel get previewImage => previewModel.previewImg;

  @override
  GalleryRpcModel_Item get value => previewModel;

  @override
  String? get idCode => value.target;
}

class GalleryLoadMore extends LoadMorePage<GalleryRpcModel,
    GalleryRpcModel_Item, GalleryImageWithPreview> {
  GalleryLoadMore(super.pageData);

  @override
  List<GalleryRpcModel_Item> get items => pageData.items;

  @override
  List<GalleryImageWithPreview> genModel() =>
      items.map((e) => GalleryImageWithPreview(e)).toList();
}

class GalleryPreviewController extends LoadMoreLoader<GalleryRpcModel,
        GalleryRpcModel_Item, GalleryImageWithPreview>
    implements ReaderInfo<GalleryRpcModel_Item, GalleryImageWithPreview> {
  GalleryPreviewController({
    required this.blueprint,
    SiteEnvModel? outerEnv,
    Object? base,
    GalleryRpcModel? detailModel,
  })  : localEnv = SiteEnvModel(outerEnv?.env),
        baseData = GalleryPreviewController.fromModel(base),
        _detailModel = Rx(detailModel) {
    onLoadMore();
    loadLastRead();
  }

  final PageBlueprintModel blueprint;
  final SiteEnvModel localEnv;

  // 信息
  final Rx<GalleryRpcModel?> _detailModel;
  GalleryBaseData? baseData;
  final Rx<int> lastReadIndex = 0.obs;

  final global = Get.find<GlobalController>();

  @override
  final previewConcurrency = ImageListConcurrency();  // 预览图片内容的加载器

  GalleryRpcModel? get detailModel => _detailModel.value;

  String get idCode => localEnv.replace(blueprint.url.value);

  /// 从数据库中取出上次加载进度
  Future<void> loadLastRead() async {
    final db = DB().readerHistoryDao;
    final entity = await db.get(uuid: blueprint.uuid, idCode: idCode);
    if (entity != null) {
      lastReadIndex.value = entity.pageIndex;
    } else {
      await db.add(uuid: blueprint.uuid, idCode: idCode);
    }
  }

  Future<void> refresh() async {
    _detailModel.value = null;
    await onRefresh();
  }

  @override
  Future<GalleryLoadMore> netWorkLoadPage(int page) async {
    var baseUrl = blueprint.url.value;
    if (hasPageExpression(baseUrl) || page == 0) {
      // 有面数
      baseUrl = pageReplace(baseUrl, page);
    } else {
      if (pages.isNotEmpty) {
        final preUrl = pages[page - 1]?.pageData.nextPage;
        if (preUrl == null || preUrl.isEmpty) {
          throw Exception('Error: Jump page to index $page ?');
        }
        baseUrl = preUrl;
      }
    }
    baseUrl = localEnv.replace(baseUrl);

    final detail = await global.website.client.getGallery(
      url: baseUrl,
      model: blueprint,
      localEnv: localEnv,
    );
    _detailModel.value = detail;

    if (!hasPageExpression(blueprint.url.value) &&
        (detail.nextPage == baseUrl || detail.nextPage.isEmpty)) {
      stateLoadNoData();
    }

    return GalleryLoadMore(detail);
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

  TemplateGalleryModel get extra =>
      blueprint.templateData as TemplateGalleryModel;

  bool get fillRemaining =>
      (state.isLoading && successiveItems.isEmpty) || errorMessage != null;

  @override
  int? get chunkSize => detailModel?.getCountPrePage();

  @override
  int? get totalSize => detailModel?.getImageCount();

  @override
  Future<void> loadIndexModel(int index) => loadIndex(index);

  @override
  int? get itemsCount => totalSize;

  @override
  int? get startReadIndex => lastReadIndex.value;

  @override
  Future<void> onReaderIndexChanged(int index) async {
    final db = DB().readerHistoryDao;
    final entity = await db.get(
      uuid: blueprint.uuid,
      idCode: idCode,
    );
    if (entity != null) {
      await db.replace(entity.copyWith(
        pageIndex: index,
      ));
    }
  }
}
