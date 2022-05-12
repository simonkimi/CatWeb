import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:catweb/ui/theme/colors.dart';
import 'grey_tab_indicator.dart';

class CupertinoTab extends StatelessWidget {
  const CupertinoTab(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Tab(
      height: 30,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          color: CupertinoColors.label.resolveFrom(context),
        ),
        maxLines: 1,
      ),
    );
  }
}

class CupertinoTabBarView extends StatelessWidget {
  const CupertinoTabBarView({
    super.key,
    required this.tabs,
    required this.children,
  }) : assert(tabs.length == children.length);

  final List<CupertinoTab> tabs;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    if (tabs.length == 1) return children.first;
    return DefaultTabController(
      length: tabs.length,
      child: SafeArea(
        child: Column(
          children: [
            Material(
              color: FixColor.navigationBarBackground.resolveFrom(context),
              child: TabBar(
                padding: EdgeInsets.zero,
                labelColor: FixColor.title.resolveFrom(context),
                indicator: const GreyUnderlineTabIndicator(),
                tabs: tabs,
              ),
            ),
            Expanded(child: TabBarView(children: children)),
          ],
        ),
      ),
    );
  }
}
