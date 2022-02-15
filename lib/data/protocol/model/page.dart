import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/data/protocol/model/interface.dart';
import 'package:catweb/data/protocol/model/parser.dart';
import 'package:catweb/gen/protobuf/page.pbserver.dart';
import 'package:catweb/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

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
        uuid = genUuid(pb?.uuid),
        url = sobs(pb?.url),
        template = pb?.template.obs ?? Template.TEMPLATE_IMAGE_LIST.obs,
        parser = sobs(pb?.parser),
        subPages = lobs(pb?.subPage, (SiteSubPage pb) => SubPageModel(pb)),
        icon = sobs(pb?.icon),
        display = pb?.display.obs ?? SiteDisplayType.show.obs,
        flag = sobs(pb?.flag),
        openPages = lobs(pb?.openPage, (String e) => e.obs);

  final RxString name;
  final String uuid;
  final RxString url;
  final Rx<Template> template;
  final RxString parser;
  final RxList<SubPageModel> subPages;
  final RxString icon;
  final Rx<SiteDisplayType> display;
  final RxString flag;

  final RxList<RxString> openPages;

  @override
  SitePage toPb() => SitePage(
        name: name.value,
        uuid: uuid,
        template: template.value,
        url: url.value,
        parser: parser.value,
        subPage: subPages.map((SubPageModel p) => p.toPb()).toList(),
        icon: icon.value,
        display: display.value,
        openPage: openPages.map((e) => e.value).toList(),
        flag: flag.value,
      );

  bool isValid() => name.value.isNotEmpty && parser.value.isNotEmpty;

  bool containsFlag(String flag) =>
      this.flag.value.split('|').map((e) => e.trim()).contains(flag);

  RxString _genOpenPageList(int len, int index) {
    if (openPages.length < len) {
      openPages.addAll(List.filled(len - openPages.length, ''.obs));
    } else if (openPages.length > len) {
      openPages.removeRange(len, openPages.length);
    }
    return openPages[index];
  }

  RxString get listItemTarget => _genOpenPageList(1, 0);

  RxString get badgeTarget => _genOpenPageList(1, 0);

  bool get isMultiPage => [
        Template.TEMPLATE_IMAGE_LIST,
        Template.TEMPLATE_IMAGE_WATERFALL
      ].contains(template.value);
}

extension PageTemplateTr on Template {
  String string(BuildContext context) {
    switch (this) {
      case Template.TEMPLATE_DETAIL:
        return '详情';
      case Template.TEMPLATE_IMAGE_LIST:
        return '列表';
      case Template.TEMPLATE_IMAGE_WATERFALL:
        return '瀑布流';
      case Template.TEMPLATE_IMAGE_VIEWER:
        return '图片查看器';
      case Template.TEMPLATE_AUTO_COMPLETE:
        return '搜索自动补全';
    }
    throw UnimplementedError('TODO! $this');
  }

  List<Template> get brother {
    final data = <List<Template>>[
      [Template.TEMPLATE_IMAGE_WATERFALL, Template.TEMPLATE_IMAGE_LIST],
      [Template.TEMPLATE_DETAIL]
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
      case Template.TEMPLATE_DETAIL:
        return input.whereType<DetailParserModel>();
      case Template.TEMPLATE_IMAGE_LIST:
      case Template.TEMPLATE_IMAGE_WATERFALL:
        return input.whereType<ListViewParserModel>();
      case Template.TEMPLATE_IMAGE_VIEWER:
        return input.whereType<ImageParserModel>();
      case Template.TEMPLATE_AUTO_COMPLETE:
        // TODO: Handle this case.
        break;
    }
    throw UnimplementedError('TODO! $this');
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
    }
    throw UnimplementedError('TODO! $this');
  }
}

String genUuid([String? input]) {
  return (input != null && input.isNotEmpty)
      ? input
      : const Uuid().v4().toString();
}
