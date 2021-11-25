import 'package:catweb/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  const Badge({
    Key? key,
    required this.text,
    this.color,
    this.padding = const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
    this.borderRadius = 5,
    this.fontSize = 15,
  }) : super(key: key);

  final Color? color;
  final String text;
  final EdgeInsets padding;
  final double borderRadius;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    final defaultColor = color ?? CupertinoColors.systemGrey6.resolveFrom(context);

    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: defaultColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          color: defaultColor.isDark
              ? Colors.white
              : Colors.black,
        ),
      ),
    );
  }
}
