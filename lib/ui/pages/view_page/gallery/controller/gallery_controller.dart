import 'package:catweb/data/controller/db_service.dart';
import 'package:catweb/data/controller/site_service.dart';
import 'package:catweb/data/models/ffi/result/base.dart';
import 'package:catweb/data/models/ffi/result/result.dart';
import 'package:catweb/data/models/image_with_preview.dart';
import 'package:catweb/data/loaders/load_more_model.dart';
import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/data/models/site_model/pages/site_page.dart';
import 'package:catweb/data/models/site_model/pages/template_gallery.dart';
import 'package:catweb/network/client/image_concurrency.dart';
import 'package:catweb/ui/pages/view_page/image/controller/image_load_controller.dart';
import 'package:catweb/utils/replace_utils.dart';
import 'package:get/get.dart';

class DetailBaseData {
  final String? title;
  final String? subtitle;
  final String? language;
  final double? star;
  final List<TagResult>? tag;
  final ImageResult? image;
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

/// Detail带预览的加载项目
class DetailImageWithPreview extends ImageWithPreviewModel<DetailPreviewItem> {
  DetailImageWithPreview(super.previewModel);

  @override
  ImageResult get previewImage => previewModel.previewImage!;

  @override
  DetailPreviewItem get value => previewModel;

  @override
  String? get idCode => value.target;
}

class DetailLoadMore extends LoadMorePage<DetailParserResult, DetailPreviewItem,
    DetailImageWithPreview> {
  DetailLoadMore(super.pageData);

  @override
  List<DetailPreviewItem> get items => pageData.previews ?? [];

  @override
  List<DetailImageWithPreview> genModel() =>
      items.map((e) => DetailImageWithPreview(e)).toList();
}

class GalleryPreviewController extends LoadMoreLoader<DetailParserResult,
        DetailPreviewItem, DetailImageWithPreview>
    implements ReaderInfo<DetailPreviewItem, DetailImageWithPreview> {
  GalleryPreviewController({
    required this.blueprint,
    SiteEnvStore? outerEnv,
    Object? base,
    DetailParserResult? detailModel,
  })  : localEnv = SiteEnvStore(outerEnv?.env),
        baseData = GalleryPreviewController.fromModel(base),
        _detailModel = Rx(detailModel) {
    onLoadMore();
    loadLastRead();
  }

  final SitePage blueprint;
  final SiteEnvStore localEnv;

  // 信息
  final ValueNotifier<DetailParserResult?> _detailModel;
  DetailBaseData? baseData;
  final ValueNotifier<int> lastReadIndex = 0.obs;

  final global = get<SiteService>();

  @override
  final previewConcurrency = ImageListConcurrency(); // 预览图片内容的加载器

  DetailParserResult? get detailModel => _detailModel.value;

  String get idCode => localEnv.apply(blueprint.url.value);

  /// 从数据库中取出上次加载进度
  Future<void> loadLastRead() async {
    final db = get<DbService>().readerHistoryDao;
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
  Future<DetailLoadMore> netWorkLoadPage(int page) async {
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
    baseUrl = localEnv.apply(baseUrl);

    final detail = await global.website.client.getDetail(
      url: baseUrl,
      model: blueprint,
      localEnv: localEnv,
    );
    _detailModel.value = detail;

    if (!hasPageExpression(blueprint.url.value) &&
        (detail.nextPage == baseUrl || detail.nextPage?.isEmpty == true)) {
      stateLoadNoData();
    }

    return DetailLoadMore(detail);
  }

  static DetailBaseData? fromModel(Object? model) {
    if (model != null && model is ListParserResultItem) {
      return DetailBaseData(
        title: model.title,
        subtitle: model.subtitle,
        tag: model.tags,
        image: model.previewImage,
        imageCount: model.imageCount,
        language: model.language,
      );
    }
    return null;
  }

  TemplateGallery get extra => blueprint.template as TemplateGallery;

  bool get fillRemaining =>
      (state.isLoading && successiveItems.isEmpty) || errorMessage != null;

  @override
  int? get chunkSize => detailModel?.countPrePage;

  @override
  int? get totalSize => detailModel?.imageCount;

  @override
  Future<void> loadIndexModel(int index) => loadIndex(index);

  @override
  int? get itemsCount => totalSize;

  @override
  int? get startReadIndex => lastReadIndex.value;

  @override
  Future<void> onReaderIndexChanged(int index) async {
    final db = get<DbService>().readerHistoryDao;
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
