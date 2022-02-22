import 'package:catweb/data/protocol/model/interface.dart';
import 'package:catweb/data/protocol/model/parser.dart';
import 'package:catweb/data/protocol/model/templete.dart';
import 'package:catweb/gen/protobuf/page.pbserver.dart';
import 'package:catweb/gen/protobuf/template.pb.dart';
import 'package:catweb/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class PageBlueprint implements PbAble {
  PageBlueprint(SitePage pb)
      : name = sobs(pb.name),
        uuid = genUuid(pb.uuid),
        url = sobs(pb.url),
        icon = sobs(pb.icon),
        display = pb.display.obs,
        flag = sobs(pb.flag),
        baseParser = sobs(pb.baseParser),
        template = pb.template.obs,
        templateData = parseTemplate(
          template: pb.template,
          data: pb.templateData,
        );

  factory PageBlueprint.create(Template template) =>
      PageBlueprint(SitePage(template: template));

  final RxString name;
  final String uuid;
  final RxString url;
  final RxString baseParser;
  final RxString icon;
  final Rx<SiteDisplayType> display;
  final RxString flag;

  final Rx<Template> template;
  final PbAble templateData;

  @override
  SitePage toPb() => SitePage(
        name: name.value,
        uuid: uuid,
        template: template.value,
        url: url.value,
        icon: icon.value,
        display: display.value,
        flag: flag.value,
        templateData: templateData.toPb().writeToBuffer(),
        baseParser: baseParser.value,
      );

  bool containsFlag(String flag) =>
      this.flag.value.split('|').map((e) => e.trim()).contains(flag);

  bool hasExtraData() => templateData is! TemplateEmptyModel;

  List<String> getDependPage() {
    if (templateData is TemplateListSearchData) {
      final model = templateData as TemplateListSearchData;
      return [model.targetItem, model.targetAutoComplete];
    }

    if (templateData is TemplateListData) {
      final model = templateData as TemplateListData;
      return [model.targetItem];
    }

    return [];
  }
}

extension PageTemplateTr on Template {
  String string(BuildContext context) {
    switch (this) {
      case Template.TEMPLATE_GALLERY:
        return '画廊';
      case Template.TEMPLATE_IMAGE_LIST:
        return '列表 - 常规';
      case Template.TEMPLATE_IMAGE_WATERFALL:
        return '瀑布流 - 常规';
      case Template.TEMPLATE_IMAGE_VIEWER:
        return '图片查看器';
      case Template.TEMPLATE_AUTO_COMPLETE:
        return '搜索-自动补全';
      case Template.TEMPLATE_IMAGE_LIST_WITH_SEARCH:
        return '列表 - 搜索';
      case Template.TEMPLATE_IMAGE_WATERFALL_WITH_SEARCH:
        return '瀑布流 - 搜索';
    }
    throw UnimplementedError('TODO! $this');
  }

  List<Template> get brother {
    final data = <List<Template>>[
      [Template.TEMPLATE_IMAGE_WATERFALL, Template.TEMPLATE_IMAGE_LIST],
      [Template.TEMPLATE_GALLERY]
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
      case Template.TEMPLATE_GALLERY:
        return input.whereType<GalleryParserModel>();

      case Template.TEMPLATE_IMAGE_LIST:
      case Template.TEMPLATE_IMAGE_WATERFALL:
      case Template.TEMPLATE_IMAGE_WATERFALL_WITH_SEARCH:
      case Template.TEMPLATE_IMAGE_LIST_WITH_SEARCH:
        return input.whereType<ListViewParserModel>();

      case Template.TEMPLATE_IMAGE_VIEWER:
        return input.whereType<ImageReaderParserModel>();

      case Template.TEMPLATE_AUTO_COMPLETE:
        return input.whereType<AutoCompleteParserModel>();
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
