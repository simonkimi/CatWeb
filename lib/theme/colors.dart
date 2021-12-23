import 'package:flutter/cupertino.dart';

import '../i18n.dart';

class FixColor {
  FixColor._();

  static const CupertinoDynamicColor text =
      CupertinoDynamicColor.withBrightness(
    color: CupertinoColors.black,
    darkColor: Color(0x99FFFFFF),
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

  static const CupertinoDynamicColor navigationBarBackground =
      CupertinoDynamicColor.withBrightness(
    color: Color.fromARGB(150, 255, 255, 255),
    darkColor: Color.fromARGB(200, 20, 20, 20),
  );
}

bool isDarkMode([BuildContext? context]) =>
    MediaQuery.of(context ?? I.context).platformBrightness == Brightness.dark;

extension ColorHelper on Color {
  bool get isDark => red * 0.299 + green * 0.578 + blue * 0.114 <= 192;
}
