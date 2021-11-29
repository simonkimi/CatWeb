import 'package:catweb/data/protocol/model/store.dart';
import 'package:catweb/gen/protobuf/store.pbserver.dart';
import 'package:catweb/themes.dart';
import 'package:catweb/ui/components/dialog.dart';
import 'package:catweb/ui/components/grey_tab_indicator.dart';
import 'package:catweb/ui/pages/rules_manager/rules_advance/rules_advance.dart';
import 'package:catweb/ui/pages/rules_manager/rules_basic/rules_basic.dart';
import 'package:catweb/ui/pages/rules_manager/rules_page/rules_page_manager.dart';
import 'package:catweb/ui/pages/rules_manager/rules_parser/rules_parser_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../i18n.dart';

class RulesEditController extends GetxController {
  RulesEditController({RulesProtocol? pb})
      : rulesModel = RulesProtocolModel(pb);

  final RulesProtocolModel rulesModel;
}

class RulesEditPage extends StatelessWidget {
  const RulesEditPage({Key? key, this.pb}) : super(key: key);

  static const routeName = 'RulesEditPage';

  final RulesProtocol? pb;

  @override
  Widget build(BuildContext context) {
    Get.put(RulesEditController(pb: pb));

    return WillPopScope(
      onWillPop: () async {
        final result = await showCupertinoConfirmDialog(
          context: context,
          title: '退出',
          content: '您确定不保存而退出吗?\n所做的修改将不会保存.',
        );
        return result == true;
      },
      child: DefaultTabController(
        length: 5,
        child: CupertinoPageScaffold(
          navigationBar: buildAppbar(context),
          child: SafeArea(
            child: Column(
              children: [
                buildTabBar(context),
                Expanded(
                  child: TabBarView(
                    children: [
                      const RulesBasic(),
                      const RulesPageManager(),
                      const RulesParserManager(),
                      Container(),
                      RulesAdvance(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  CupertinoNavigationBar buildAppbar(BuildContext context) {
    return CupertinoNavigationBar(
      leading: CupertinoButton(
        onPressed: () {
          showCupertinoConfirmDialog(
            context: context,
            title: '退出',
            content: '您确定不保存而退出吗?\n所做的修改将不会保存.',
          ).then((value) {
            if (value == true) {
              Get.back();
            }
          });
        },
        child: const Icon(CupertinoIcons.back),
        padding: EdgeInsets.zero,
        minSize: 0,
      ),
      middle: const Text('规则编辑'),
      border: const Border(),
    );
  }

  Widget buildTabBar(BuildContext context) {
    return Material(
      color: CupertinoTheme.of(context).barBackgroundColor,
      child: TabBar(
        padding: EdgeInsets.zero,
        labelColor: FixColor.title.resolveFrom(context),
        indicator: const GreyUnderlineTabIndicator(),
        tabs: [
          buildTab(context: context, text: I.of(context).basic_setting),
          buildTab(context: context, text: I.of(context).page_manager),
          buildTab(context: context, text: I.of(context).parser),
          buildTab(context: context, text: I.of(context).action),
          buildTab(context: context, text: '高级'),
        ],
      ),
    );
  }

  Tab buildTab({required BuildContext context, required String text}) {
    return Tab(
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 12,
        ),
      ),
      height: 30,
    );
  }
}
