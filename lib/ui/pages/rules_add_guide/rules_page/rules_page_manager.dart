import 'package:catweb/data/models/site_model/pages/site_page.dart';
import 'package:catweb/data/models/site_model/pages/template.dart';
import 'package:catweb/data/models/site_model/site_blue_map.dart';
import 'package:catweb/i18n.dart';
import 'package:catweb/ui/widgets/cupertino_list_tile.dart';
import 'package:catweb/ui/widgets/dialog.dart';
import 'package:catweb/ui/pages/rules_add_guide/controller/rules_edit_controller.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_page/rules_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

enum _MenuSelect {
  edit,
  delete,
}

class RulesPageManager extends GetView<RulesEditController> {
  const RulesPageManager({
    super.key,
  });

  SiteBlueMap get blueprint => controller.blueprint;

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          children: [
            ...blueprint.pageList.map((e) {
              return CupertinoCardTile(
                title: Text(e.name),
                subtitle: Text(e.template.type.value),
                trailing: CupertinoButton(
                  padding: EdgeInsets.zero,
                  minSize: 10,
                  child: const Icon(Icons.more_horiz_outlined),
                  onPressed: () => _onTrailingTap(context, e),
                ),
                onTap: () => _toRulesPageEdit(context, e),
              );
            }).toList(),
            CupertinoCardTile(
              title: Text(I.of(context).add),
              leading: const Icon(Icons.add),
              onTap: () {
                _toRulesPageEdit(context);
              },
            ),
          ],
        ));
  }

  Future<void> _onTrailingTap(
    BuildContext context,
    SitePage model,
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

  void _onPageDelete(BuildContext context, SitePage model) {
    final using = blueprint.pageList
        .where(
            (p0) => p0.getDependPage().any((element) => element == model.uuid))
        .map((e) => e.name)
        .toList();

    if (using.isNotEmpty) {
      showCupertinoConfirmDialog(
          context: context,
          content: '无法删除, 因下列页面会跳转到此页面:\n ${using.join(' ')}');
    } else {
      showCupertinoConfirmDialog(
        context: context,
        content: I.of(context).delete_confirm(model.name),
        title: I.of(context).cancel,
        confineText: I.of(context).delete,
        confineTextColor: CupertinoColors.systemRed.resolveFrom(context),
      ).then((value) {
        if (value == true) {
          blueprint.pageList.remove(model);
        }
      });
    }
  }

  Future<void> _toRulesPageEdit(BuildContext context, [SitePage? model]) async {
    final input = model ?? await _genRules(context);
    if (input == null) return;
    await Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
      return RulesPageEdit(
        baseModel: input,
        onModelChanged: (model) {
          final index = blueprint.pageList.indexWhere((e) => e.uuid == model.uuid);
          if (index == -1) {
            blueprint.pageList.add(model);
          } else {
            blueprint.pageList[index] = model;
          }
        },
      );
    }));
  }

  Future<SitePage?> _genRules(BuildContext context) async {
    final name = await showCupertinoInputDialog(
      context,
      title: I.of(context).name,
    );
    if (name == null) {
      return null;
    }
    final select = await showCupertinoSelectDialog<TemplateType>(
      title: '选择模板',
      context: context,
      items: TemplateType.values
          .map((e) => SelectTileItem(title: e.value, value: e))
          .toList(),
    );
    if (select == null) {
      return null;
    }
    return SitePage(
      name: name,
      uuid: const Uuid().v4().toString(),
      template: ITemplate.create(select),
    );
  }
}
