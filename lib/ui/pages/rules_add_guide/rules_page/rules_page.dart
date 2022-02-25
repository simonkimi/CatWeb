import 'package:catweb/data/constant.dart';
import 'package:catweb/data/protocol/model/page.dart';
import 'package:catweb/data/protocol/model/templete.dart';
import 'package:catweb/ui/components/tab_bar.dart';
import 'package:catweb/ui/pages/rules_add_guide/controller/rules_edit_controller.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_page/rules_page_basic.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'list_normal.dart';
import 'list_search.dart';

class RulesPageEdit extends GetView<RulesEditController> {
  const RulesPageEdit({
    Key? key,
    required this.model,
  }) : super(key: key);

  final PageBlueprintModel model;

  @override
  Widget build(BuildContext context) {
    if (model.hasExtraData()) {
      return CupertinoPageScaffold(
        navigationBar: _buildAppbar(context),
        child: CupertinoTabBarView(
          tabs: [
            const CupertinoTab('基础'),
            if (model.templateData is TemplateListDataModel) ...[
              const CupertinoTab('子页面'),
              const CupertinoTab('过滤器'),
            ],
          ],
          children: [
            RulesPageBasic(model: model),
            if (model.templateData is TemplateListDataModel) ...[
              ListNormalSubPage(model: model),
              ListFilterEditor(model: model),
            ],
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
          Get.back();
        },
        child: const Icon(CupertinoIcons.back),
        padding: EdgeInsets.zero,
        minSize: 0,
      ),
      middle: const Text('页面'),
      border: model.hasExtraData() ? const Border() : kDefaultNavBarBorder,
    );
  }
}
