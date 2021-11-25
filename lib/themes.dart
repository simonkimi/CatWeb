import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:catweb/i18n.dart';

bool isDarkMode([BuildContext? context]) =>
    MediaQuery.of(context ?? I.context).platformBrightness == Brightness.dark;

Color contextColor(BuildContext context) => isDarkMode(context)
    ? Colors.white.withOpacity(0.6)
    : CupertinoColors.label.color;

extension MoreCupertinoColor on CupertinoColors {}

extension ColorHelper on Color {
  bool get isDark => red * 0.299 + green * 0.578 + blue * 0.114 <= 192;
}

Color cupertinoLightColors(BuildContext context, int index) {
  final shade = isDarkMode(context) ? 900 : 50;
  final list = <Color>[
    Colors.green[shade]!,
    Colors.red[shade]!,
    Colors.cyan[shade]!,
    Colors.blue[shade]!,
    Colors.orange[shade]!,
  ];
  return list[index % list.length];
}

CupertinoThemeData defaultTheme() => const CupertinoThemeData(
      primaryColor: CupertinoColors.systemBlue,
      primaryContrastingColor: CupertinoColors.white,
      scaffoldBackgroundColor: CupertinoColors.systemGroupedBackground,
    );
