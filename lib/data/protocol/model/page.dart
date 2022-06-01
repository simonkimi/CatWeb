import 'package:catweb/data/protocol/model/interface.dart';
import 'package:catweb/data/protocol/model/parser.dart';
import 'package:catweb/data/protocol/model/templete.dart';
import 'package:catweb/gen/protobuf/actions.pbenum.dart';
import 'package:catweb/gen/protobuf/page.pbserver.dart';
import 'package:catweb/gen/protobuf/template.pb.dart';
import 'package:catweb/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class PageBlueprintModel implements PbAble {
  PageBlueprintModel(SitePage pb)
      : name = sobs(pb.name),
        uuid = genUuid(pb.uuid),
        url = sobs(pb.url),
        netAction = pb.netAction.obs,
        formData = pb.formData.obs,
        icon = sobs(pb.icon),
        display = pb.display.obs,
        flag = sobs(pb.flag),
        baseParser = sobs(pb.baseParser),
        template = pb.template.obs,
        templateData = parseTemplate(
          template: pb.template,
          data: pb.templateData,
        );

  factory PageBlueprintModel.create(Template template) =>
      PageBlueprintModel(SitePage(template: template));

  final RxString name;
  final String uuid;
  final RxString url;
  final RxString baseParser;
  final RxString icon;
  final Rx<SiteDisplayType> display;
  final RxString flag;
  final Rx<NetActionType> netAction;
  final RxString formData;

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
        formData: formData.value,
        netAction: netAction.value,
        flag: flag.value,
        templateData: templateData.toPb().writeToBuffer(),
        baseParser: baseParser.value,
      );

  bool containsFlag(String flag) => this
      .flag
      .value
      .split('|')
      .map((e) => e.trim().toLowerCase())
      .contains(flag.toLowerCase().trim());

  bool hasExtraData() => templateData is! TemplateEmptyModel;

  List<String> getDependPage() {
    switch (template.value) {
      case Template.TEMPLATE_AUTO_COMPLETE:
        break;
      case Template.TEMPLATE_GALLERY:
        break;
      case Template.TEMPLATE_IMAGE_VIEWER:
        break;
      case Template.TEMPLATE_IMAGE_WATERFALL:
      case Template.TEMPLATE_IMAGE_LIST:
        final model = templateData as TemplateListData;
        return [model.targetItem, model.targetAutoComplete];
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
        return '搜索 - 自动补全';
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
