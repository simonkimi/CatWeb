import 'package:catweb/data/models/site_model/pages/subpage.dart';
import 'package:catweb/data/models/site_model/pages/template.dart';
import 'package:catweb/data/models/site_model/parser/field.dart';
import 'package:get/get.dart';

class TemplateList implements ITemplate {
  TemplateList({
    String name = '',
    List<TemplateListSubPage>? subPages,
    List<TemplateListFilterItem>? filters,
    ScriptField? script,
    bool disableUnchanged = false,
    String targetItem = '',
    String targetAutoComplete = '',
  })  : name = name.obs,
        subPages = (subPages ?? []).obs,
        filters = (filters ?? []).obs,
        script = script ?? ScriptField(),
        disableUnchanged = disableUnchanged.obs,
        targetItem = targetItem.obs,
        targetAutoComplete = targetAutoComplete.obs,
        type = TemplateType.imageList;

  @override
  final TemplateType type;
  final RxString name;
  final RxList<TemplateListSubPage> subPages;
  final RxList<TemplateListFilterItem> filters;
  final ScriptField script;
  final RxBool disableUnchanged;
  final RxString targetItem;
  final RxString targetAutoComplete;

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.value,
      'name': name.value,
      'subPages': subPages.map((e) => e.toJson()).toList(),
      'filters': filters.map((e) => e.toJson()).toList(),
      'script': script.toJson(),
      'disableUnchanged': disableUnchanged.value,
      'targetItem': targetItem.value,
      'targetAutoComplete': targetAutoComplete.value,
    };
  }

  factory TemplateList.fromJson(Map<String, dynamic> json) {
    return TemplateList(
      name: json['name'],
      subPages: (json['subPages'] as List<dynamic>)
          .map((e) => TemplateListSubPage.fromJson(e))
          .toList(),
      filters: (json['filters'] as List<dynamic>)
          .map((e) => TemplateListFilterItem.fromJson(e))
          .toList(),
      script: ScriptField.fromJson(json['script']),
      disableUnchanged: json['disableUnchanged'],
      targetItem: json['targetItem'],
      targetAutoComplete: json['targetAutoComplete'],
    );
  }
}
