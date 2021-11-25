import 'package:flutter/cupertino.dart';

extension WidgetWrap on Widget {
  Widget padding([EdgeInsets padding = EdgeInsets.zero]) =>
      Padding(padding: padding, child: this);
}

Size boundingTextSize(
    {required BuildContext context,
    required String text,
    required TextStyle style,
    double maxWidth = 100}) {
  if (text.isEmpty) {
    return Size.zero;
  }
  final TextPainter textPainter = TextPainter(
    textDirection: TextDirection.ltr,
    locale: Localizations.localeOf(context),
    text: TextSpan(text: text, style: style),
    maxLines: 1,
  )..layout(maxWidth: maxWidth);
  return textPainter.size;
}
