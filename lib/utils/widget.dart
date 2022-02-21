import 'package:flutter/material.dart';

extension WidgetWrap on Widget {
  Widget padding([EdgeInsets padding = EdgeInsets.zero]) =>
      Padding(padding: padding, child: this);

  Widget coloredBox([Color? color]) =>
      ColoredBox(color: color ?? Colors.blue, child: this);
}

Size boundingTextSize({
  required BuildContext context,
  required String text,
  required TextStyle style,
  double maxWidth = 100,
}) {
  if (text.isEmpty) {
    return Size.zero;
  }
  final textPainter = TextPainter(
    textDirection: TextDirection.ltr,
    locale: Localizations.localeOf(context),
    text: TextSpan(text: text, style: style),
    maxLines: 1,
  )..layout(maxWidth: maxWidth);
  return textPainter.size;
}
