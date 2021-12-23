import 'package:catweb/data/database/database.dart';
import 'package:catweb/gen/protobuf/store.pbserver.dart';
import 'package:catweb/ui/components/dialog.dart';
import 'package:catweb/ui/components/tab_bar.dart';
import 'package:catweb/ui/pages/rules_add_guide//rules_advance/rules_advance.dart';
import 'package:catweb/ui/pages/rules_add_guide/controller/rules_edit_controller.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_basic/rules_basic.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_page/rules_page_manager.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_parser/rules_parser_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../i18n.dart';

class RulesEditPage extends StatelessWidget {
  RulesEditPage({Key? key, SiteConfig? pb, SiteTableData? db})
      : controller = Get.put(RulesEditController(pb: pb, db: db)),
        super(key: key);

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
            // CupertinoTab(I.of(context).action),
            const CupertinoTab('高级'),
          ],
          children: const [
            RulesBasic(),
            RulesPageManager(),
            RulesParserManager(),
            // Container(),
            RulesAdvance(),
          ],
        ),
      ),
    );
  }

  CupertinoNavigationBar buildAppbar(BuildContext context) {
    return CupertinoNavigationBar(
      padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
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
        child: const Text('保存', style: TextStyle(fontSize: 15)),
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
    if (controller.siteConfigModel.name.isEmpty) {
      showCupertinoConfirmDialog(
        context: context,
        title: '标题',
        content: '规则名称不能为空',
        showCancel: false,
      );
      return;
    }
    if (controller.siteConfigModel.baseUrl.isEmpty) {
      showCupertinoConfirmDialog(
        context: context,
        title: '网站',
        content: '基础Url不能为空',
        showCancel: false,
      );
      return;
    }

    await controller.save();
    Get.back();
  }
}
