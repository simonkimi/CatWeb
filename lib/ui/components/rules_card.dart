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
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(child: Text(title)),
        ...children,
      ],
    );
  }
}
