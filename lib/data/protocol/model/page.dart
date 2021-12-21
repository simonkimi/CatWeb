import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/data/protocol/model/interface.dart';
import 'package:catweb/gen/protobuf/page.pbserver.dart';
import 'package:catweb/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SubPageModel implements PbAble, EnvMargeAble {
  SubPageModel([SiteSubPage? pb])
      : name = sobs(pb?.name),
        key = sobs(pb?.key),
        value = sobs(pb?.value);

  final RxString name;
  final RxString key;
  final RxString value;

  @override
  SiteSubPage toPb() => SiteSubPage(
        name: name.value,
        key: key.value,
        value: value.value,
      );

  @override
  Map<String, String> get env => <String, String>{name.value: value.value};
}

class SitePageModel implements PbAble {
  SitePageModel([SitePage? pb])
      : name = sobs(pb?.name),
        url = sobs(pb?.url),
        template = pb?.template.obs ?? PageTemplate.imageList.obs,
        parser = sobs(pb?.parser),
        subPages = lobs(pb?.subPage, (SiteSubPage pb) => SubPageModel(pb)),
        icon = sobs(pb?.icon),
        display = pb?.display.obs ?? SiteDisplayType.show.obs;

  final RxString name;
  final RxString url;
  final Rx<PageTemplate> template;
  final RxString parser;
  final RxList<SubPageModel> subPages;
  final RxString icon;
  final Rx<SiteDisplayType> display;

  @override
  SitePage toPb() => SitePage(
        name: name.value,
        template: template.value,
        url: url.value,
        parser: parser.value,
        subPage: subPages.map((SubPageModel p) => p.toPb()).toList(),
        icon: icon.value,
        display: display.value,
      );

  bool isValid() => name.value.isNotEmpty && parser.value.isNotEmpty;
}

extension PageTemplateTr on PageTemplate {
  String string(BuildContext context) {
    switch (this) {
      case PageTemplate.detail:
        return '详情';
      case PageTemplate.imageList:
        return '列表';
      case PageTemplate.imageWaterfall:
      default:
        return '图片瀑布流';
    }
  }
}

extension SiteDisplayTypeTr on SiteDisplayType {
  String string(BuildContext context) {
    switch (this) {
      case SiteDisplayType.show:
        return '总是显示';
      case SiteDisplayType.shrink:
        return '总是折叠';
      case SiteDisplayType.hide:
        return '隐藏';
      case SiteDisplayType.showWhenPossible:
      default:
        return '有空间则显示';
    }
  }
}
