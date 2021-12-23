import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:catweb/theme/colors.dart';

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
      barBackgroundColor: FixColor.navigationBarBackground,
    );
