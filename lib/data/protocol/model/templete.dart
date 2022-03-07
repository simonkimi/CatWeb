import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/gen/protobuf/template.pb.dart';
import 'package:catweb/ui/theme/colors.dart';
import 'package:catweb/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'interface.dart';

PbAble parseTemplate({
  required Template template,
  required List<int> data,
}) {
  switch (template) {
    case Template.TEMPLATE_IMAGE_VIEWER:
      return TemplateEmptyModel();

    case Template.TEMPLATE_GALLERY:
      return TemplateGalleryModel(
        data.isNotEmpty ? TemplateGalleryData.fromBuffer(data) : null,
      );

    case Template.TEMPLATE_AUTO_COMPLETE:
      return TemplateAutoCompleteModel(
        data.isNotEmpty ? TemplateAutoComplete.fromBuffer(data) : null,
      );

    case Template.TEMPLATE_IMAGE_LIST:
    case Template.TEMPLATE_IMAGE_WATERFALL:
      return TemplateListDataModel(
        data.isNotEmpty ? TemplateListData.fromBuffer(data) : null,
      );
  }
  throw Exception('Unknown template.proto type $template');
}

class TemplateGalleryModel implements PbAble {
  TemplateGalleryModel([TemplateGalleryData? pb])
      : targetReader = sobs(pb?.targetReader);

  final RxString targetReader;

  @override
  TemplateGalleryData toPb() => TemplateGalleryData(
        targetReader: targetReader.value,
      );
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

  final RxList<SearchFilterItem> filterItem;
  final RxString targetAutoComplete;
  final RxString script;
  final RxBool disableUnchanged;

  TemplateListDataModel([TemplateListData? pb])
      : subPages =
            lobs(pb?.subPages, (TemplateListData_SubPage e) => SubPageModel(e)),
        targetItem = sobs(pb?.targetItem),
        filterItem = lobs(pb?.filterItem,
            (TemplateListData_FilterItem e) => SearchFilterItem(e)),
        script = sobs(pb?.script),
        disableUnchanged = bobs(pb?.disableUnchanged),
        targetAutoComplete = sobs(pb?.targetAutoComplete);

  @override
  TemplateListData toPb() => TemplateListData(
        subPages: subPages.map((e) => e.toPb()),
        targetItem: targetItem.value,
        script: script.value,
        filterItem: filterItem.map((e) => e.toPb()),
        targetAutoComplete: targetAutoComplete.value,
        disableUnchanged: disableUnchanged.value,
      );
}

class SearchFilterItem implements PbAble {
  final RxString name;
  final RxString key;
  final Rx<TemplateListData_FilterType> type;
  final RxString color;
  final RxString value;

  SearchFilterItem([TemplateListData_FilterItem? pb])
      : name = sobs(pb?.name),
        key = sobs(pb?.key),
        type =
            pb?.type.obs ?? TemplateListData_FilterType.FILTER_TYPE_STRING.obs,
        value = sobs(pb?.value),
        color =
            pb?.color.string.obs ?? Colors.primaries.random().rpc.string.obs;

  @override
  TemplateListData_FilterItem toPb() => TemplateListData_FilterItem(
        name: name.value,
        key: key.value,
        type: type.value,
        value: value.value,
        color: parseColorString(color.value)?.rpc,
      );

  SearchFilterItem clone() => SearchFilterItem(toPb());
}

class TemplateAutoCompleteModel implements PbAble {
  final RxString splitChar;
  final RxString timeout;

  TemplateAutoCompleteModel([TemplateAutoComplete? pb])
      : splitChar = sobs(pb?.splitChar),
        timeout = pb?.timeout.toString().obs ?? '0'.obs;

  @override
  TemplateAutoComplete toPb() => TemplateAutoComplete(
        splitChar: splitChar.value,
        timeout: int.tryParse(timeout.value),
      );
}

class TemplateEmptyModel implements PbAble {
  TemplateEmptyModel([TemplateEmpty? pb]);

  @override
  TemplateEmpty toPb() => TemplateEmpty();
}

extension ExtraSelectorTypeTr on TemplateListData_FilterType {
  String string(BuildContext context) {
    switch (this) {
      case TemplateListData_FilterType.FILTER_TYPE_BOOL:
        return '布尔值';
      case TemplateListData_FilterType.FILTER_TYPE_NUMBER:
        return '数字';
      case TemplateListData_FilterType.FILTER_TYPE_STRING:
        return '字符串';
      case TemplateListData_FilterType.FILTER_TYPE_BOOL_CARD:
        return '布尔值 - 卡片';
    }
    return '';
  }
}

Map<String, dynamic> parseFilter(List<TemplateListData_FilterItem> filter) {
  return Map.fromEntries(filter.map((e) {
    switch (e.type) {
      case TemplateListData_FilterType.FILTER_TYPE_BOOL_CARD:
      case TemplateListData_FilterType.FILTER_TYPE_BOOL:
        return MapEntry(e.key, e.value.toLowerCase().trim() == 'true');
      case TemplateListData_FilterType.FILTER_TYPE_NUMBER:
        return MapEntry(e.key, int.tryParse(e.value));
      case TemplateListData_FilterType.FILTER_TYPE_STRING:
        return MapEntry(e.key, e.value);
    }
    return MapEntry(e.key, e.value);
  }));
}
