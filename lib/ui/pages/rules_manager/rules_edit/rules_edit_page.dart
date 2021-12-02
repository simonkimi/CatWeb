import 'package:catweb/gen/protobuf/store.pbserver.dart';
import 'package:catweb/ui/components/dialog.dart';
import 'package:catweb/ui/components/tab_bar.dart';
import 'package:catweb/ui/pages/rules_manager/rules_advance/rules_advance.dart';
import 'package:catweb/ui/pages/rules_manager/rules_basic/rules_basic.dart';
import 'package:catweb/ui/pages/rules_manager/rules_edit/rules_edit_controller.dart';
import 'package:catweb/ui/pages/rules_manager/rules_page/rules_page_manager.dart';
import 'package:catweb/ui/pages/rules_manager/rules_parser/rules_parser_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../i18n.dart';

class RulesEditPage extends StatelessWidget {
  RulesEditPage({Key? key, this.pb})
      : controller = Get.put(RulesEditController(pb: pb)),
        super(key: key);

  static const routeName = 'RulesEditPage';
  final SiteProtobuf? pb;
  final RulesEditController controller;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => showExitConfine(context),
      child: CupertinoPageScaffold(
        navigationBar: buildAppbar(context),
        child: CupertinoTabBarView(
          tabs: [
            CupertinoTab(I.of(context).basic_setting),
            CupertinoTab(I.of(context).page_manager),
            CupertinoTab(I.of(context).parser),
            CupertinoTab(I.of(context).action),
            const CupertinoTab('高级'),
          ],
          children: [
            const RulesBasic(),
            const RulesPageManager(),
            const RulesParserManager(),
            Container(),
            RulesAdvance(),
          ],
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
      middle: const Text('规则编辑'),
      trailing: CupertinoButton(
        onPressed: () => save(context),
        child: const Icon(FontAwesomeIcons.save, size: 20),
        padding: EdgeInsets.zero,
        minSize: 0,
      ),
      border: const Border(),
    );
  }

  Future<bool> showExitConfine(BuildContext context) async {
    return (await showCupertinoConfirmDialog(
          context: context,
          title: '退出',
          content: '您确定不保存而退出吗?\n所做的修改将不会保存.',
        )) ==
        true;
  }

  Future<void> save(BuildContext context) async {
    if (controller.rulesModel.name.isEmpty) {
      showCupertinoConfirmDialog(
        context: context,
        title: '标题',
        content: '规则名称不能为空',
        showCancel: false,
      );
      return;
    }
    if (controller.rulesModel.baseUrl.isEmpty) {
      showCupertinoConfirmDialog(
        context: context,
        title: '网站',
        content: '基础Url不能为空',
        showCancel: false,
      );
      return;
    }
    Get.back(result: controller.rulesModel);
  }
}
