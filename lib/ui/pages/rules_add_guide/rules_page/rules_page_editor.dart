import 'package:catweb/data/constant.dart';
import 'package:catweb/data/models/site/page.dart';
import 'package:catweb/data/models/site/template.dart';
import 'package:catweb/i18n.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_page/site_page_notifier.dart';
import 'package:catweb/ui/widgets/tab_bar.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_page/rules_page_basic.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_page/template_auto_complete.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import 'list_normal.dart';
import 'list_search.dart';

class RulesPageEdit extends HookWidget {
  const RulesPageEdit({
    super.key,
    required this.pageRule,
  });

  final SitePageRule pageRule;

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => ChangeNotifierProvider(
        create: (_) => SitePageNotifier(pageRule),
      ),
      child: CupertinoPageScaffold(
        navigationBar: _buildAppbar(context),
        child: CupertinoTabBarView(
          tabs: [
            CupertinoTab(I.of(context).basic),
            ..._buildListTab(context),
            ..._buildAutoCompleteTab(context),
          ],
          children: [
            const RulesPageBasic(),
            ..._buildListPage(context),
            ..._buildAutoCompletePage(context),
          ],
        ),
      ),
    );
  }

  List<CupertinoTab> _buildListTab(BuildContext context) {
    if (pageRule.template is! PageTemplateList) return const [];
    return [
      const CupertinoTab('子页面'),
      CupertinoTab(I.of(context).filter),
    ];
  }

  List<Widget> _buildListPage(BuildContext context) {
    if (pageRule.template is! PageTemplateList) return const [];
    return const [
      ListNormalSubPage(),
      ListFilterEditor(),
    ];
  }

  List<CupertinoTab> _buildAutoCompleteTab(BuildContext context) {
    if (pageRule.template is! PageTemplateAutoComplete) return const [];
    return [
      CupertinoTab(I.of(context).setting),
    ];
  }

  List<Widget> _buildAutoCompletePage(BuildContext context) {
    if (pageRule.template is! PageTemplateAutoComplete) return const [];
    return const [
      TemplateAutoCompleteEditor(),
    ];
  }

  CupertinoNavigationBar _buildAppbar(
    BuildContext context,
  ) {
    return CupertinoNavigationBar(
      padding: kAppbarPadding,
      leading: CupertinoButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        padding: EdgeInsets.zero,
        minSize: 0,
        child: const Icon(CupertinoIcons.back),
      ),
      middle: Text(I.of(context).page),
      border: pageRule.template is! PageTemplateImageViewer
          ? const Border()
          : kDefaultNavBarBorder,
    );
  }
}
