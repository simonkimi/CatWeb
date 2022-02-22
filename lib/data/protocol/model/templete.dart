import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/gen/protobuf/template.pb.dart';
import 'package:catweb/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'interface.dart';

PbAble parseTemplate({
  required Template template,
  required List<int> data,
}) {
  switch (template) {
    case Template.TEMPLATE_GALLERY:
    case Template.TEMPLATE_AUTO_COMPLETE:
    case Template.TEMPLATE_IMAGE_VIEWER:
      return TemplateEmptyModel();

    case Template.TEMPLATE_IMAGE_LIST:
    case Template.TEMPLATE_IMAGE_WATERFALL:
      return TemplateListDataModel(
        data.isNotEmpty ? TemplateListData.fromBuffer(data) : null,
      );

    case Template.TEMPLATE_IMAGE_LIST_WITH_SEARCH:
    case Template.TEMPLATE_IMAGE_WATERFALL_WITH_SEARCH:
      return TemplateListSearchDataModel(
        data.isNotEmpty ? TemplateListSearchData.fromBuffer(data) : null,
      );
  }
  throw Exception('Unknown template.proto type $template');
}

class SubPageModel implements PbAble, EnvMargeAble {
  SubPageModel([TemplateListData_SubPage? pb])
      : name = sobs(pb?.name),
        key = sobs(pb?.key),
        value = sobs(pb?.value);

  final RxString name;
  final RxString key;
  final RxString value;

  @override
  TemplateListData_SubPage toPb() => TemplateListData_SubPage(
        name: name.value,
        key: key.value,
        value: value.value,
      );

  @override
  Map<String, String> get env => <String, String>{name.value: value.value};
}

class TemplateListDataModel implements PbAble {
  final RxList<SubPageModel> subPages;
  final RxString targetItem;

  TemplateListDataModel([TemplateListData? pb])
      : subPages =
            lobs(pb?.subPages, (TemplateListData_SubPage e) => SubPageModel(e)),
        targetItem = sobs(pb?.targetItem);

  @override
  TemplateListData toPb() => TemplateListData(
        subPages: subPages.map((e) => e.toPb()),
        targetItem: targetItem.value,
      );
}

class SearchFilterItem implements PbAble {
  final RxString name;
  final RxString key;
  final Rx<TemplateListSearchData_FilterType> type;
  final RxString defaultValue;

  SearchFilterItem([TemplateListSearchData_FilterItem? pb])
      : name = sobs(pb?.name),
        key = sobs(pb?.key),
        type = pb?.type.obs ??
            TemplateListSearchData_FilterType.FILTER_TYPE_STRING.obs,
        defaultValue = sobs(pb?.defaultValue);

  @override
  TemplateListSearchData_FilterItem toPb() => TemplateListSearchData_FilterItem(
        name: name.value,
        key: key.value,
        type: type.value,
        defaultValue: defaultValue.value,
      );
}

class TemplateListSearchDataModel implements PbAble {
  final RxList<SearchFilterItem> filterItem;
  final RxString targetItem;
  final RxString targetAutoComplete;
  final RxString script;

  TemplateListSearchDataModel([TemplateListSearchData? pb])
      : filterItem = lobs(pb?.filterItem,
            (TemplateListSearchData_FilterItem e) => SearchFilterItem(e)),
        targetItem = sobs(pb?.targetItem),
        script = sobs(pb?.script),
        targetAutoComplete = sobs(pb?.targetAutoComplete);

  @override
  TemplateListSearchData toPb() => TemplateListSearchData(
        filterItem: filterItem.map((e) => e.toPb()),
        targetItem: targetItem.value,
        targetAutoComplete: targetAutoComplete.value,
        script: script.value,
      );
}

class TemplateEmptyModel implements PbAble {
  TemplateEmptyModel([TemplateEmpty? pb]);

  @override
  TemplateEmpty toPb() => TemplateEmpty();
}

extension ExtraSelectorTypeTr on TemplateListSearchData_FilterType {
  String string(BuildContext context) {
    switch (this) {
      case TemplateListSearchData_FilterType.FILTER_TYPE_BOOL:
        return '是/否';
      case TemplateListSearchData_FilterType.FILTER_TYPE_NUMBER:
        return '数字';
      case TemplateListSearchData_FilterType.FILTER_TYPE_STRING:
        return '字符串';
    }
    return '';
  }
}
