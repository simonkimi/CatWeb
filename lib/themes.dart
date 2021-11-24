import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:catweb/i18n.dart';

bool isDarkMode([BuildContext? context]) =>
    MediaQuery.of(context ?? I.context).platformBrightness == Brightness.dark;

Color labelColor(BuildContext context) => isDarkMode(context)
    ? CupertinoColors.label.darkColor
    : CupertinoColors.label.color;

Color secondaryLabelColor(BuildContext context) => isDarkMode(context)
    ? CupertinoColors.secondaryLabel.darkColor
    : CupertinoColors.secondaryLabel.color;

Color systemGrey6(BuildContext context) => isDarkMode(context)
    ? CupertinoColors.systemGrey6.darkColor
    : CupertinoColors.systemGrey6.color;

Color systemBackground(BuildContext context) => isDarkMode(context)
    ? CupertinoColors.systemBackground.darkColor
    : CupertinoColors.systemBackground.color;

extension ColorHelper on Color {
  bool get isDark => red * 0.299 + green * 0.578 + blue * 0.114 <= 192;
}

final cupertinoLightColors = <Color>[
  Colors.green[50]!,
  Colors.red[50]!,
  Colors.cyan[50]!,
  Colors.blue[50]!,
  Colors.orange[50]!,
];
