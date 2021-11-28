import 'package:catweb/data/protocol/model/parser.dart';
import 'package:catweb/ui/components/cupertino_list_tile.dart';
import 'package:catweb/ui/components/dialog.dart';
import 'package:catweb/ui/pages/rules_manager/rules_parser/rules_parser_editor.dart';
import 'package:catweb/ui/pages/rules_manager/rules_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RulesParserManager extends StatelessWidget {
  const RulesParserManager({
    Key? key,
    required this.store,
  }) : super(key: key);

  final RulesStore store;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: <ParserBaseModel>[
            ...store.rulesModel.listViewParser,
            ...store.rulesModel.galleryParsers,
          ].map((e) {
            return CupertinoListTile(
              title: Text(e.name.value),
              subtitle: Text(e.displayType(context)),
              trailing: CupertinoButton(
                padding: EdgeInsets.zero,
                minSize: 10,
                child: const Icon(Icons.more_horiz_outlined),
                onPressed: () {},
              ),
            );
          }).toList(),
        ),
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
        SelectTileItem(title: '列表解析器', value: ParserType.listParser),
        SelectTileItem(title: '详情解析器', value: ParserType.galleryParser),
        SelectTileItem(title: '图片解析器', value: ParserType.imageParser),
      ],
    );
    if (selection != null) {
      Navigator.of(context).push(CupertinoPageRoute(
          builder: (context) => RulesParserEditor(
                type: selection,
              )));
    }
  }
}
