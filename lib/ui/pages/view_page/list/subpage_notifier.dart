import 'package:catweb/data/loading/paged_loader.dart';
import 'package:catweb/data/media/image_repository.dart';
import 'package:catweb/data/models/ffi/result/result.dart';
import 'package:catweb/data/models/site_render_model.dart';
import 'package:catweb/data/models/subpage_models.dart';
import 'package:catweb/data/site_runtime/runtime_contracts.dart';
import 'package:catweb/data/site_runtime/site_definition.dart';
import 'package:catweb/data/site_runtime/site_page_source.dart';
import 'package:catweb/network/runtime/dio_http_transport.dart';
import 'package:catweb/ui/pages/view_page/image/controller/reader_load_notifier.dart';
import 'package:catweb/ui/state/paged_loader_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

/// 列表页面的 Flutter 控制器。
///
/// 分页和请求行为由纯 Dart 加载器处理，本类只持有滚动/刷新控件并桥接快照。
class SubListNotifier extends ChangeNotifier
    with PagedLoaderNotifier<ListItemModel>
    implements ReaderInfo<ListItemModel> {
  SubListNotifier({
    required this.endpoint,
    required this.website,
    required this.requestContext,
  }) {
    _source = MappedSitePageSource<ListParserResult, ListItemModel>(
      executor: website.session.executor,
      endpointId: endpoint.id,
      context: requestContext,
      itemsOf: (payload) => (payload.items ?? const [])
          .map(ListItemModel.new)
          .toList(growable: false),
    );
    bindPageLoader(
      PagedLoader<ListItemModel>(
        source: _source,
        failureMapper: const SiteRuntimeFailureMapper(),
      ),
    );
  }

  final EndpointRule endpoint;
  final SiteRenderConfigModel website;
  final RequestContext requestContext;
  late final MappedSitePageSource<ListParserResult, ListItemModel> _source;

  final ScrollController scrollController = ScrollController();
  final RefreshController refreshController = RefreshController();

  String searchKeywords = '';
  Map<String, String> currentFilter = const {};
  bool _disposed = false;

  Future<void> setNewFilter(
    List<String> filterKeys,
    Map<String, String> filter,
  ) async {
    currentFilter = Map<String, String>.unmodifiable(filter);
    _updateInputs();
    await refresh();
  }

  Future<void> onNewSearch(String keywords) async {
    searchKeywords = keywords.trim();
    _updateInputs();
    await refresh();
  }

  void _updateInputs() {
    _source.updateInputs({
      ...currentFilter,
      if (searchKeywords.isNotEmpty) 'search': searchKeywords,
    });
  }

  Future<void> requireFirstLoad() async {
    if (pageSnapshot.loadedCount == 0 && !pageSnapshot.isLoading) {
      await loadInitial();
    }
  }

  @override
  Future<void> loadNextPage() async {
    await pageLoader.loadNext();
    if (_disposed) return;
    _finishLoadMore();
  }

  @override
  Future<void> refresh() async {
    refreshController.resetNoData();
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

  bool get isFullScreenLoading => loadedItems.isEmpty && pageSnapshot.isLoading;
  bool get isFullScreenError =>
      loadedItems.isEmpty && pageSnapshot.failure != null;

  @override
  ListItemModel? itemAt(int index) => pageSnapshot.itemAt(index);

  @override
  Future<void> loadIndexModel(int index) => loadIndex(index);

  @override
  int get itemCount => pageSnapshot.visibleLength;

  @override
  int? get startReadIndex => null;

  @override
  ImageRepository get previewRepository => website.imageRepository;

  @override
  void dispose() {
    _disposed = true;
    disposePageLoader();
    scrollController.dispose();
    refreshController.dispose();
    super.dispose();
  }
}
