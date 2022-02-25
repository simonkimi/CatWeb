import 'dart:convert';

import 'package:catweb/data/controller/site_controller.dart';
import 'package:catweb/data/models/load_more_model.dart';
import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/data/protocol/model/page.dart';
import 'package:catweb/data/protocol/model/templete.dart';
import 'package:catweb/ffi/ffi.dart';
import 'package:catweb/gen/protobuf/model.pbserver.dart';
import 'package:catweb/gen/protobuf/template.pbenum.dart';
import 'package:catweb/utils/replace_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:tuple/tuple.dart';

class SubListController extends LoadMoreModel<ListRpcModel_Item> {
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

  @override
  bool isItemExist(ListRpcModel_Item item) => items.contains(item);

  @override
  Future<List<ListRpcModel_Item>> loadPage(int page) async {
    var baseUrl = blueprint.url.value;
    baseUrl = localEnv.replace(pageReplace(baseUrl, page));

    // 添加缓存
    if (subPageModel != null && subPageModel!.key.value.isNotEmpty) {
      localEnv.mergeMap({
        subPageModel!.key.value: subPageModel!.value.value,
      });
    }

    print('加载网址: $baseUrl');
    final data = await global.website.client.getList(
      url: baseUrl,
      model: blueprint,
      localEnv: localEnv,
    );
    return data.items;
  }

  void resetFilter() {
    for (var i = 0; i < filter.length; i++) {
      filter[i].value.value = extra.filterItem[i].value.value;
    }
  }

  Future<Map<String, String>> resolveFilter() async {
    final map = <String, dynamic>{};
    for (final item in filter) {
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
    final result = await compute(runJs, Tuple2(extra.script.value, json));
    if (result.startsWith('{')) {
      Map<String, dynamic> json2 = jsonDecode(result);
      return json2.map((key, value) => MapEntry(key, value.toString()));
    } else {
      return {'filter': result};
    }
  }

  SiteEnvModel get env => global.website.globalEnv.create(localEnv);

  TemplateListDataModel get extra =>
      blueprint.templateData as TemplateListDataModel;
}
