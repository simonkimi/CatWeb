import 'package:catweb/data/constant.dart';
import 'package:catweb/data/models/site_model/pages/site_page.dart';
import 'package:catweb/data/models/site_model/pages/template.dart';
import 'package:catweb/data/models/site_model/pages/template_auto_complete.dart';
import 'package:catweb/data/models/site_model/pages/template_image_viewer.dart';
import 'package:catweb/data/models/site_model/pages/template_list.dart';
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
    required this.baseModel,
  });

  final SitePage baseModel;

  @override
  Widget build(BuildContext context) {
    if (baseModel.template.type != TemplateType.imageViewer) {
      return CupertinoPageScaffold(
        navigationBar: _buildAppbar(context),
        child: CupertinoTabBarView(
          tabs: [
            CupertinoTab(I.of(context).basic),
            if (baseModel.template is TemplateList) ...[
              const CupertinoTab('子页面'),
              CupertinoTab(I.of(context).filter),
            ],
            if (baseModel.template is TemplateAutoComplete)
              CupertinoTab(I.of(context).setting),
          ],
          children: [
            RulesPageBasic(
              sitePage: baseModel,
            ),
            if (baseModel.template is TemplateList) ...[
              ListNormalSubPage(
                templateBase: baseModel.template as TemplateList,
              ),
              ListFilterEditor(
                templateBase: baseModel.template as TemplateList,
              ),
            ],
            if (baseModel.template is TemplateAutoComplete)
              TemplateAutoCompleteEditor(
                templateBase: baseModel.template as TemplateAutoComplete,
              ),
          ],
        ),
      );
    }
    return CupertinoPageScaffold(
      navigationBar: _buildAppbar(context),
      child: RulesPageBasic(
        sitePage: baseModel,
      ),
    );
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
      border: baseModel.template is! TemplateImageViewer
          ? const Border()
          : kDefaultNavBarBorder,
    );
  }
}
