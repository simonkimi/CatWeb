import 'package:catweb/data/controller/site_controller.dart';
import 'package:catweb/data/database/database.dart';
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
import 'package:rxdart/rxdart.dart' hide Rx;

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
  late final ImageListConcurrency concurrency = ImageListConcurrency(
    dio: global.website.client.imageDio,
  );

  @override
  bool isItemExist(GalleryRpcModel_Item item) => false;

  GalleryRpcModel? get detailModel => _detailModel.value;

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
  String get idCode => localEnv.replace(blueprint.url.value);

  @override
  Future<Tuple2<GalleryRpcModel, List<GalleryRpcModel_Item>>> loadPage(
      int page) async {
    var baseUrl = blueprint.url.value;
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
      model: blueprint,
      localEnv: localEnv,
    );
    _detailModel.value = detail;
    _fillItemIndex(detail);

    if (!hasPageExpression(blueprint.url.value) &&
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

  /// 如果是不间断加载, 则将中间所有拿null补全, 用于以后判断是否有数据
  void _fillItemIndex(GalleryRpcModel item) {
    if (item.imageCount.isFinite && item.imageCount > 0) {
      for (var i = 0; i < item.imageCount; i++) {
        if (!items.containsKey(i)) {
          items[i] = null;
        }
      }
    }
  }

  bool get fillRemaining =>
      (state.isLoading && items.isEmpty) || errorMessage != null;

  /// 下面的都是给阅读提供的数据
  @override
  int? get chunkSize => detailModel?.getCountPrePage();

  @override
  int? get totalSize => detailModel?.getImageCount();

  @override
  String get baseUrl => blueprint.url.value;

  @override
  int? get pageCount => detailModel?.getImageCount();

  TemplateGalleryModel get extra =>
      blueprint.templateData as TemplateGalleryModel;

  @override
  TransmissionBufferStream<Map<int, GalleryRpcModel_Item?>,
          Map<int, ReaderPreviewData?>>
      get bufferStream => TransmissionBufferStream(
            initData: items,
            stream: items.stream
                .asBroadcastStream()
                .debounceTime(const Duration(seconds: 1)),
            transmission: (Map<int, GalleryRpcModel_Item?> from) {
              return from.map((key, value) => MapEntry(
                  key,
                  ReaderPreviewData(
                    idCode: value?.target,
                    preview: value?.previewImg,
                  )));
            },
          );

  @override
  String get fromUuid => blueprint.uuid;

  @override
  int? get startPage => lastReadIndex.value;

  @override
  ImageListConcurrency get previewConcurrency => concurrency;
}
