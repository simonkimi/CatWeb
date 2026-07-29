import 'package:catweb/data/loading/paged_loader.dart';
import 'package:catweb/data/media/image_repository.dart';
import 'package:catweb/data/models/ffi/result/result.dart';
import 'package:catweb/data/models/gallery_models.dart';
import 'package:catweb/data/models/site_render_model.dart';
import 'package:catweb/data/site_runtime/runtime_contracts.dart';
import 'package:catweb/data/site_runtime/site_definition.dart';
import 'package:catweb/data/site_runtime/site_page_source.dart';
import 'package:catweb/network/runtime/dio_http_transport.dart';
import 'package:catweb/ui/pages/view_page/image/controller/reader_load_notifier.dart';
import 'package:catweb/ui/state/paged_loader_notifier.dart';
import 'package:flutter/foundation.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

/// 图库详情页的 Flutter 控制器。
///
/// 详情 payload 通过映射页面源拆分为页面元数据和可分页的预览项目。
class ViewerGalleryNotifier extends ChangeNotifier
    with PagedLoaderNotifier<GalleryItemModel>
    implements ReaderInfo<GalleryItemModel> {
  ViewerGalleryNotifier({
    required this.endpoint,
    required this.website,
    required this.requestContext,
  }) {
    bindPageLoader(
      PagedLoader<GalleryItemModel>(
        source: MappedSitePageSource<DetailParserResult, GalleryItemModel>(
          executor: website.session.executor,
          endpointId: endpoint.id,
          context: requestContext,
          itemsOf: (payload) => GalleryPageModel(payload).items,
          onPayload: (payload) {
            firstPage ??= GalleryPageModel(payload);
            if (!_disposed) notifyListeners();
          },
        ),
        failureMapper: const SiteRuntimeFailureMapper(),
      ),
    );
  }

  final EndpointRule endpoint;
  final SiteRenderConfigModel website;
  final RequestContext requestContext;
  GalleryPageModel? firstPage;
  int? _startReadIndex;
  bool _disposed = false;

  final RefreshController refreshController = RefreshController();

  ImageRepository get imageRepository => website.imageRepository;
  List<GalleryItemModel> get successiveItems => loadedItems.toList();

  void setStartReadIndex(int? index) {
    _startReadIndex = index;
  }

  @override
  GalleryItemModel? itemAt(int index) => pageSnapshot.itemAt(index);

  @override
  int get itemCount => pageSnapshot.visibleLength;

  @override
  Future<void> loadIndexModel(int index) => loadIndex(index);

  @override
  int? get startReadIndex => _startReadIndex;

  @override
  ImageRepository get previewRepository => imageRepository;

  bool get fillRemaining =>
      pageSnapshot.isLoading && pageSnapshot.loadedCount == 0;

  @override
  Future<void> loadNextPage() async {
    await pageLoader.loadNext();
    if (_disposed) return;
    _finishLoadMore();
  }

  @override
  Future<void> refresh() async {
    firstPage = null;
    refreshController.resetNoData();
    notifyListeners();
    await pageLoader.refresh();
    if (_disposed) return;
    _finishLoadMore();
  }

  void _finishLoadMore() {
    if (pageSnapshot.failure != null) {
      refreshController.loadFailed();
    } else if (!pageSnapshot.hasNext) {
      refreshController.loadNoData();
    } else {
      refreshController.loadComplete();
    }
  }

  @override
  void dispose() {
    _disposed = true;
    disposePageLoader();
    refreshController.dispose();
    super.dispose();
  }
}
