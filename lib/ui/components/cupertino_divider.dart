import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../themes.dart';

class CupertinoDivider extends StatelessWidget {
  const CupertinoDivider({
    Key? key,
    this.padding = EdgeInsets.zero,
    this.height,
  }) : super(key: key);

  final EdgeInsets padding;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Divider(
        height: height,
        thickness: isDarkMode(context) ? 0.6 : 0.4,
        color: isDarkMode(context)
            ? CupertinoColors.separator.darkColor
            : CupertinoColors.separator.color,
      ),
    );
  }
}
