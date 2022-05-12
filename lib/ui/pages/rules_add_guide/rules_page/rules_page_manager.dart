import 'package:catweb/data/protocol/model/page.dart';
import 'package:catweb/gen/protobuf/template.pbenum.dart';
import 'package:catweb/i18n.dart';
import 'package:catweb/ui/widgets/cupertino_list_tile.dart';
import 'package:catweb/ui/widgets/dialog.dart';
import 'package:catweb/ui/pages/rules_add_guide/controller/rules_edit_controller.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_page/rules_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum _MenuSelect {
  edit,
  delete,
}

class RulesPageManager extends GetView<RulesEditController> {
  const RulesPageManager({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      children: [
        Obx(() => Column(
              mainAxisSize: MainAxisSize.min,
              children: controller.blueprint.pageList.map((e) {
                return CupertinoListTile(
                  title: Text(e.name.value),
                  subtitle: Text(e.template.value.string(context)),
                  trailing: CupertinoButton(
                    padding: EdgeInsets.zero,
                    minSize: 10,
                    child: const Icon(Icons.more_horiz_outlined),
                    onPressed: () => _onTrailingTap(context, e),
                  ),
                  onTap: () => _toRulesPageEdit(context, e),
                );
              }).toList(),
            )),
        CupertinoListTile(
          title: Text(I.of(context).add),
          leading: const Icon(Icons.add),
          onTap: () {
            _toRulesPageEdit(context);
          },
        ),
      ],
    );
  }

  Future<void> _onTrailingTap(
    BuildContext context,
    PageBlueprintModel model,
  ) async {
    final result = await showCupertinoSelectDialog<_MenuSelect>(
      cancelText: I.of(context).cancel,
      context: context,
      items: [
        SelectTileItem(title: I.of(context).edit, value: _MenuSelect.edit),
        SelectTileItem(
          title: I.of(context).delete,
          value: _MenuSelect.delete,
          destructive: true,
        ),
      ],
    );
    switch (result) {
      case null:
        break;
      case _MenuSelect.edit:
        await _toRulesPageEdit(context, model);
        break;
      case _MenuSelect.delete:
        _onPageDelete(context, model);
        break;
    }
  }

  void _onPageDelete(BuildContext context, PageBlueprintModel model) {
    final using = controller.blueprint.pageList
        .where(
            (p0) => p0.getDependPage().any((element) => element == model.uuid))
        .map((e) => e.name.value)
        .toList();
    if (using.isNotEmpty) {
      showCupertinoConfirmDialog(
          context: context,
          content: '无法删除, 因下列页面会跳转到此页面:\n ${using.join(' ')}');
    } else {
      showCupertinoConfirmDialog(
        context: context,
        content: '确定要删除 ${model.name} 吗？',
        title: I.of(context).cancel,
        confineText: I.of(context).delete,
        confineTextColor: CupertinoColors.systemRed.resolveFrom(context),
      ).then((value) {
        if (value == true) {
          controller.blueprint.pageList.remove(model);
        }
      });
    }
  }

  Future<void> _toRulesPageEdit(BuildContext context,
      [PageBlueprintModel? model]) async {
    final input = model ?? await _genRules(context);
    if (input == null) return;
    await Get.to(() => RulesPageEdit(model: input));
    if (model == null) {
      controller.blueprint.pageList.add(input);
    }
  }

  Future<PageBlueprintModel?> _genRules(BuildContext context) async {
    final select = await showCupertinoSelectDialog<Template>(
      title: '选择模板',
      context: context,
      items: Template.values
          .map((e) => SelectTileItem(title: e.string(context), value: e))
          .toList(),
    );
    if (select != null) {
      return PageBlueprintModel.create(select);
    }
    return null;
  }
}
