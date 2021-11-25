import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:catweb/i18n.dart';

bool isDarkMode([BuildContext? context]) =>
    MediaQuery.of(context ?? I.context).platformBrightness == Brightness.dark;

class FixColor {
  FixColor._();

  static const CupertinoDynamicColor text =
      CupertinoDynamicColor.withBrightness(
    color: CupertinoColors.black,
    darkColor: Colors.white60,
  );

  static const CupertinoDynamicColor title =
      CupertinoDynamicColor.withBrightness(
    color: CupertinoColors.black,
    darkColor: Color(0xdeffffff),
  );

  static CupertinoDynamicColor badge = CupertinoDynamicColor.withBrightness(
    color: CupertinoColors.systemGrey6.color,
    darkColor: CupertinoColors.systemGrey4.darkColor,
  );
}

extension ColorHelper on Color {
  bool get isDark => red * 0.299 + green * 0.578 + blue * 0.114 <= 192;
}

Color cupertinoLightColors(BuildContext context, int index) {
  final shade = isDarkMode(context) ? 700 : 100;
  final list = <MaterialColor>[
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.purple,
  ].map((e) => e[shade]!).toList();
  return list[index % list.length];
}

CupertinoThemeData defaultTheme() => const CupertinoThemeData(
      primaryColor: CupertinoColors.systemBlue,
      primaryContrastingColor: CupertinoColors.white,
      scaffoldBackgroundColor: CupertinoColors.systemBackground,
    );
