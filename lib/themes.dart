import 'package:flutter/material.dart';
import 'package:catweb/i18n.dart';

class Themes {
  static const blue = 1;
  static const purple = 2;
  static const darkBlue = -1;

  static ThemeData of(int value) {
    switch (value) {
      case Themes.blue:
        return blueTheme;
      case Themes.purple:
        return purpleTheme;
      case Themes.darkBlue:
      default:
        return darkBlueTheme;
    }
  }
}

final darkBlueTheme = ThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  appBarTheme: const AppBarTheme(
    color: Color(0xFF212D3B),
    foregroundColor: Color(0xFFFFFFFF),
  ),
  primaryTextTheme: const TextTheme(
    subtitle1: TextStyle(color: Colors.white),
    bodyText1: TextStyle(color: Color(0xFFFFFFFF)),
    bodyText2: TextStyle(
      color: Color(0xFF7B8DA1),
    ),
  ),
  iconTheme: const IconThemeData(color: Colors.white),
  brightness: Brightness.dark,
  primaryColor: const Color(0xFF61AAE1),
  primaryColorDark: const Color(0xFF223040),
  switchTheme: SwitchThemeData(
    thumbColor: MaterialStateProperty.resolveWith((states) {
      return states.contains(MaterialState.selected)
          ? const Color(0xFF61AAE1)
          : const Color(0xFFB9B9B9);
    }),
    trackColor: MaterialStateProperty.resolveWith((states) {
      return states.contains(MaterialState.selected)
          ? const Color(0xFF5D7385)
          : const Color(0xFF646464);
    }),
  ),
  radioTheme: RadioThemeData(
    fillColor: MaterialStateProperty.resolveWith((states) {
      return states.contains(MaterialState.selected)
          ? const Color(0xFF61AAE1)
          : const Color(0xFFB9B9B9);
    }),
  ),
  colorScheme:
      ColorScheme.fromSwatch().copyWith(secondary: const Color(0xFF61AAE1)),
);

final blueTheme = ThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  textTheme: const TextTheme(
    subtitle2: TextStyle(
      color: Color(0xFF9b9cb1),
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
  ),
  appBarTheme: const AppBarTheme(color: Colors.blue),
  brightness: Brightness.light,
  primaryColor: Colors.blue,
  primaryColorDark: Colors.blue[800],
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
      .copyWith(secondary: Colors.blue[800]),
  // scaffoldBackgroundColor: Colors.white
);

const _purplePrimary = Color(0xFF686BDD);

final purpleTheme = ThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  textTheme: const TextTheme(
    subtitle2: TextStyle(
      color: Color(0xFF9b9cb1),
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
  ),
  appBarTheme: const AppBarTheme(color: Color(0xFF686BDD)),
  brightness: Brightness.light,
  primaryColor: _purplePrimary,
  primaryColorDark: const Color(0xFF46489f),
  colorScheme: ColorScheme.fromSwatch(primarySwatch: _purplePrimary.swatch)
      .copyWith(secondary: const Color(0xFF46489f)),
);

bool isDarkMode([BuildContext? context]) =>
    MediaQuery.of(context ?? I.context).platformBrightness == Brightness.dark;

const darkColors = <Color>[
  Color(0xFF253139),
  Color(0xFF3F2623),
  Color(0xFF36464E),
];

extension ColorHelper on Color {
  MaterialColor get swatch => Colors.primaries.firstWhere(
        (Color c) => c.value == value,
        orElse: () => _swatch,
      );

  MaterialColor get _swatch => MaterialColor(value, getMaterialColorValues);

  Map<int, Color> get getMaterialColorValues => <int, Color>{
        50: _swatchShade(50),
        100: _swatchShade(100),
        200: _swatchShade(200),
        300: _swatchShade(300),
        400: _swatchShade(400),
        500: _swatchShade(500),
        600: _swatchShade(600),
        700: _swatchShade(700),
        800: _swatchShade(800),
        900: _swatchShade(900),
      };

  bool get isDark => red * 0.299 + green * 0.578 + blue * 0.114 <= 192;

  Color _swatchShade(int swatchValue) => HSLColor.fromColor(this)
      .withLightness(1 - (swatchValue / 1000))
      .toColor();
}
