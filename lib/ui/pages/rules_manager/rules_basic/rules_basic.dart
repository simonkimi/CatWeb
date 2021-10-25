import 'package:cat_web/ui/components/form.dart';
import 'package:cat_web/ui/pages/rules_manager/rules_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class RulesBasic extends StatelessWidget {
  const RulesBasic({
    Key? key,
    required this.store,
  }) : super(key: key);

  final RulesStore store;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return ListView(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        children: [
          buildCardList([
            buildInputForm(labelText: '名称', value: store.rulesModel.name),
            buildInputForm(labelText: '基础Url', value: store.rulesModel.baseUrl),
          ], padding: const EdgeInsets.symmetric(vertical: 10)),
          buildCardList([
            buildInputForm(labelText: '登录Url', value: store.rulesModel.loginUrl),
            buildInputForm(
              labelText: 'Cookies',
              value: store.rulesModel.cookies,
              minLine: 3,
            ),
            buildInputForm(
              labelText: '额外Cookies',
              value: store.rulesModel.cookies,
              minLine: 3,
            ),
          ], padding: const EdgeInsets.symmetric(vertical: 10)),
        ],
      );
    });
  }
}