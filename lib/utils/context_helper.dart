import 'package:flutter/cupertino.dart';

extension ContextHelper on BuildContext {
  bool get isDarkMode =>
      MediaQuery.of(this).platformBrightness == Brightness.dark;

  void pop<T extends Object?>([T? result]) {
    Navigator.of(this).pop(result);
  }
}
