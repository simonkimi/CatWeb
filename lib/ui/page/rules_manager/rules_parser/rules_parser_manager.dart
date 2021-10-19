import 'package:cat_web/ui/page/rules_manager/rules_parser/rules_parser_editor.dart';
import 'package:cat_web/ui/page/rules_manager/rules_store.dart';
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
              ...store.listViewParsers.map((element) {
                return const ListTile();
              }),
              const ListTile(
                leading: Icon(Icons.list),
                title: Text('index'),
                subtitle: Text('ListParser'),
              ),
              ListTile(
                title: const Text('添加'),
                leading: const Icon(Icons.add),
                onTap: () {
                  Navigator.of(context).pushNamed(RulesParserEditor.routeName);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
