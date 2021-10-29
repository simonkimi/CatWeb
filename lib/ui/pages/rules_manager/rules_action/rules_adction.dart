import 'package:cat_web/ui/components/form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../rules_store.dart';

class RulesActions extends StatelessWidget {
  const RulesActions({
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
          buildCardList([]),
        ],
      );
    });
  }
}
