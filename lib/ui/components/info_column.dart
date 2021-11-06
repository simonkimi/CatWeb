import 'dart:math';

import 'package:flutter/material.dart';

class InfoColumn extends StatelessWidget {
  const InfoColumn({
    Key? key,
    required this.children,
  }) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final columnLength = (children.length / 3).ceil();
    final rows = List.generate(columnLength, _genRow);
    for (var i = 0; i < columnLength - 1; i++) {
      rows.insert(i * 2 + 1, const SizedBox(height: 5));
    }
    return Column(
      children: rows,
    );
  }

  Widget _genRow(int x) {
    return Row(
      children: List.generate(min(3, children.length - x * 3), (y) {
        return Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: (() {
              switch (y % 3) {
                case 0:
                  return MainAxisAlignment.start;
                case 1:
                  return MainAxisAlignment.center;
                case 2:
                default:
                  return MainAxisAlignment.end;
              }
            })(),
            children: [
              children[x * 3 + y],
            ],
          ),
        );
      }),
    );
  }
}
