import 'dart:io';

import 'package:catweb/utils/context_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:catweb/ui/theme/colors.dart';

Color cupertinoLightColors(BuildContext context, int index) {
  final shade = context.isDarkMode ? 700 : 100;
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

CupertinoThemeData defaultTheme() {
  final font = systemFont();
  return CupertinoThemeData(
    primaryColor: CupertinoColors.systemBlue,
    primaryContrastingColor: CupertinoColors.white,
    scaffoldBackgroundColor: FixColor.scaffoldBackgroundColor,
    barBackgroundColor: FixColor.navigationBarBackground,
    textTheme: CupertinoTextThemeData(
      textStyle: font,
      actionTextStyle: font,
      dateTimePickerTextStyle: font,
      navLargeTitleTextStyle: font,
      navTitleTextStyle: font,
      pickerTextStyle: font,
      tabLabelTextStyle: font,
      navActionTextStyle: font,
    ),
  );
}

TextStyle systemFont() {
  if (Platform.isWindows) {
    return const TextStyle(fontFamily: 'Microsoft YaHei UI');
  }
  if (Platform.isMacOS || Platform.isIOS) {
    return const TextStyle(fontFamily: 'PingFang SC');
  }
  return const TextStyle(fontFamily: 'Roboto');
}
