import 'package:cat_web/ui/components/app_bar.dart';
import 'package:cat_web/ui/page/rules_manager/rules_parser/list_parser.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'editor_store.dart';

class RulesParserEditor extends StatelessWidget {
  RulesParserEditor({Key? key}) : super(key: key);

  static String routeName = 'rules_parser_editor';

  final store = EditorStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: '规则编辑'),
      body: Observer(
        builder: (context) {
          return ColoredBox(
            color: const Color(0xfff1f1f6),
            child: ListView(
              padding: const EdgeInsets.all(5),
              children: [
                buildListParser(context, store.parserBase),
              ],
            ),
          );
        },
      ),
    );
  }
}
