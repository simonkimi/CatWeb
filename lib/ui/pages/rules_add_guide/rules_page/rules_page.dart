import 'package:catweb/data/constant.dart';
import 'package:catweb/data/models/site_model/pages/site_page.dart';
import 'package:catweb/data/models/site_model/pages/template.dart';
import 'package:catweb/i18n.dart';
import 'package:catweb/ui/widgets/tab_bar.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_page/rules_page_basic.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_page/template_auto_complete.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'list_normal.dart';
import 'list_search.dart';

class RulesPageEdit extends HookWidget {
  const RulesPageEdit({
    super.key,
    required this.model,
  });

  final SitePage model;

  @override
  Widget build(BuildContext context) {
    if (model.template != null) {
      return CupertinoPageScaffold(
        navigationBar: _buildAppbar(context),
        child: CupertinoTabBarView(
          tabs: [
            CupertinoTab(I.of(context).basic),
            if (model.template is TemplateList) ...[
              const CupertinoTab('子页面'),
              CupertinoTab(I.of(context).filter),
            ],
            if (model.template is TemplateAutoComplete)
              CupertinoTab(I.of(context).setting),
          ],
          children: [
            RulesPageBasic(model: model),
            if (model.template is TemplateList) ...[
              ListNormalSubPage(model: model),
              ListFilterEditor(model: model),
            ],
            if (model.template is TemplateAutoComplete)
              TemplateAutoCompleteFragment(model: model),
          ],
        ),
      );
    }
    return CupertinoPageScaffold(
      navigationBar: _buildAppbar(context),
      child: RulesPageBasic(model: model),
    );
  }

  CupertinoNavigationBar _buildAppbar(BuildContext context) {
    return CupertinoNavigationBar(
      padding: kAppbarPadding,
      leading: CupertinoButton(
        onPressed: () {
          Navigator.of(context).pop(model);
        },
        padding: EdgeInsets.zero,
        minSize: 0,
        child: const Icon(CupertinoIcons.back),
      ),
      middle: Text(I.of(context).page),
      border: model.template != null ? const Border() : kDefaultNavBarBorder,
    );
  }
}
