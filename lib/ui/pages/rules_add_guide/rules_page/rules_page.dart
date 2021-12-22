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

import '../../../../themes.dart';

class RulesPageEdit extends GetView<RulesEditController> {
  const RulesPageEdit({
    Key? key,
    required this.model,
  }) : super(key: key);

  final SitePageModel model;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => showExitConfine(context),
      child: CupertinoPageScaffold(
        navigationBar: buildAppbar(context),
        child: CupertinoTabBarView(
          tabs: const [
            CupertinoTab('基础'),
            CupertinoTab('子页面'),
          ],
          children: [
            buildBasic(context),
            buildSubPage(context),
          ],
        ),
      ),
    );
  }

  Widget buildSubPage(BuildContext context) {
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

  Widget buildSubTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        '子页面',
        style: TextStyle(
            fontSize: 14,
            color: CupertinoColors.secondaryLabel.resolveFrom(context)),
      ),
    );
  }

  Widget buildBasic(BuildContext context) {
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
                onTap: () => onTemplateTap(context),
              )),
          Obx(() => CupertinoReadOnlyInput(
                labelText: '解析器',
                value: model.parser.value,
                onTap: () => onParserTap(context),
              )),
          const CupertinoDivider(height: 20),
          Obx(() => CupertinoReadOnlyInput(
                labelText: '显示方式',
                value: model.display.value.string(context),
                onTap: () => onDisplayTap(context),
              )),
          buildIcon(context),
        ],
      ),
    );
  }

  Widget buildIcon(BuildContext context) {
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

  CupertinoNavigationBar buildAppbar(BuildContext context) {
    return CupertinoNavigationBar(
      leading: CupertinoButton(
        onPressed: () {
          showExitConfine(context).then((value) {
            if (value) Get.back();
          });
        },
        child: const Icon(CupertinoIcons.back),
        padding: EdgeInsets.zero,
        minSize: 0,
      ),
      middle: const Text('页面'),
      border: const Border(),
    );
  }

  Future<bool> showExitConfine(BuildContext context) async {
    if (!model.isValid()) {
      return (await showCupertinoConfirmDialog(
            context: context,
            title: '返回',
            content: '没有设定名称或解析器, 将不会保存\n确定不保存直接退出吗?',
          ) ==
          true);
    }
    return true;
  }

  Future<void> onTemplateTap(BuildContext context) async {
    final result = await showCupertinoSelectDialog<PageTemplate>(
      title: '请选择页面模板',
      context: context,
      items: PageTemplate.values
          .map((e) => SelectTileItem(title: e.string(context), value: e))
          .toList(),
      cancelText: '取消',
    );
    if (result != null) {
      model.template.value = result;
    }
  }

  Future<void> onParserTap(BuildContext context) async {
    final result = await showCupertinoSelectDialog<String>(
      title: '请选择解析器',
      context: context,
      items: controller.siteConfigModel.parsers
          .map((e) => SelectTileItem(title: e.name.value, value: e.name.value))
          .toList(),
      cancelText: '取消',
    );
    if (result != null) {
      model.parser.value = result;
    }
  }

  Future<void> onDisplayTap(BuildContext context) async {
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
