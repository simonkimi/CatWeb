import 'package:catweb/data/protocol/model/parser.dart';
import 'package:catweb/ui/components/cupertino_list_tile.dart';
import 'package:catweb/ui/components/dialog.dart';
import 'package:catweb/ui/pages/rules_add_guide/controller/rules_edit_controller.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_parser/rules_parser_editor.dart';
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
              children: controller.siteConfigModel.parsers.map((e) {
                return CupertinoListTile(
                  title: Text(e.name.value),
                  subtitle: Text(e.displayType(context)),
                  trailing: CupertinoButton(
                    padding: EdgeInsets.zero,
                    minSize: 10,
                    child: const Icon(Icons.more_horiz_outlined),
                    onPressed: () => _onTrailingTap(context, e),
                  ),
                  onTap: () => _editRules(context, e),
                );
              }).toList(),
            )),
        CupertinoListTile(
          title: const Text('添加'),
          leading: const Icon(Icons.add),
          onTap: () => _editRules(context),
        ),
      ],
    );
  }

  Future<void> _onTrailingTap(
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
        await _editRules(context, model);
        break;
      case _MenuSelect.delete:
        if (await showCupertinoConfirmDialog(
              context: context,
              content: '确定要删除 ${model.name} 吗？',
              title: '取消',
            ) ==
            true) {
          controller.siteConfigModel.removeParser(model);
        }
        break;
    }
  }

  Future<_Valid> _checkValid(
      BuildContext context, ParserBaseModel model) async {
    if (model.name.isEmpty) {
      final result = await showCupertinoConfirmDialog(
        context: context,
        title: '空',
        content: '名称为空, 将不会保存',
        confineText: '不保存',
        cancelText: '编辑',
        showCancel: true,
      );
      if (result == true) return _Valid.delete;
      return _Valid.edit;
    }
    if (controller.siteConfigModel.parsers
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

  Future<ParserBaseModel?> _genParser(BuildContext context) async {
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
      switch (selection) {
        case ParserType.listParser:
          return ListViewParserModel();
        case ParserType.galleryParser:
          return GalleryParserModel();
        case ParserType.imageParser:
          return ImageParserModel();
      }
    }
  }

  Future<void> _editRules(
    BuildContext context, [
    ParserBaseModel? model,
  ]) async {
    final input = model ?? await _genParser(context);
    if (input == null) return;
    outer:
    while (true) {
      await Get.to(() => RulesParserEditor(model: input));
      final valid = await _checkValid(context, input);
      switch (valid) {
        case _Valid.edit:
          continue outer;
        case _Valid.delete:
          controller.siteConfigModel.removeParser(input);
          break outer;
        case _Valid.save:
          if (model == null) controller.siteConfigModel.addParser(input);
          break outer;
      }
    }
  }
}
