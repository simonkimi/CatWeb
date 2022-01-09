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
        _onPageDelete(context, model);
        break;
    }
  }

  void _onPageDelete(BuildContext context, SitePageModel model) {
    final using = controller.siteConfigModel.pageList
        .where((p0) =>
            p0.openPages.any((element) => element.target.value == model.uuid))
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
        title: '取消',
        showCancel: true,
      ).then((value) {
        if (value == true) {
          controller.siteConfigModel.pageList.remove(model);
        }
      });
    }
  }

  Future<void> _toRulesPageEdit(BuildContext context,
      [SitePageModel? model]) async {
    final input = model ?? await _genRules(context);
    if (input == null) return;
    await Get.to(() => RulesPageEdit(model: input));
    if (model == null) {
      controller.siteConfigModel.pageList.add(input);
    }
  }

  Future<SitePageModel?> _genRules(BuildContext context) async {
    final select = await showCupertinoSelectDialog<PageTemplate>(
      title: '选择模板',
      context: context,
      items: PageTemplate.values
          .map((e) => SelectTileItem(title: e.string(context), value: e))
          .toList(),
    );
    if (select != null) {
      return SitePageModel()..template.value = select;
    }
  }
}
