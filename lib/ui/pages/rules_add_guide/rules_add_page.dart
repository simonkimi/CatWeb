import 'package:catweb/data/database/database.dart';
import 'package:catweb/data/models/site_model/site_blue_map.dart';
import 'package:catweb/i18n.dart';
import 'package:catweb/ui/widgets/dialog.dart';
import 'package:catweb/ui/widgets/tab_bar.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_advance/rules_advance.dart';
import 'package:catweb/ui/pages/rules_add_guide/controller/rules_edit_controller.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_basic/rules_basic.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_page/rules_page_manager.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_parser/rules_parser_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RulesEditPage extends StatelessWidget {
  RulesEditPage({
    super.key,
    SiteBlueMap? blueMap,
    WebTableData? db,
  }) : controller = Get.put(RulesEditController(blueprint: blueMap, db: db));

  final RulesEditController controller;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _showExitConfine(context),
      child: CupertinoPageScaffold(
        navigationBar: _buildAppbar(context),
        child: CupertinoTabBarView(
          tabs: [
            CupertinoTab(I.of(context).basic_setting),
            CupertinoTab(I.of(context).page_manager),
            CupertinoTab(I.of(context).parser),
            CupertinoTab(I.of(context).identity),
          ],
          children: const [
            RulesBasic(),
            RulesPageManager(),
            RulesParserManager(),
            RulesAdvance(),
          ],
        ),
      ),
    );
  }

  CupertinoNavigationBar _buildAppbar(BuildContext context) {
    return CupertinoNavigationBar(
      padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
      leading: CupertinoButton(
        onPressed: () {
          _showExitConfine(context).then((value) {
            if (value) Get.back();
          });
        },
        padding: EdgeInsets.zero,
        minSize: 0,
        child: const Icon(CupertinoIcons.back),
      ),
      middle: Text(I.of(context).rule_edit),
      trailing: CupertinoButton(
        onPressed: () => _save(context),
        padding: EdgeInsets.zero,
        minSize: 0,
        child: Text(I.of(context).save, style: const TextStyle(fontSize: 15)),
      ),
      border: const Border(),
    );
  }

  Future<bool> _showExitConfine(BuildContext context) async {
    return (await showCupertinoConfirmDialog(
          context: context,
          title: I.of(context).exit,
          content: I.of(context).exit_not_save,
          showCancel: true,
        )) ==
        true;
  }

  Future<void> _save(BuildContext context) async {
    if (controller.blueprint.name.isEmpty) {
      showCupertinoConfirmDialog(
        context: context,
        title: I.of(context).title,
        content: I.of(context).rule_name_empty,
        showCancel: false,
      );
      return;
    }
    if (controller.blueprint.baseUrl.isEmpty) {
      showCupertinoConfirmDialog(
        context: context,
        title: I.of(context).website,
        content: I.of(context).base_url_empty,
        showCancel: false,
      );
      return;
    }

    await controller.save();
    Get.back();
  }
}
