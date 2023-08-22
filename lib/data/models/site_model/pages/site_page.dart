import 'package:catweb/data/models/site_model/pages/template.dart';
import 'package:catweb/data/models/site_model/pages/template_list.dart';
import 'package:catweb/data/models/site_model/parser/parser.dart';
import 'package:get/get.dart';

enum SiteNetType {
  get('get'),
  post('post'),
  put('put'),
  delete('delete');

  final String value;

  const SiteNetType(this.value);

  static SiteNetType fromJson(String value) {
    return switch (value) {
      'get' => SiteNetType.get,
      'post' => SiteNetType.post,
      'put' => SiteNetType.put,
      'delete' => SiteNetType.delete,
      _ => SiteNetType.get
    };
  }
}

enum SiteDisplayType {
  show('show'),
  hide('hide'),
  shrink('shrink'),
  login('login');

  final String value;

  const SiteDisplayType(this.value);

  static SiteDisplayType fromJson(String value) {
    return SiteDisplayType.values.firstWhere((e) => e.value == value);
  }
}

class SitePage {
  SitePage({
    String name = '',
    required this.uuid,
    required this.template,
    String url = '',
    SiteNetType action = SiteNetType.get,
    String formData = '',
    String icon = '',
    SiteDisplayType displayType = SiteDisplayType.show,
    String flag = '',
    String parserId = '',
  })  : name = name.obs,
        url = url.obs,
        action = action.obs,
        formData = formData.obs,
        icon = icon.obs,
        displayType = displayType.obs,
        flag = flag.obs,
        parserId = parserId.obs;

  final RxString name;
  final String uuid;
  final ITemplate template;

  final RxString url;
  final Rx<SiteNetType> action;
  final RxString formData;
  final RxString icon;
  final Rx<SiteDisplayType> displayType;
  final RxString flag;
  final RxString parserId;

  ParserType acceptParserType() {
    return switch (template.type) {
      TemplateType.imageList ||
      TemplateType.imageWaterFall =>
        ParserType.listView,
      TemplateType.autoComplete => ParserType.autoComplete,
      TemplateType.gallery => ParserType.detail,
      TemplateType.imageViewer => ParserType.imageReader,
    };
  }

  List<String> getDependPage() {
    switch (template.type) {
      case TemplateType.imageList:
      case TemplateType.imageWaterFall:
        final model = template as TemplateList;
        return [model.targetItem.value, model.targetAutoComplete.value];
      default:
        return [];
    }
  }

  Map<String, dynamic> toJson() => {
        'name': name.value,
        'uuid': uuid,
        'url': url.value,
        'action': action.value.value,
        'formData': formData.value,
        'icon': icon.value,
        'displayType': displayType.value.value,
        'flag': flag.value,
        'parserId': parserId.value,
        'template': template.toJson(),
      };

  factory SitePage.fromJson(Map<String, dynamic> json) => SitePage(
        name: json['name'] as String,
        uuid: json['uuid'] as String,
        url: json['url'] as String,
        action: SiteNetType.fromJson(json['action'] as String),
        formData: json['formData'] as String,
        icon: json['icon'] as String,
        displayType: SiteDisplayType.fromJson(json['displayType'] as String),
        flag: json['flag'] as String,
        parserId: json['parserId'] as String,
        template: ITemplate.fromJson(json['template'] as Map<String, dynamic>),
      );

  bool containsFlag(String flag) {
    for (final flag in this.flag.split('|')) {
      if (flag.toLowerCase() == flag.toLowerCase()) {
        return true;
      }
    }
    return false;
  }
}
