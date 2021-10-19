import 'package:cat_web/ui/components/app_bar.dart';
import 'package:cat_web/ui/components/rules_card.dart';
import 'package:cat_web/ui/components/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class RulesAddGuide extends StatelessWidget {
  const RulesAddGuide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: '规则编辑'),
      body: Observer(
        builder: (context) {
          return ListView(
            padding: const EdgeInsets.all(5),
            children: [
              RulesCard(title: '基础设置', children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: '解析器名称',
                    isDense: true,
                  ),
                ),
              ]),
            ],
          );
        },
      ),
    );
  }
}
