import 'package:catweb/gen/protobuf/model.pbserver.dart';
import 'package:flutter/cupertino.dart';

class FixColor {
  FixColor._();

  static const CupertinoDynamicColor text =
      CupertinoDynamicColor.withBrightness(
    color: CupertinoColors.black,
    darkColor: Color(0xFFF0F0F0),
  );

  static const CupertinoDynamicColor title =
      CupertinoDynamicColor.withBrightness(
    color: CupertinoColors.black,
    darkColor: Color(0xdeffffff),
  );

  static CupertinoDynamicColor badge =
      const CupertinoDynamicColor.withBrightness(
    color: Color(0xfff2f1f6),
    darkColor: Color(0xff1c1c1e),
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

  static const CupertinoDynamicColor pressedColor =
  CupertinoDynamicColor.withBrightness(
    color: Color(0xffd1d0d5),
    darkColor: Color(0xff3a3a3a),
  );
}

bool isDarkMode(BuildContext context) =>
    MediaQuery.of(context).platformBrightness == Brightness.dark;

extension ColorHelper on Color {
  bool get isDark => red * 0.299 + green * 0.578 + blue * 0.114 <= 192;

  ColorRpcModel get rpc => ColorRpcModel(a: alpha, b: blue, g: green, r: red);
}

Color? parseColorString(String colorString) {
  try {
    final result = colorString.toLowerCase();

    if (result.startsWith('0x') && result.length == 8) {
      return Color(int.parse(result.substring(2), radix: 16) | 0xff000000);
    } else if (result.startsWith('#') && result.length == 7) {
      return Color(int.parse(result.substring(1), radix: 16) | 0xff000000);
    }

    final rgb = RegExp(r'[\.\d]+%?');
    final match = rgb.allMatches(result).toList();
    if (match.length == 3) {
      return Color.fromARGB(
        0xFF,
        _getColorInt(match[0][0]!),
        _getColorInt(match[1][0]!),
        _getColorInt(match[2][0]!),
      );
    }
    if (match.length == 4) {
      return Color.fromARGB(
        ((double.tryParse(match[3][0]!) ?? 1) * 255).floor(),
        _getColorInt(match[0][0]!),
        _getColorInt(match[1][0]!),
        _getColorInt(match[2][0]!),
      );
    }
  } on Error {
    return null;
  }
  return null;
}

int _getColorInt(String input) {
  if (input.endsWith('%')) {
    return (255 * (int.parse(input.substring(0, input.length - 1)) / 100))
        .floor();
  } else {
    return double.parse(input).floor();
  }
}
