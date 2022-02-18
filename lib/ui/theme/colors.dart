import 'package:catweb/gen/protobuf/model.pbserver.dart';
import 'package:flutter/cupertino.dart';

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
    color: Color.fromARGB(200, 255, 255, 255),
    darkColor: Color.fromARGB(180, 30, 30, 30),
  );

  static const CupertinoDynamicColor groupedColor =
      CupertinoDynamicColor.withBrightness(
    color: Color(0xffeeeeee),
    darkColor: Color(0xff171717),
  );

  static const CupertinoDynamicColor scaffoldBackgroundColor =
      CupertinoDynamicColor.withBrightness(
    color: Color(0xfff9f9f9),
    darkColor: Color(0xff0d0d0d),
  );
}

bool isDarkMode(BuildContext context) =>
    MediaQuery.of(context).platformBrightness == Brightness.dark;

extension ColorHelper on Color {
  bool get isDark => red * 0.299 + green * 0.578 + blue * 0.114 <= 192;

  ColorRpcModel get rpc => ColorRpcModel(a: alpha, b: blue, g: green, r: red);
}
