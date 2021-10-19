import 'package:cat_web/i18n.dart';
import 'package:cat_web/ui/components/app_bar.dart';
import 'package:cat_web/ui/page/rules_manager/rules_basic/rules_basic.dart';
import 'package:cat_web/ui/page/rules_manager/rules_parser/rules_parser_manager.dart';
import 'package:cat_web/ui/page/rules_manager/rules_store.dart';
import 'package:flutter/material.dart';

class RulesManager extends StatelessWidget {
  RulesManager({Key? key}) : super(key: key);

  final store = RulesStore(null);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
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
            ],
          ),
        ),
        body: TabBarView(
          children: [
            RulesBasic(store: store),
            Container(),
            RulesParserManager(store: store),
            Container(),
          ],
        ),
      ),
    );
  }
}
