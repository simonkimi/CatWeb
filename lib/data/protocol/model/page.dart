import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/data/protocol/model/interface.dart';
import 'package:catweb/data/protocol/model/parser.dart';
import 'package:catweb/gen/protobuf/page.pbserver.dart';
import 'package:catweb/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OpenPageModel implements PbAble {
  OpenPageModel([OpenPage? pb])
      : target = sobs(pb?.target),
        inherit = pb?.inherit.obs ?? false.obs;

  final RxString target;
  final RxBool inherit;

  @override
  OpenPage toPb() => OpenPage(
        inherit: inherit.value,
        target: target.value,
      );
}

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
        display = pb?.display.obs ?? SiteDisplayType.show.obs,
        openPages = lobs(pb?.openPage, (OpenPage e) => OpenPageModel(e));

  final RxString name;
  final RxString url;
  final Rx<PageTemplate> template;
  final RxString parser;
  final RxList<SubPageModel> subPages;
  final RxString icon;
  final Rx<SiteDisplayType> display;

  final RxList<OpenPageModel> openPages;

  @override
  SitePage toPb() => SitePage(
        name: name.value,
        template: template.value,
        url: url.value,
        parser: parser.value,
        subPage: subPages.map((SubPageModel p) => p.toPb()).toList(),
        icon: icon.value,
        display: display.value,
        openPage: openPages.map((OpenPageModel p) => p.toPb()).toList(),
      );

  bool isValid() => name.value.isNotEmpty && parser.value.isNotEmpty;

  OpenPageModel _genOpenPageList(int len, int index) {
    if (openPages.length < len) {
      openPages.addAll(List.filled(len - openPages.length, OpenPageModel()));
    } else if (openPages.length > len) {
      openPages.removeRange(len, openPages.length);
    }
    return openPages[index];
  }

  OpenPageModel get listItemTarget => _genOpenPageList(1, 0);

  OpenPageModel get badgeTarget => _genOpenPageList(1, 0);

  bool get isMultiPage => [PageTemplate.imageList, PageTemplate.imageWaterfall]
      .contains(template.value);
}

extension PageTemplateTr on PageTemplate {
  String string(BuildContext context) {
    switch (this) {
      case PageTemplate.detail:
        return '详情';
      case PageTemplate.imageList:
        return '列表';
      case PageTemplate.imageWaterfall:
        return '瀑布流';
      case PageTemplate.imageViewer:
        return '图片查看器';
    }
    throw UnimplementedError('TODO! $this');
  }

  List<PageTemplate> get brother {
    final data = <List<PageTemplate>>[
      [PageTemplate.imageWaterfall, PageTemplate.imageList],
      [PageTemplate.detail]
    ];
    for (final parent in data) {
      for (final my in parent) {
        if (my == this) return parent;
      }
    }
    throw UnimplementedError('Not define brother ${this}');
  }

  Iterable<ParserBaseModel> parser(List<ParserBaseModel> input) {
    switch (this) {
      case PageTemplate.detail:
        return input.whereType<GalleryParserModel>();
      case PageTemplate.imageList:
      case PageTemplate.imageWaterfall:
      default:
        return input.whereType<ListViewParserModel>();
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
      default:
        return '有空间则显示';
    }
  }
}
