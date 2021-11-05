import 'package:catweb/ui/components/app_bar.dart';
import 'package:catweb/ui/components/dialog.dart';
import 'package:catweb/ui/pages/rules_manager/rules_basic/rules_basic.dart';
import 'package:catweb/ui/pages/rules_manager/rules_parser/rules_parser_manager.dart';
import 'package:catweb/ui/pages/rules_manager/rules_store.dart';
import 'package:flutter/material.dart';

import '../../../i18n.dart';

class RulesEditPage extends StatelessWidget {
  RulesEditPage({Key? key}) : super(key: key);

  static const routeName = 'RulesEditPage';

  final store = RulesStore();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final confirm = await showConfirmDialog(
            context: context, text: '您确定要退出吗? 所做的修改将不会保存.');
        return confirm == true;
      },
      child: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: buildAppBar(
            context,
            title: '规则管理',
            bottom: TabBar(
              tabs: [
                Tab(text: I.of(context).basic_setting),
                Tab(text: I.of(context).page_manager),
                Tab(text: I.of(context).parser),
                Tab(text: I.of(context).action),
                const Tab(text: '高级'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              RulesBasic(store: store),
              Container(),
              RulesParserManager(store: store),
              Container(),
              Container(),
            ],
          ),
        ),
      ),
    );
  }
}
