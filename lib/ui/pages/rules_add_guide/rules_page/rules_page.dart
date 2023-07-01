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
    required this.baseModel,
    required this.onModelChanged,
  });

  final SitePage baseModel;
  final Function(SitePage) onModelChanged;

  @override
  Widget build(BuildContext context) {
    final model = useState(baseModel);
    model.addListener(() {
      onModelChanged(model.value);
    });

    if (model.value.template.type != TemplateType.imageViewer) {
      return CupertinoPageScaffold(
        navigationBar: _buildAppbar(model, context),
        child: CupertinoTabBarView(
          tabs: [
            CupertinoTab(I.of(context).basic),
            if (model.value.template is TemplateList) ...[
              const CupertinoTab('子页面'),
              CupertinoTab(I.of(context).filter),
            ],
            if (model.value.template is TemplateAutoComplete)
              CupertinoTab(I.of(context).setting),
          ],
          children: [
            RulesPageBasic(
              sitePage: model.value,
              onModelChanged: (value) {
                model.value = value;
              },
            ),
            if (model.value.template is TemplateList) ...[
              ListNormalSubPage(
                templateBase: model.value.template as TemplateList,
                onTemplateChanged: (template) {
                  model.value = model.value.copyWith(template: template);
                },
              ),
              ListFilterEditor(
                templateBase: model.value.template as TemplateList,
                onTemplateChanged: (template) {
                  model.value = model.value.copyWith(template: template);
                },
              ),
            ],
            if (model.value.template is TemplateAutoComplete)
              TemplateAutoCompleteEditor(
                templateBase: model.value.template as TemplateAutoComplete,
                onTemplateChanged: (value) {
                  model.value = model.value.copyWith(template: value);
                },
              ),
          ],
        ),
      );
    }
    return CupertinoPageScaffold(
      navigationBar: _buildAppbar(model, context),
      child: RulesPageBasic(
        sitePage: model.value,
        onModelChanged: (value) {
          model.value = value;
        },
      ),
    );
  }

  CupertinoNavigationBar _buildAppbar(
    ValueNotifier<SitePage> model,
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
      border: model.value.template is! TemplateImageViewer
          ? const Border()
          : kDefaultNavBarBorder,
    );
  }
}
