import 'package:flutter/cupertino.dart';
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        decoration: BoxDecoration(
          color: CupertinoColors.systemGrey6,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                title,
                style:
                    const TextStyle(color: CupertinoColors.label, fontSize: 12),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                decoration: BoxDecoration(
                  color: CupertinoColors.systemBackground,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: children,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
