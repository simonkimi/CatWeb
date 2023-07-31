import 'package:catweb/data/models/site_model/parser/parser.dart';
import 'package:catweb/i18n.dart';
import 'package:catweb/ui/widgets/cupertino_list_tile.dart';
import 'package:catweb/ui/widgets/dialog.dart';
import 'package:catweb/ui/pages/rules_add_guide/controller/rules_edit_controller.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_parser/rules_parser_editor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

enum _MenuSelect {
  edit,
  delete,
}

class RulesParserManager extends GetWidget<RulesEditController> {
  const RulesParserManager({super.key});

  RxList<IParserBase> get parserList => controller.blueprint.parserList;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      children: [
        Obx(() => Column(
              mainAxisSize: MainAxisSize.min,
              children: parserList.map((e) {
                return CupertinoCardTile(
                  title: Text(e.name),
                  subtitle: Text(e.parserType.value),
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
        CupertinoCardTile(
          title: const Text('添加'),
          leading: const Icon(Icons.add),
          onTap: () => _editRules(context),
        ),
      ],
    );
  }

  Future<void> _onTrailingTap(
    BuildContext context,
    IParserBase model,
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
        _onParserDelete(context, model);
        break;
    }
  }

  void _onParserDelete(
    BuildContext context,
    IParserBase model,
  ) {
    final controller = Get.find<RulesEditController>();
    final using = controller.blueprint.pageList
        .where((p0) => p0.parserId.value == model.uuid)
        .map((e) => e.name)
        .toList();
    if (using.isNotEmpty) {
      showCupertinoConfirmDialog(
          context: context,
          content: '无法删除, 因下列页面正在使用此解析器:\n ${using.join(' ')}');
    } else {
      showCupertinoConfirmDialog(
        context: context,
        content: I.of(context).delete_confirm(model.name),
        confineText: I.of(context).delete,
        confineTextColor: CupertinoColors.systemRed.resolveFrom(context),
      ).then((value) {
        if (value == true) {
          parserList.remove(model);
        }
      });
    }
  }

  Future<IParserBase?> _genParser(BuildContext context) async {
    final selection = await showCupertinoSelectDialog<ParserType>(
      context: context,
      title: '规则类型',
      cancelText: '取消',
      items: const [
        SelectTileItem(title: '列表页', value: ParserType.listView),
        SelectTileItem(title: '详情页', value: ParserType.gallery),
        SelectTileItem(title: '图片页', value: ParserType.imageReader),
        SelectTileItem(title: '补全页', value: ParserType.autoComplete),
      ],
    );
    if (selection == null) return null;
    final name = await showCupertinoInputDialog(context, title: '名称');
    if (name == null) return null;

    final uuid = const Uuid().v4().toString();
    switch (selection) {
      case ParserType.listView:
        return ListViewParser(name: name, uuid: uuid);
      case ParserType.gallery:
        return GalleryParser(name: name, uuid: uuid);
      case ParserType.imageReader:
        return ImageReaderParser(name: name, uuid: uuid);
      case ParserType.autoComplete:
        return AutoCompleteParser(name: name, uuid: uuid);
    }
  }

  Future<void> _editRules(
    BuildContext context, [
    IParserBase? model,
  ]) async {
    final input = model ?? await _genParser(context);
    if (input == null) return;
    await Navigator.of(context).push(
      CupertinoPageRoute(builder: (BuildContext context) {
        return RulesParserEditor(model: input);
      }),
    );

    if (model == null) {
      parserList.add(input);
    }
  }
}
