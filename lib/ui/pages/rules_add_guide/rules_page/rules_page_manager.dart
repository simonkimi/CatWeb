import 'package:catweb/data/protocol/model/page.dart';
import 'package:catweb/ui/components/cupertino_list_tile.dart';
import 'package:catweb/ui/components/dialog.dart';
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
              children: controller.siteConfigModel.pageList.map((e) {
                return CupertinoListTile(
                  title: Text(e.name.value),
                  subtitle: Text(e.template.value.string(context)),
                  trailing: CupertinoButton(
                    padding: EdgeInsets.zero,
                    minSize: 10,
                    child: const Icon(Icons.more_horiz_outlined),
                    onPressed: () => onTrailingTap(context, e),
                  ),
                  onTap: () => toRulesPageEdit(e),
                );
              }).toList(),
            )),
        CupertinoListTile(
          title: const Text('添加'),
          leading: const Icon(Icons.add),
          onTap: () {
            toRulesPageEdit();
          },
        ),
      ],
    );
  }

  Future<void> onTrailingTap(
    BuildContext context,
    SitePageModel model,
  ) async {
    final result = await showCupertinoSelectDialog<_MenuSelect>(
      cancelText: '取消',
      context: context,
      items: const [
        SelectTileItem(title: '编辑', value: _MenuSelect.edit),
        SelectTileItem(
          title: '删除',
          value: _MenuSelect.delete,
          destructive: true,
        ),
      ],
    );
    switch (result) {
      case null:
        break;
      case _MenuSelect.edit:
        await toRulesPageEdit(model);
        break;
      case _MenuSelect.delete:
        if (await showCupertinoConfirmDialog(
              context: context,
              content: '确定要删除 ${model.name} 吗？',
              title: '取消',
            ) ==
            true) {
          controller.siteConfigModel.pageList.remove(model);
        }
        break;
    }
  }

  Future<void> toRulesPageEdit([SitePageModel? model]) async {
    final input = model ?? SitePageModel();
    await Get.to(() => RulesPageEdit(model: input));
    if (model == null && input.name.value.isNotEmpty) {
      controller.siteConfigModel.pageList.add(input);
    } else if (input.name.value.isEmpty) {
      controller.siteConfigModel.pageList.remove(model);
    }
  }
}
