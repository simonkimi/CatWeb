import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  const IconText({
    super.key,
    required this.icon,
    required this.text,
    this.iconColor,
    this.style,
    this.space,
  });

  final IconData icon;
  final Color? iconColor;
  final String text;
  final double? space;

  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: iconColor,
          size: (style?.fontSize ?? 15) + 3,
        ),
        SizedBox(width: space ?? 3),
        Padding(
          padding: const EdgeInsets.only(bottom: 1),
          child: Text(
            text,
            style: style ?? const TextStyle(fontSize: 15),
          ),
        )
      ],
    );
  }
}
