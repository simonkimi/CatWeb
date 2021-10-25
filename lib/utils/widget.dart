import 'package:flutter/material.dart';

extension WidgetWrap on Widget {
  Widget colored([Color? color]) =>
      ColoredBox(color: color ?? Colors.red, child: this);

  Widget card([EdgeInsets? padding]) => padding != null
      ? Padding(
          padding: padding,
          child: this,
        )
      : Card(child: this);

  Widget padding([EdgeInsets padding = EdgeInsets.zero]) =>
      Padding(padding: padding, child: this);
}
