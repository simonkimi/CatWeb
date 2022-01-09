import 'package:catweb/data/constant.dart';
import 'package:catweb/data/protocol/model/page.dart';
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

  final SitePageModel model;

  @override
  Widget build(BuildContext context) {
    if (model.isMultiPage) {
      return CupertinoPageScaffold(
        navigationBar: _buildAppbar(context),
        child: CupertinoTabBarView(
          tabs: const [
            CupertinoTab('基础'),
            CupertinoTab('子页面'),
          ],
          children: [
            _buildBasic(context),
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

  Widget _buildSubPage(BuildContext context) {
    final cookieController = SwipeActionController();
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
                      children: model.subPages.asMap().entries.map((e) {
                        return Obx(() => CupertinoDeletableTile(
                            index: e.key,
                            controller: cookieController,
                            text:
                                '${e.value.name.value} - { ${e.value.key.value}: ${e.value.value.value} }',
                            onDelete: (index) {
                              model.subPages.removeAt(index);
                            },
                            onTap: () => editSubPage(context, e.value)));
                      }).toList(),
                    )),
                CupertinoClassicalListTile(
                  icon: Icon(
                    CupertinoIcons.add_circled_solid,
                    color: CupertinoColors.systemGreen.resolveFrom(context),
                  ),
                  text: '添加',
                  onTap: () {
                    model.subPages.add(SubPageModel(SiteSubPage()));
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> editSubPage(BuildContext context, SubPageModel field) async {
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
                labelText: '模板',
                value: model.template.value.string(context),
                onTap: () => _onTemplateTap(context),
              )),
          Obx(() => CupertinoReadOnlyInput(
                labelText: '解析器',
                value: controller.siteConfigModel
                    .getParserName(model.parser.value),
                onTap: () => _onParserTap(context),
              )),
          const CupertinoDivider(height: 20),
          if (model.template.value != PageTemplate.imageViewer)
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
      case PageTemplate.detail:
        body = [
          Obx(() => CupertinoReadOnlyInput(
                labelText: '徽章跳转',
                value: controller.siteConfigModel
                    .getPageName(model.badgeTarget.target.value),
                onTap: () => _onOpenNewPageClick(context, model.badgeTarget),
              )),
        ];
        break;
      case PageTemplate.imageList:
      case PageTemplate.imageWaterfall:
        body = [
          // 项目被点击
          Obx(() => CupertinoReadOnlyInput(
                labelText: '项目跳转',
                value: controller.siteConfigModel
                    .getPageName(model.badgeTarget.target.value),
                onTap: () => _onOpenNewPageClick(context, model.listItemTarget),
              )),
        ];
        break;
      case PageTemplate.imageViewer:
        body = [];
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

  void _onOpenNewPageClick(BuildContext context, OpenPageModel model) {
    showCupertinoSelectDialog(
            context: context,
            cancelText: '无',
            barrierDismissible: false,
            items: controller.siteConfigModel.pageList
                .map((e) => SelectTileItem(
                      title: e.name.string,
                      value: e.uuid,
                    ))
                .toList())
        .then((value) {
      if (value != null) {
        model.target.value = value;
      } else {
        model.target.value = '';
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
      border: model.isMultiPage ? const Border() : kDefaultNavBarBorder,
    );
  }

  Future<void> _onTemplateTap(BuildContext context) async {
    final result = await showCupertinoSelectDialog<PageTemplate>(
      title: '请选择页面模板',
      context: context,
      items: model.template.value.brother
          .map((e) => SelectTileItem(title: e.string(context), value: e))
          .toList(),
      cancelText: '取消',
    );

    if (result != null) {
      model.template.value = result;
    }
  }

  Future<void> _onParserTap(BuildContext context) async {
    final result = await showCupertinoSelectDialog<String>(
      title: '请选择解析器',
      context: context,
      items: model.template.value
          .parser(controller.siteConfigModel.parsers)
          .map((e) => SelectTileItem(title: e.name.value, value: e.uuid))
          .toList(),
      cancelText: '取消',
    );
    if (result != null) {
      model.parser.value = result;
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
