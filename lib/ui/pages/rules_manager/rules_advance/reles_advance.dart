import 'package:catweb/ui/components/cupertino_removable_list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RulesAdvance extends StatelessWidget {
  const RulesAdvance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 10),
      children: const [
        SizedBox(height: 10),
        CupertinoRemovableListTile(
          title: Text(
            '测试',
            style: TextStyle(fontSize: 15),
          ),
        ),
      ],
    );
  }
}
