import 'package:catweb/data/protocol/model/page.dart';
import 'package:catweb/data/protocol/model/templete.dart';
import 'package:catweb/gen/protobuf/page.pbenum.dart';
import 'package:catweb/gen/protobuf/template.pbenum.dart';
import 'package:catweb/gen/protobuf/template.pbserver.dart';
import 'package:catweb/ui/components/cupertino_divider.dart';
import 'package:catweb/ui/components/cupertino_input.dart';
import 'package:catweb/ui/components/dialog.dart';
import 'package:catweb/ui/pages/rules_add_guide/controller/rules_edit_controller.dart';
import 'package:catweb/ui/theme/colors.dart';
import 'package:catweb/utils/icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RulesPageBasic extends GetView<RulesEditController> {
  const RulesPageBasic({
    Key? key,
    required this.model,
  }) : super(key: key);

  final PageBlueprint model;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        children: [
          CupertinoInput(
            labelText: '名称',
            value: model.name,
          ),
          CupertinoInput(
            labelText: '网址',
            value: model.url,
          ),
          Obx(() => CupertinoReadOnlyInput(
                labelText: '解析器',
                value:
                    controller.blueprint.getParserName(model.baseParser.value),
                onTap: () => _onParserTap(context),
              )),
          const CupertinoDivider(height: 20),
          if (model.template.value != Template.TEMPLATE_IMAGE_VIEWER)
            Obx(() => CupertinoReadOnlyInput(
                  labelText: '显示方式',
                  value: model.display.value.string(context),
                  onTap: () => _onDisplayTap(context),
                )),
          _buildIcon(context),
          _buildOpenNewPage(context),
        ],
      ),
    );
  }

  Widget _buildOpenNewPage(BuildContext context) {
    late final List<Widget> body;
    switch (model.template.value) {
      case Template.TEMPLATE_AUTO_COMPLETE:
      case Template.TEMPLATE_GALLERY:
      case Template.TEMPLATE_IMAGE_VIEWER:
        body = [];
        break;

      case Template.TEMPLATE_IMAGE_LIST:
      case Template.TEMPLATE_IMAGE_WATERFALL:
        final extra = model.templateData as TemplateListDataModel;
        body = [
          _buildOpenWidget(
            context,
            labelText: '项目跳转',
            target: extra.targetItem,
          ),
          _buildOpenWidget(
            context,
            labelText: '自动补全设定',
            target: extra.targetAutoComplete,
            filter: (item) =>
                item.template.value == Template.TEMPLATE_AUTO_COMPLETE,
          ),
        ];
        break;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...body,
        ],
      ),
    );
  }

  Widget _buildIcon(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '图标',
            style: TextStyle(
                color: FixColor.title.resolveFrom(context), fontSize: 13),
          ),
          const SizedBox(height: 3),
          Row(
            children: [
              CupertinoButton(
                color: CupertinoColors.systemGroupedBackground
                    .resolveFrom(context),
                padding: EdgeInsets.zero,
                child: Obx(() => Icon(
                      cupertinoIcons[model.icon.value] ?? CupertinoIcons.app,
                      color: CupertinoColors.systemBlue.resolveFrom(context),
                    )),
                onPressed: () async {
                  final result = await showCupertinoIconDialog(context);
                  if (result != null && result.isNotEmpty) {
                    model.icon.value = result;
                  }
                },
              )
            ],
          )
        ],
      ),
    );
  }

  Future<void> _onParserTap(BuildContext context) async {
    final result = await showCupertinoSelectDialog<String>(
      title: '请选择解析器',
      context: context,
      items: model.template.value
          .parser(controller.blueprint.parsers)
          .map((e) => SelectTileItem(title: e.name.value, value: e.uuid))
          .toList(),
      cancelText: '取消',
    );
    if (result != null) {
      model.baseParser.value = result;
    }
  }

  Widget _buildOpenWidget(
    BuildContext context, {
    required String labelText,
    required RxString target,
    bool Function(PageBlueprint)? filter,
  }) {
    return Obx(() => CupertinoReadOnlyInput(
          labelText: labelText,
          value: controller.blueprint.getPageName(target.value),
          onTap: () => showCupertinoSelectDialog(
            context: context,
            items: [
              ...controller.blueprint.pageList
                  .where((e) => filter != null ? filter(e) : true)
                  .map((e) => SelectTileItem(
                        title: e.name.string,
                        value: e.uuid,
                      )),
              const SelectTileItem(title: '无', value: ''),
            ],
          ).then((value) {
            if (value != null) {
              target.value = value;
            }
          }),
        ));
  }

  Future<void> _onDisplayTap(BuildContext context) async {
    final result = await showCupertinoSelectDialog<SiteDisplayType>(
      title: '显示方式',
      context: context,
      items: SiteDisplayType.values
          .map((e) => SelectTileItem<SiteDisplayType>(
              title: e.string(context), value: e))
          .toList(),
      cancelText: '取消',
    );

    if (result != null) {
      model.display.value = result;
    }
  }
}
