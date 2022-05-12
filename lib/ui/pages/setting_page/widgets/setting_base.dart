import 'package:catweb/i18n.dart';
import 'package:flutter/cupertino.dart';

class SettingScaffold extends StatelessWidget {
  const SettingScaffold({
    super.key,
    this.fromSetting = true,
    this.title = '',
    required this.children,
  });

  final bool fromSetting;
  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      navigationBar: CupertinoNavigationBar(
        middle: Text(title),
        backgroundColor: CupertinoColors.systemGroupedBackground,
        previousPageTitle: fromSetting ? I.of(context).setting : null,
        padding: EdgeInsetsDirectional.zero,
        border: null,
      ),
      child: ListView(
        children: [
          const SizedBox(height: 16),
          ...children,
        ],
      ),
    );
  }
}
