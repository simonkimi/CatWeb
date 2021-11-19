import 'package:catweb/ui/components/grey_tab_indicator.dart';
import 'package:catweb/ui/pages/rules_manager/rules_basic/rules_basic.dart';
import 'package:catweb/ui/pages/rules_manager/rules_parser/rules_parser_manager.dart';
import 'package:catweb/ui/pages/rules_manager/rules_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../i18n.dart';

class RulesEditPage extends StatelessWidget {
  RulesEditPage({Key? key}) : super(key: key);

  static const routeName = 'RulesEditPage';

  final store = RulesStore();

  CupertinoNavigationBar buildAppbar(BuildContext context) {
    return CupertinoNavigationBar(
      leading: CupertinoButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Icon(CupertinoIcons.back),
        padding: EdgeInsets.zero,
        minSize: 0,
      ),
      middle: const Text('规则编辑'),
      border: const Border(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: CupertinoPageScaffold(
          navigationBar: buildAppbar(context),
          child: SafeArea(
            child: Material(
              child: Column(
                children: [
                  buildTabBar(context),
                  Expanded(
                    child: TabBarView(
                      children: [
                        RulesBasic(store: store),
                        Container(),
                        RulesParserManager(store: store),
                        Container(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  TabBar buildTabBar(BuildContext context) {
    return TabBar(
      padding: EdgeInsets.zero,
      labelColor: CupertinoColors.systemBlue,
      indicator: const GreyUnderlineTabIndicator(),
      tabs: [
        buildTab(text: I.of(context).basic_setting),
        buildTab(text: I.of(context).page_manager),
        buildTab(text: I.of(context).parser),
        buildTab(text: I.of(context).action),
      ],
    );
  }

  Tab buildTab({required String text}) {
    return Tab(
      child: Text(
        text,
        style: const TextStyle(fontSize: 12),
      ),
      height: 25,
    );
  }
}
