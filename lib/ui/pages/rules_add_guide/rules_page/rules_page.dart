import 'package:catweb/data/constant.dart';
import 'package:catweb/data/protocol/model/page.dart';
import 'package:catweb/data/protocol/model/templete.dart';
import 'package:catweb/gen/protobuf/page.pbserver.dart';
import 'package:catweb/ui/components/cupertino_deletable_tile.dart';
import 'package:catweb/ui/components/cupertino_divider.dart';
import 'package:catweb/ui/components/cupertino_input.dart';
import 'package:catweb/ui/components/dialog.dart';
import 'package:catweb/ui/components/tab_bar.dart';
import 'package:catweb/ui/pages/rules_add_guide/controller/rules_edit_controller.dart';
import 'package:catweb/utils/icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_swipe_action_cell/core/controller.dart';
import 'package:get/get.dart';

import 'package:catweb/ui/theme/colors.dart';

class RulesPageEdit extends GetView<RulesEditController> {
  const RulesPageEdit({
    Key? key,
    required this.model,
  }) : super(key: key);

  final PageBlueprint model;

  @override
  Widget build(BuildContext context) {
    if (model.hasExtraData()) {
      return CupertinoPageScaffold(
        navigationBar: _buildAppbar(context),
        child: CupertinoTabBarView(
          tabs: [
            const CupertinoTab('基础'),
            if (model.templateData is TemplateListDataModel)
              const CupertinoTab('子页面'),
          ],
          children: [
            _buildBasic(context),
            if (model.templateData is TemplateListDataModel)
              _buildSubPage(context),
          ],
        ),
      );
    }
    return CupertinoPageScaffold(
      navigationBar: _buildAppbar(context),
      child: _buildBasic(context),
    );
  }

  Widget _buildBasic(BuildContext context) {
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
          const CupertinoDivider(height: 20),
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

  Widget _buildSubPage(BuildContext context) {
    final cookieController = SwipeActionController();
    final extra = model.templateData as TemplateListDataModel;
    return ColoredBox(
      color: CupertinoColors.systemGroupedBackground.resolveFrom(context),
      child: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              color: CupertinoColors.systemBackground.resolveFrom(context),
              border: Border.symmetric(
                  horizontal: BorderSide(
                width: 0.4,
                color: CupertinoColors.separator.resolveFrom(context),
              )),
            ),
            child: Column(
              children: [
                Obx(() => Column(
                      children: extra.subPages.asMap().entries.map((e) {
                        return Obx(() => CupertinoDeletableTile(
                            index: e.key,
                            controller: cookieController,
                            text:
                                '${e.value.name.value} - { ${e.value.key.value}: ${e.value.value.value} }',
                            onDelete: (index) {
                              extra.subPages.removeAt(index);
                            },
                            onTap: () => _editSubPage(context, e.value)));
                      }).toList(),
                    )),
                CupertinoClassicalListTile(
                  icon: Icon(
                    CupertinoIcons.add_circled_solid,
                    color: CupertinoColors.systemGreen.resolveFrom(context),
                  ),
                  text: '添加',
                  onTap: () {
                    extra.subPages.add(SubPageModel());
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> _editSubPage(BuildContext context, SubPageModel field) async {
    await showCupertinoDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            actions: [
              CupertinoButton(
                child: const Text('确定'),
                onPressed: () => Get.back(),
              )
            ],
            content: Column(
              children: [
                CupertinoInput(
                  labelText: '名称',
                  value: field.name,
                ),
                CupertinoInput(
                  labelText: '键',
                  value: field.key,
                ),
                CupertinoInput(
                  labelText: '值',
                  value: field.value,
                ),
              ],
            ),
          );
        });
  }

  Widget _buildOpenWidget(
    BuildContext context, {
    required String labelText,
    required RxString target,
  }) {
    return Obx(() => CupertinoReadOnlyInput(
          labelText: labelText,
          value: controller.blueprint.getPageName(target.value),
          onTap: () => _onOpenNewPageClick(context, target),
        ));
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
        ];
        break;

      case Template.TEMPLATE_IMAGE_LIST_WITH_SEARCH:
      case Template.TEMPLATE_IMAGE_WATERFALL_WITH_SEARCH:
        final extra = model.templateData as TemplateListSearchDataModel;
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

  void _onOpenNewPageClick(BuildContext context, RxString target) {
    showCupertinoSelectDialog(
            context: context,
            cancelText: '无',
            barrierDismissible: false,
            items: controller.blueprint.pageList
                .map((e) => SelectTileItem(
                      title: e.name.string,
                      value: e.uuid,
                    ))
                .toList())
        .then((value) {
      if (value != null) {
        target.value = value;
      } else {
        target.value = '';
      }
    });
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
                      cupertinoIcons[model.icon.value] ??
                          CupertinoIcons.question,
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

  CupertinoNavigationBar _buildAppbar(BuildContext context) {
    return CupertinoNavigationBar(
      padding: kAppbarPadding,
      leading: CupertinoButton(
        onPressed: () {
          Get.back();
        },
        child: const Icon(CupertinoIcons.back),
        padding: EdgeInsets.zero,
        minSize: 0,
      ),
      middle: const Text('页面'),
      border: model.hasExtraData() ? const Border() : kDefaultNavBarBorder,
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
