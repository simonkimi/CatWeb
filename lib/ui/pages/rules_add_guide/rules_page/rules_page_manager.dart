import 'package:catweb/data/protocol/model/page.dart';
import 'package:catweb/gen/protobuf/page.pbserver.dart';
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
                    onPressed: () => _onTrailingTap(context, e),
                  ),
                  onTap: () => _toRulesPageEdit(context, e),
                );
              }).toList(),
            )),
        CupertinoListTile(
          title: const Text('添加'),
          leading: const Icon(Icons.add),
          onTap: () {
            _addRule(context);
          },
        ),
      ],
    );
  }

  Future<void> _onTrailingTap(
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
        await _toRulesPageEdit(context, model);
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

  Future<void> _toRulesPageEdit(
    BuildContext context,
    SitePageModel model,
  ) async {
    while (true) {
      await Get.to(() => RulesPageEdit(model: model));
      if (!model.isValid()) {
        final result = await showCupertinoConfirmDialog(
          context: context,
          title: '错误',
          content: '没有设定名称或解析器, 将删除此配置',
          confineText: '确认删除',
        );
        if (result == true) {
          controller.siteConfigModel.pageList.remove(model);
          break;
        }
      }
      if (controller.siteConfigModel.pageList
          .any((e) => e != model && e.name == model.name)) {
        await showCupertinoConfirmDialog(
          context: context,
          title: '重复',
          content: '名称重复, 请重新修改',
        );
      }
      break;
    }
  }

  Future<void> _addRule(BuildContext context) async {
    final select = await showCupertinoSelectDialog<PageTemplate>(
      title: '选择模板',
      context: context,
      items: [
        SelectTileItem(
          title: PageTemplate.imageList.string(context),
          value: PageTemplate.imageList,
        ),
        SelectTileItem(
          title: PageTemplate.imageWaterfall.string(context),
          value: PageTemplate.imageWaterfall,
        ),
        SelectTileItem(
          title: PageTemplate.detail.string(context),
          value: PageTemplate.detail,
        ),
      ],
    );
    if (select != null) {
      final input = SitePageModel()..template.value = select;
      while (true) {
        await Get.to(() => RulesPageEdit(model: input));
        if (input.isValid()) {
          if (controller.siteConfigModel.pageList
              .any((e) => e.name.value == input.name.value)) {
            await showCupertinoConfirmDialog(
              context: context,
              title: '重复',
              content: '名称重复, 请重新修改',
            );
            continue;
          }
          controller.siteConfigModel.pageList.add(input);
          break;
        } else {
          final result = await showCupertinoConfirmDialog(
            context: context,
            title: '错误',
            content: '没有设定名称或解析器, 将不会保存',
            confineText: '不保存',
          );
          if (result == true) {
            break;
          }
        }
      }
    }
  }
}
