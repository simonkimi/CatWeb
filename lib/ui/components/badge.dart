import 'package:catweb/ui/theme/colors.dart';
import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  const Badge({
    Key? key,
    required this.text,
    this.color,
    this.padding = const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
    this.borderRadius = 8,
    this.fontSize = 15,
    this.textColor,
  }) : super(key: key);

  final Color? color;
  final Color? textColor;
  final String text;
  final EdgeInsets padding;
  final double borderRadius;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    final background = color ?? FixColor.badge.resolveFrom(context);

    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          color: textColor ??
              (background.isDark
                  ? Colors.white.withOpacity(0.9)
                  : FixColor.text.color),
        ),
      ),
    );
  }
}
