import 'dart:convert';

import 'package:catweb/data/controller/site.dart';
import 'package:catweb/data/loaders/page_loader.dart';
import 'package:catweb/data/models/ffi/result/base.dart';
import 'package:catweb/data/models/ffi/result/result.dart';
import 'package:catweb/data/models/image_with_preview.dart';
import 'package:catweb/data/models/page_loader_state.dart';
import 'package:catweb/data/models/site/page.dart';
import 'package:catweb/data/models/site/subpage.dart';
import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/get.dart';
import 'package:catweb/network/client/image_concurrency.dart';
import 'package:catweb/ui/pages/view_page/image/controller/image_load_controller.dart';
import 'package:catweb/utils/debug.dart';
import 'package:catweb/utils/helper.dart';
import 'package:catweb/utils/replace_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ListPageData extends BasePageData<ListItemModel> {
  ListPageData(this.pageData);

  final ListParserResult pageData;

  @override
  List<ListItemModel> get items =>
      pageData.items!.map((e) => ListItemModel(e)).toList();
}

/// List带预览加载的项目
class ListItemModel extends ImageWithPreviewModel {
  ListItemModel(this.previewModel);

  final ListParserResultItem previewModel;

  @override
  ImageResult get previewImage => previewModel.previewImage!;

  @override
  String? get idCode => previewModel.idCode;
}

class SubListNotifier
    extends BasePageLoaderNotifier<ListItemModel, ListPageData>
    implements ReaderInfo<ListItemModel, ListItemModel> {
  SubListNotifier({
    required this.siteRule,
    this.subPageModel,
  }) : localEnv =
            SiteEnvStore(subPageModel != null && subPageModel.value.isNotEmpty
                ? {
                    subPageModel.key.isNotEmpty ? subPageModel.key : 'subKey':
                        subPageModel.value,
                  }
                : null) {
    currentFilter =
        siteRule.templateList.filters.map((e) => e.copyWith()).toList();
  }

  final SitePageRule siteRule;
  final TemplateListSubPage? subPageModel;
  final SiteEnvStore localEnv;

  final ScrollController scrollController = ScrollController();
  final RefreshController refreshController = RefreshController();


  String searchKeywords = '';

  /// 开始一个新的搜索, 用户点击搜索按钮触发
  Future<void> onNewSearch(String keywords) async {
    searchKeywords = searchKeywords;
    localEnv.mergeMap({'search': keywords.trim()});
    await refresh();
  }



  @override
  Future<ListPageData> loadPageImpl(int page) async {
    var baseUrl = siteRule.url;
    if (hasPageExpression(baseUrl) || page == 0) {
      // 有面数
      baseUrl = pageReplace(baseUrl, page);
    } else {
      // 无面数, 最后一个为面数
      if (pageData.isNotEmpty) {
        final maxPage = iterableMax(pageData.keys);
        if (maxPage == null) {
          throw Exception('No page loaded? WTF?');
        }
        if (pageData[maxPage]!.pageData.nextPage?.isEmpty ?? true) {
          print('hasPageExpression loadNoData()');
          state = const PageLoaderState.end();
          return ListPageData(pageData[maxPage]!.pageData);
        }
        baseUrl = pageData[maxPage]!.pageData.nextPage!;
      }
    }
    baseUrl = localEnv.apply(baseUrl);
    // 添加缓存
    if (subPageModel != null && subPageModel!.key.isNotEmpty) {
      localEnv.mergeMap({
        subPageModel!.key: subPageModel!.value,
      });
    }

    logger.d('加载网址: $baseUrl');
    final data = await global.currentSite!.client.getList(
      url: baseUrl,
      model: siteRule,
      localEnv: localEnv,
    );

    if (!hasPageExpression(baseUrl) &&
        (data.nextPage == baseUrl || data.nextPage!.isEmpty)) {
      print('hasPageExpression loadNoData()');
      state = const PageLoaderState.end();
    }
    return ListPageData(data);
  }



  Future<Map<String, String>> resolveFilter() async {
    final map = <String, dynamic>{};
    for (final filter in currentFilter) {
      if (filter.key.isEmpty) continue;
      if (!filter.isChanged && filter.disabledUnchanged) continue;
      map[filter.key] = filter.value;
    }

    final json = jsonEncode(map);
    final result = "";
    if (result.startsWith('{')) {
      try {
        Map<String, dynamic> json2 = jsonDecode(result);
        return json2.map((key, value) => MapEntry(key, value.toString()));
      } catch (e) {
        logger.e('解析过滤器失败: $e');
        return {};
      }
    } else {
      return {'filter': result};
    }
  }

  SiteEnvStore get env => global.website.globalEnv.create(localEnv);

  // bool get useFilter => List.generate(extra.filters.length, (i) => i)
  //     .any((e) => filter[e].value.value != extra.filters[e].value.value);

  bool get isFullScreenLoading => items.isEmpty && state.isError;

  bool get isFullScreenError => items.isEmpty && state.isError;

  bool get isFilterChanged => currentFilter.any((e) => e.isChanged);

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  Future<void> requestFirstLoad() async {
    if (pages.isEmpty && state.isIdle) {
      await onLoadMore();
    }
  }

  @override
  int? get chunkSize => null;

  @override
  int? get totalSize => null;

  @override
  Future<void> loadIndexModel(int index) => loadIndex(index);

  @override
  int? get itemsCount => null;

  @override
  int? get startReadIndex => null;

  @override
  void onReaderIndexChanged(int index) {}

  @override
  late final previewConcurrency = ImageLoaderQueue(
    dio: global.currentSite!.client.imageDio,
    concurrency: 4,
  );

  SiteService get global => inject();
}
