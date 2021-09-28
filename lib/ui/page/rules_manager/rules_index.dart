import 'package:cat_web/ui/components/checkbox_tile.dart';
import 'package:cat_web/ui/page/rules_manager/rules_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class RulesIndex extends StatelessWidget {
  const RulesIndex({
    Key? key,
    required this.store,
  }) : super(key: key);

  final RulesStore store;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return ListView(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              '- 基础设置',
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
          ),
          TextFormField(
            initialValue: store.siteName,
            decoration: const InputDecoration(
              labelText: '站点名称',
            ),
            onChanged: (value) {
              store.siteName = value;
            },
          ),
          TextFormField(
            initialValue: store.baseUrl,
            decoration: const InputDecoration(
              labelText: '站点URL',
            ),
            onChanged: (value) {
              store.baseUrl = value;
            },
          ),
          TextFormField(
            initialValue: store.cookies,
            decoration: const InputDecoration(
              labelText: 'Cookies',
            ),
            onChanged: (value) {
              store.cookies = value;
            },
          ),
          TextFormField(
            initialValue: store.headers,
            decoration: const InputDecoration(
              labelText: 'Headers',
            ),
            onChanged: (value) {
              store.headers = value;
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CheckBoxTile(
                text: '需要Cookies',
                value: store.needCookies,
                onChanged: (value) {
                  store.needCookies = value!;
                },
              ),
            ],
          )
        ],
      );
    });
  }
}
