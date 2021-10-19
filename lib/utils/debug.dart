import 'package:flutter/material.dart';

extension WidgetDebuger on Widget {
  Widget colored([Color? color]) =>
      ColoredBox(color: color ?? Colors.red, child: this);
}
