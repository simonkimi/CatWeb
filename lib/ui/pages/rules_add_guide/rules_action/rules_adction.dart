import 'package:catweb/ui/widgets/form.dart';
import 'package:flutter/material.dart';

class RulesActions extends StatelessWidget {
  const RulesActions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      children: [
        buildCardList([]),
      ],
    );
  }
}
