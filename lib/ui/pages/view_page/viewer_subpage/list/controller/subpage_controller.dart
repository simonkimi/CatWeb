import 'dart:convert';

import 'package:catweb/data/controller/site_controller.dart';
import 'package:catweb/data/models/image_with_preview.dart';
import 'package:catweb/data/loaders/load_more_model.dart';
import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/data/protocol/model/page.dart';
import 'package:catweb/data/protocol/model/templete.dart';
import 'package:catweb/gen/protobuf/model.pbserver.dart';
import 'package:catweb/gen/protobuf/template.pbenum.dart';
import 'package:catweb/network/client/image_concurrency.dart';
import 'package:catweb/ui/pages/view_page/viewer_subpage/image/controller/image_load_controller.dart';
import 'package:catweb/utils/debug.dart';
import 'package:catweb/utils/helper.dart';
import 'package:catweb/utils/replace_utils.dart';
import 'package:catweb_parser/catweb_parser.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:tuple/tuple.dart';

class ListPageItem
    extends LoadMorePage<ListRpcModel, ListRpcModel_Item, ListItemModel> {
  ListPageItem(super.pageData);

  @override
  List<ListRpcModel_Item> get items => pageData.items;

  @override
  List<ListItemModel> genModel() => items.map((e) => ListItemModel(e)).toList();
}

/// List带预览加载的项目
class ListItemModel extends ImageWithPreviewModel<ListRpcModel_Item> {
  ListItemModel(super.previewModel);

  @override
  ImageRpcModel get previewImage => previewModel.previewImg;

  @override
  ListRpcModel_Item get value => previewModel;

  @override
  String? get idCode => value.target;
}

class SubListController
    extends LoadMoreLoader<ListRpcModel, ListRpcModel_Item, ListItemModel>
    implements ReaderInfo<ListRpcModel_Item, ListItemModel> {
  SubListController({
    required this.blueprint,
    this.subPageModel,
  }) : localEnv =
            SiteEnvModel(subPageModel != null && subPageModel.value.isNotEmpty
                ? {
                    subPageModel.key.value.isNotEmpty
                        ? subPageModel.key.value
                        : 'subKey': subPageModel.value.value,
                  }
                : null);

  final PageBlueprintModel blueprint;
  final SubPageModel? subPageModel;
  final SiteEnvModel localEnv;
  final global = Get.find<GlobalController>();

  late final filter = extra.filterItem.map((e) => e.clone()).toList().obs;
  late final currentFilter = filter.map((e) => e.clone()).toList();

  var filterKeys = <String>{};

  final scrollController = ScrollController();

  Future<void> applyFilter([bool refresh = false]) async {
    currentFilter.clear();
    if (useFilter) {
      currentFilter.addAll(filter.map((e) => e.clone()));
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
        baseUrl = pages[maxPage]!.pageData.nextPage;
      }
    }
    baseUrl = localEnv.replace(baseUrl);
    // 添加缓存
    if (subPageModel != null && subPageModel!.key.value.isNotEmpty) {
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
        (data.nextPage == baseUrl || data.nextPage.isEmpty)) {
      print('hasPageExpression loadNoData()');
      loadNoData();
    }
    return ListPageItem(data);
  }

  void resetFilter() {
    for (var i = 0; i < filter.length; i++) {
      filter[i].value.value = extra.filterItem[i].value.value;
    }
  }

  Future<Map<String, String>> resolveFilter() async {
    final map = <String, dynamic>{};
    for (final item in currentFilter) {
      if (item.key.isNotEmpty) {
        dynamic value;
        switch (item.type.value) {
          case TemplateListData_FilterType.FILTER_TYPE_BOOL_CARD:
          case TemplateListData_FilterType.FILTER_TYPE_BOOL:
            value = item.value.value.trim().toLowerCase() == 'true';
            break;
          case TemplateListData_FilterType.FILTER_TYPE_NUMBER:
            value = int.tryParse(item.value.value);
            break;
          case TemplateListData_FilterType.FILTER_TYPE_STRING:
            value = item.value.value;
            break;
        }
        map[item.key.value] = value;
      }
    }

    final json = jsonEncode(map);
    final result =
        await compute(NativeBinder.runJs, Tuple2(extra.script.value, json));
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

  SiteEnvModel get env => global.website.globalEnv.create(localEnv);

  TemplateListDataModel get extra =>
      blueprint.templateData as TemplateListDataModel;

  bool get useFilter => List.generate(extra.filterItem.length, (i) => i)
      .any((e) => filter[e].value.value != extra.filterItem[e].value.value);

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
