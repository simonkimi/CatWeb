import 'package:catweb/utils/context_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoDivider extends StatelessWidget {
  const CupertinoDivider({
    super.key,
    this.padding = EdgeInsets.zero,
    this.height,
  });

  final EdgeInsets padding;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Divider(
        height: height,
        thickness: context.isDarkMode ? 0.6 : 0.4,
        color: context.isDarkMode
            ? CupertinoColors.separator.darkColor
            : CupertinoColors.separator.color,
      ),
    );
  }
}

class ImageListDivider extends StatelessWidget {
  const ImageListDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        right: 5,
        left: 124,
        // left: 5,
      ),
      child: CupertinoDivider(height: 5),
    );
  }
}
