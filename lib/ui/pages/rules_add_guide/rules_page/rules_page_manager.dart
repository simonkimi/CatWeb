import 'package:catweb/data/protocol/model/page.dart';
import 'package:catweb/gen/protobuf/page.pbserver.dart';
import 'package:catweb/ui/components/cupertino_list_tile.dart';
import 'package:catweb/ui/components/dialog.dart';
import 'package:catweb/ui/pages/rules_add_guide/controller/rules_edit_controller.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_page/rules_page.dart';
import 'package:catweb/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum _MenuSelect {
  edit,
  delete,
}

enum _Valid {
  edit,
  delete,
  save,
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
            _toRulesPageEdit(context);
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

  Future<_Valid> _checkValid(BuildContext context, SitePageModel model) async {
    if (!model.isValid()) {
      final result = await showCupertinoConfirmDialog(
        context: context,
        title: '空',
        content: '名称或解析器为空, 将不会保存',
        confineText: '确认',
        cancelText: '编辑',
        showCancel: true,
      );
      if (result == true) return _Valid.delete;
      return _Valid.edit;
    }
    if (controller.siteConfigModel.pageList
        .any((e) => e != model && e.name == model.name)) {
      await showCupertinoConfirmDialog(
        context: context,
        title: '重复',
        content: '名称重复, 请重新修改',
      );
      return _Valid.edit;
    }
    return _Valid.save;
  }

  Future<void> _toRulesPageEdit(BuildContext context,
      [SitePageModel? model]) async {
    final input = model ?? await _genRules(context);
    if (input == null) return;
    outer:
    while (true) {
      await Get.to(() => RulesPageEdit(model: input));
      final valid = await _checkValid(context, input);
      switch (valid) {
        case _Valid.edit:
          continue outer;
        case _Valid.delete:
          controller.siteConfigModel.pageList.remove(input);
          break outer;
        case _Valid.save:
          controller.siteConfigModel.pageList.addIfNotExist([input]);
          break outer;
      }
    }
  }

  Future<SitePageModel?> _genRules(BuildContext context) async {
    final select = await showCupertinoSelectDialog<PageTemplate>(
      title: '选择模板',
      context: context,
      items: PageTemplate.values.map((e) => SelectTileItem(
          title: e.string(context),
          value: e
      )).toList(),
    );
    if (select != null) {
      return SitePageModel()..template.value = select;
    }
  }
}
