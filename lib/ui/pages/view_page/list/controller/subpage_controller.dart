import 'dart:convert';

import 'package:catweb/data/controller/site_service.dart';
import 'package:catweb/data/models/ffi/result/base.dart';
import 'package:catweb/data/models/ffi/result/result.dart';
import 'package:catweb/data/models/image_with_preview.dart';
import 'package:catweb/data/loaders/load_more_model.dart';
import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/data/models/site_model/pages/site_page.dart';
import 'package:catweb/data/models/site_model/pages/subpage.dart';
import 'package:catweb/data/models/site_model/pages/template_list.dart';
import 'package:catweb/network/client/image_concurrency.dart';
import 'package:catweb/ui/pages/view_page/image/controller/image_load_controller.dart';
import 'package:catweb/utils/debug.dart';
import 'package:catweb/utils/helper.dart';
import 'package:catweb/utils/replace_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FilterObx {
  FilterObx(TemplateListFilterItem raw)
      : name = raw.name.value,
        key = raw.key.value,
        type = raw.type.value,
        value = raw.value,
        color = raw.color.color;

  FilterObx.from(FilterObx raw)
      : name = raw.name,
        key = raw.key,
        type = raw.type,
        value = raw.value.value.obs,
        color = raw.color;

  final String name;
  final String key;
  final FilterType type;

  final ValueNotifier<String> value;
  final Color color;

  FilterObx copyWith() => FilterObx.from(this);
}

class ListPageItem extends LoadMorePage<ListParserResult, ListParserResultItem,
    ListItemModel> {
  ListPageItem(super.pageData);

  @override
  List<ListParserResultItem> get items => pageData.items!;

  @override
  List<ListItemModel> genModel() => items.map((e) => ListItemModel(e)).toList();
}

/// List带预览加载的项目
class ListItemModel extends ImageWithPreviewModel<ListParserResultItem> {
  ListItemModel(super.previewModel);

  @override
  ImageResult get previewImage => previewModel.previewImage!;

  @override
  ListParserResultItem get value => previewModel;

  @override
  String? get idCode => value.idCode;
}

class SubListController extends LoadMoreLoader<
    ListParserResult,
    ListParserResultItem,
    ListItemModel> implements ReaderInfo<ListParserResultItem, ListItemModel> {
  SubListController({
    required this.blueprint,
    this.subPageModel,
  }) : localEnv =
            SiteEnvStore(subPageModel != null && subPageModel.value.isNotEmpty
                ? {
                    subPageModel.key.value.isNotEmpty
                        ? subPageModel.key.value
                        : 'subKey': subPageModel.value.value,
                  }
                : null);

  final SitePage blueprint;
  final TemplateListSubPage? subPageModel;
  final SiteEnvStore localEnv;
  final global = get<SiteService>();

  late final filter = extra.filters.map((e) => FilterObx(e)).toList().obs;
  late final currentFilter = filter.map((e) => e.copyWith()).toList();

  var filterKeys = <String>{};

  final scrollController = ScrollController();

  Future<void> applyFilter([bool refresh = false]) async {
    currentFilter.clear();
    if (useFilter) {
      currentFilter.addAll(filter.map((e) => e.copyWith()));
      final map = await resolveFilter();
      filterKeys.addAll(map.keys);
      localEnv.mergeMap(map);
    } else {
      localEnv.removeKeys(filterKeys);
    }
    if (refresh) {
      await onRefresh();
    }
  }

  Future<void> onNewSearch(String keywords) async {
    await applyFilter();
    localEnv.mergeMap({'search': keywords.trim()});
    await onRefresh();
  }

  @override
  Future<ListPageItem> netWorkLoadPage(
    int page,
  ) async {
    var baseUrl = blueprint.url.value;
    if (hasPageExpression(baseUrl) || page == 0) {
      // 有面数
      baseUrl = pageReplace(baseUrl, page);
    } else {
      // 无面数, 最后一个为面数
      if (pages.isNotEmpty) {
        final maxPage = iterableMax(pages.keys);
        if (maxPage == null) {
          throw Exception('No page loaded? WTF?');
        }
        if (pages[maxPage]!.pageData.nextPage?.isEmpty ?? true) {
          print('hasPageExpression loadNoData()');
          stateLoadNoData();
          return ListPageItem(pages[maxPage]!.pageData);
        }
        baseUrl = pages[maxPage]!.pageData.nextPage!;
      }
    }
    baseUrl = localEnv.apply(baseUrl);
    // 添加缓存
    if (subPageModel != null && subPageModel!.key.isNotEmpty) {
      localEnv.mergeMap({
        subPageModel!.key.value: subPageModel!.value.value,
      });
    }

    logger.d('加载网址: $baseUrl');
    final data = await global.website.client.getList(
      url: baseUrl,
      model: blueprint,
      localEnv: localEnv,
    );

    if (!hasPageExpression(baseUrl) &&
        (data.nextPage == baseUrl || data.nextPage!.isEmpty)) {
      print('hasPageExpression loadNoData()');
      stateLoadNoData();
    }
    return ListPageItem(data);
  }

  void resetFilter() {
    for (var i = 0; i < filter.length; i++) {
      filter[i].value.value = extra.filters[i].value.value;
    }
  }

  Future<Map<String, String>> resolveFilter() async {
    final map = <String, dynamic>{};
    for (final item in currentFilter) {
      if (item.key.isNotEmpty) {
        dynamic value;
        switch (item.type) {
          case FilterType.boolCard:
          case FilterType.bool:
            value = item.value.value.trim().toLowerCase() == 'true';
            break;
          case FilterType.number:
            value = int.tryParse(item.value.value);
            break;
          case FilterType.string:
            value = item.value.value;
            break;
        }
        map[item.key] = value;
      }
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

  TemplateList get extra => blueprint.template as TemplateList;

  bool get useFilter => List.generate(extra.filters.length, (i) => i)
      .any((e) => filter[e].value.value != extra.filters[e].value.value);

  bool get isFullScreenLoading => items.isEmpty && state.isLoading;

  bool get isFullScreenError => items.isEmpty && errorMessage != null;

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
  late final previewConcurrency = ImageListConcurrency(
    dio: global.client!.imageDio,
    concurrency: 4,
  );
}
