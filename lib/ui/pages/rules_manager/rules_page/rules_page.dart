import 'package:catweb/data/protocol/model/page.dart';
import 'package:catweb/gen/protobuf/page.pbserver.dart';
import 'package:catweb/ui/components/cupertino_divider.dart';
import 'package:catweb/ui/components/cupertino_input.dart';
import 'package:catweb/ui/components/dialog.dart';
import 'package:catweb/ui/pages/rules_manager/rules_edit_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

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
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            children: [
              CupertinoInput(
                labelText: '名称',
                value: model.name,
              ),
              CupertinoInput(
                labelText: '网址',
                value: model.name,
                description: '可以使用 {var} 替换参数',
              ),
              const CupertinoDivider(height: 20),
              Obx(() => CupertinoReadOnlyInput(
                    labelText: '模板',
                    value: model.type.value.string(context),
                    onTap: () => onTemplateTap(context),
                  )),
              Obx(() => CupertinoReadOnlyInput(
                    labelText: '解析器',
                    value: model.parser.value,
                    onTap: () => onParserTap(context),
                  )),
            ],
          ),
        ),
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
      model.type.value = result;
    }
  }

  Future<void> onParserTap(BuildContext context) async {
    final result = await showCupertinoSelectDialog<String>(
      title: '请选择解析器',
      context: context,
      items: controller.rulesModel.parsers
          .map((e) => SelectTileItem(title: e.name.value, value: e.name.value))
          .toList(),
      cancelText: '取消',
    );
    if (result != null) {
      model.parser.value = result;
    }
  }
}
