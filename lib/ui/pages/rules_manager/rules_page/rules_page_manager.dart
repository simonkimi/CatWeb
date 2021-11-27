import 'package:catweb/ui/components/cupertino_list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../rules_store.dart';

class RulesPageManager extends StatelessWidget {
  const RulesPageManager({
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
          children: store.rulesModel.pageList.map((element) {
            return const ListTile();
          }).toList(),
        ),
        CupertinoListTile(
          title: const Text('添加'),
          leading: const Icon(Icons.add),
        ),
      ],
    );
  }
}
