import 'package:catweb/data/protocol/model/parser.dart';
import 'package:catweb/ui/components/dialog.dart';
import 'package:catweb/ui/pages/rules_manager/rules_parser/rules_parser_editor.dart';
import 'package:catweb/ui/pages/rules_manager/rules_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class RulesParserManager extends StatelessWidget {
  const RulesParserManager({
    Key? key,
    required this.store,
  }) : super(key: key);

  final RulesStore store;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (context) {
          return ListView(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: store.rulesModel.listViewParser.map((element) {
                  return const ListTile();
                }).toList(),
              ),
              const ListTile(
                leading: Icon(Icons.list),
                title: Text('index'),
                subtitle: Text('ListParser'),
              ),
              ListTile(
                title: const Text('添加'),
                leading: const Icon(Icons.add),
                onTap: () => addRulesParser(context),
              ),
            ],
          );
        },
      ),
    );
  }

  Future<void> addRulesParser(BuildContext context) async {
    final selection = await showSelectDialog<ParserType>(
      context: context,
      displayRadio: false,
      items: const [
        SelectTileItem(title: '列表', value: ParserType.list),
        SelectTileItem(title: '画廊', value: ParserType.gallery),
      ],
      selectedValue: ParserType.list,
      title: '规则类型',
    );
    if (selection != null) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => RulesParserEditor(
                type: selection,
              )));
    }
  }
}
