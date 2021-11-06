import 'package:catweb/ui/components/form.dart';
import 'package:catweb/ui/pages/rules_manager/rules_store.dart';
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
          buildInputForm(labelText: '名称', value: store.rulesModel.name),
          buildInputForm(labelText: '基础Url', value: store.rulesModel.baseUrl),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Divider(),
          ),
          buildInputForm(
            labelText: '登录Url',
            value: store.rulesModel.loginUrl,
          ),
          buildInputForm(
            labelText: '登录Cookie作用域',
            value: store.rulesModel.loginCookieReg,
            hintText: '^(.*?)\$',
          ),
          buildInputForm(
            labelText: 'Cookies',
            value: store.rulesModel.extraCookies,
            minLine: 3,
          ),
        ],
      );
    });
  }
}
