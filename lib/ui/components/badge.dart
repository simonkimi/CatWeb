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
    final defaultColor = color ?? FixColor.badge.resolveFrom(context);

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
          // TODO ??????
          color: textColor ??
              (defaultColor.isDark
                  ? isDarkMode(context)
                      ? Colors.white.withOpacity(0.87)
                      : Colors.white
                  : Colors.grey[900]),
        ),
      ),
    );
  }
}
