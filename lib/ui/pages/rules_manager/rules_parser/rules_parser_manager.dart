import 'package:catweb/data/protocol/model/parser.dart';
import 'package:catweb/ui/components/cupertino_list_tile.dart';
import 'package:catweb/ui/components/dialog.dart';
import 'package:catweb/ui/pages/rules_manager/rules_edit_page.dart';
import 'package:catweb/ui/pages/rules_manager/rules_parser/rules_parser_editor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

enum _MenuSelect {
  edit,
  delete,
}

class RulesParserManager extends GetView<RulesEditController> {
  const RulesParserManager({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      children: [
        Obx(() => Column(
              mainAxisSize: MainAxisSize.min,
              children: controller.rulesModel.parsers.map((e) {
                return CupertinoListTile(
                  title: Text(e.name.value),
                  subtitle: Text(e.displayType(context)),
                  trailing: CupertinoButton(
                    padding: EdgeInsets.zero,
                    minSize: 10,
                    child: const Icon(Icons.more_horiz_outlined),
                    onPressed: () => onTrailingTap(context, e),
                  ),
                  onTap: () => editRules(context, e),
                );
              }).toList(),
            )),
        CupertinoListTile(
          title: const Text('添加'),
          leading: const Icon(Icons.add),
          onTap: () => addRulesParser(context),
        ),
      ],
    );
  }

  Future<void> addRulesParser(BuildContext context) async {
    final selection = await showCupertinoSelectDialog<ParserType>(
      context: context,
      title: '规则类型',
      cancelText: '取消',
      items: const [
        SelectTileItem(title: '列表页', value: ParserType.listParser),
        SelectTileItem(title: '详情页', value: ParserType.galleryParser),
        SelectTileItem(title: '图片页', value: ParserType.imageParser),
      ],
    );
    if (selection != null) {
      late final ParserBaseModel model;
      switch (selection) {
        case ParserType.listParser:
          model = ListViewParserModel();
          break;
        case ParserType.galleryParser:
          model = GalleryParserModel();
          break;
        case ParserType.imageParser:
          model = ImageParserModel();
          break;
      }
      await Navigator.of(context).push(CupertinoPageRoute(
          builder: (context) => RulesParserEditor(
                model: model,
              )));
      if (model.name.value.isNotEmpty) {
        controller.rulesModel.addParser(model);
      }
    }
  }

  Future<void> onTrailingTap(
    BuildContext context,
    ParserBaseModel model,
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
        await editRules(context, model);
        break;
      case _MenuSelect.delete:
        if (await showCupertinoConfirmDialog(
              context: context,
              content: '确定要删除 ${model.name} 吗？',
              title: '取消',
            ) ==
            true) {
          controller.rulesModel.removeParser(model);
        }
        break;
    }
  }

  Future<void> editRules(BuildContext context, ParserBaseModel model) async {
    await Navigator.of(context).push(CupertinoPageRoute(
      builder: (context) => RulesParserEditor(
        model: model,
      ),
    ));
    if (model.name.value.isEmpty) {
      controller.rulesModel.removeParser(model);
    }
  }
}
