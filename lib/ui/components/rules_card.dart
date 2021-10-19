import 'package:flutter/material.dart';

class RulesCard extends StatelessWidget {
  const RulesCard({
    Key? key,
    required this.title,
    required this.children,
  }) : super(key: key);

  final String title;

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title),
            ...children,
          ],
        ),
      ),
    );
  }
}
