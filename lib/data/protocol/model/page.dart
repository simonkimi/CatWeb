import 'package:catweb/data/protocol/model/interface.dart';
import 'package:catweb/gen/protobuf/page.pbserver.dart';
import 'package:catweb/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SubPageModel implements PbAble {
  SubPageModel([SiteSubPage? pb])
      : name = sobs(pb?.name),
        value = sobs(pb?.value);

  final RxString name;
  final RxString value;

  @override
  SiteSubPage toPb() => SiteSubPage(
        name: name.value,
        value: value.value,
      );
}

class SitePageModel implements PbAble {
  SitePageModel([SitePage? pb])
      : name = sobs(pb?.name),
        url = sobs(pb?.url),
        type = pb?.type.obs ?? PageTemplate.imageList.obs,
        parser = sobs(pb?.parser),
        subPages = lobs(pb?.subPage, (SiteSubPage pb) => SubPageModel(pb));

  final RxString name;
  final RxString url;
  final Rx<PageTemplate> type;
  final RxString parser;
  final RxList<SubPageModel> subPages;

  @override
  SitePage toPb() => SitePage(
        name: name.value,
        type: type.value,
        url: url.value,
        parser: parser.value,
        subPage: subPages.map((SubPageModel p) => p.toPb()).toList(),
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
