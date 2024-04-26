import 'package:catweb/data/models/site/parser.dart';
import 'package:catweb/i18n.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_editor_notifier.dart';
import 'package:catweb/ui/widgets/cupertino_list_tile.dart';
import 'package:catweb/ui/widgets/dialog.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_parser/rules_parser_editor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

enum _MenuSelect {
  edit,
  delete,
}

enum _ParserType {
  list,
  detail,
  image,
  autoComplete;
}

class RulesParserManager extends StatelessWidget {
  const RulesParserManager({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<RulesEditorNotifier, List<ParserModel>>(
      selector: (_, n) => n.blueprint.parserList,
      child: CupertinoCardTile(
        title: const Text('添加'),
        leading: const Icon(Icons.add),
        onTap: () => _editRules(context),
      ),
      builder: (_, parserList, child) {
        return ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          children: [
            for (final model in parserList)
              CupertinoCardTile(
                title: Text(model.name),
                subtitle: Text(model.getDescription(context)),
                trailing: CupertinoButton(
                  padding: EdgeInsets.zero,
                  minSize: 10,
                  child: const Icon(Icons.more_horiz_outlined),
                  onPressed: () => _onTrailingTap(context, model),
                ),
                onTap: () => _editRules(context, model),
              ),
            child!,
          ],
        );
      },
    );
  }

  Future<void> _onTrailingTap(
    BuildContext context,
    ParserModel model,
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

  void _onParserDelete(BuildContext context, ParserModel model) {
    final notifier = context.read<RulesEditorNotifier>();
    final using = notifier.blueprint.pageList
        .where((p0) => p0.parserId == model.uuid)
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
          notifier.removeParser(model.uuid);
        }
      });
    }
  }

  Future<ParserModel?> _genParser(BuildContext context) async {
    final selection = await showCupertinoSelectDialog<_ParserType>(
      context: context,
      title: '规则类型',
      cancelText: '取消',
      items: const [
        SelectTileItem(title: '列表页', value: _ParserType.list),
        SelectTileItem(title: '详情页', value: _ParserType.detail),
        SelectTileItem(title: '图片页', value: _ParserType.image),
        SelectTileItem(title: '补全页', value: _ParserType.autoComplete),
      ],
    );
    if (selection == null) return null;
    final name = await showCupertinoInputDialog(context, title: '名称');
    if (name == null) return null;

    final uuid = const Uuid().v4().toString();
    switch (selection) {
      case _ParserType.list:
        return ParserModel.list(name: name, uuid: uuid);
      case _ParserType.detail:
        return ParserModel.detail(name: name, uuid: uuid);
      case _ParserType.image:
        return ParserModel.imageReader(name: name, uuid: uuid);
      case _ParserType.autoComplete:
        return ParserModel.autoComplete(name: name, uuid: uuid);
    }
  }

  Future<void> _editRules(BuildContext context, [ParserModel? model]) async {
    final input = model ?? await _genParser(context);
    if (input == null) {
      return;
    }

    ParserModel? newModel = await Navigator.of(context).push(
      CupertinoPageRoute(builder: (BuildContext context) {
        return RulesParserEditor(model: input);
      }),
    );

    if (newModel == null) {
      return;
    }

    final notifier = context.read<RulesEditorNotifier>();
    notifier.editParser(newModel);
  }
}
