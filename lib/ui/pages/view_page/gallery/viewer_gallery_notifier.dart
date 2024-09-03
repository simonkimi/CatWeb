import 'package:catweb/data/controller/site.dart';
import 'package:catweb/data/loaders/page_loader.dart';
import 'package:catweb/data/models/gallery_models.dart';
import 'package:catweb/data/models/page_loader_state.dart';
import 'package:catweb/data/models/site/page.dart';
import 'package:catweb/data/models/site_env_model.dart';

import 'package:catweb/navigator.dart';
import 'package:catweb/network/client/image_concurrency.dart';
import 'package:catweb/utils/replace_utils.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ViewerGalleryNotifier
    extends BasePageLoaderNotifier<GalleryItemModel, GalleryPageModel> {
  ViewerGalleryNotifier({
    required this.siteRule,
    required this.localEnv,
  });

  final SitePageRule siteRule;
  final SiteEnvStore localEnv;
  final ImageLoaderQueue imageQueue = ImageLoaderQueue();
  GalleryPageModel? firstPage;

  final RefreshController refreshController = RefreshController();

  @override
  Future<GalleryPageModel> loadPageImpl(int page) async {
    var baseUrl = siteRule.url;
    if (hasPageExpression(siteRule.url) || page == 0) {
      baseUrl = pageReplace(siteRule.url, page);
    } else {
      if (pageData.isNotEmpty) {
        final prePageUrl = pageData[page - 1]?.pageData.nextPage;
        if (prePageUrl == null || prePageUrl.isEmpty) {
          throw Exception('Error: Jump page to index $page ?');
        }
        baseUrl = prePageUrl;
      }
    }
    baseUrl = localEnv.apply(baseUrl);

    final detail = await siteService.currentSite!.client.getDetail(
      url: baseUrl,
      model: siteRule,
      localEnv: localEnv,
    );

    if (!hasPageExpression(siteRule.url) &&
        (detail.nextPage == baseUrl || detail.nextPage?.isEmpty == true)) {
      state = const PageLoaderState.end();
    }

    var model = GalleryPageModel(detail);
    firstPage ??= model;
    return model;
  }

  Future<void> loadIndexModel(int index) => loadIndex(index);

  SiteService get siteService => getIt.get();

  @override
  int? get totalSize => firstPage?.pageData.imageCount;

  @override
  int? get chunkSize => firstPage?.pageData.countPrePage;

  bool get fillRemaining => state.isLoading && successiveItems.isEmpty;

  @override
  void dispose() {
    imageQueue.dispose();
    refreshController.dispose();
    super.dispose();
  }
}
