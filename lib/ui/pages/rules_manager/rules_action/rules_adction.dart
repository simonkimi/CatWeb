import 'package:catweb/data/protocol/model/store.dart';
import 'package:catweb/ui/components/form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class RulesActions extends StatelessWidget {
  const RulesActions({
    Key? key,
    required this.rulesModel,
  }) : super(key: key);

  final RulesProtocolModel rulesModel;

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
