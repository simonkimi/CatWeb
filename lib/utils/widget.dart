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

extension ListenableWrap on Listenable {
  Widget obx(Widget Function() builder) {
    return ListenableBuilder(
      listenable: this,
      builder: (context, child) {
        return builder();
      },
    );
  }

  Widget obxc(Widget Function(BuildContext context) builder) {
    return ListenableBuilder(
      listenable: this,
      builder: (context, child) {
        return builder(context);
      },
    );
  }
}

extension ValueListenableWrap<T> on ValueNotifier<T> {
  Widget obx(Widget Function(T value) builder) {
    return ValueListenableBuilder<T>(
      valueListenable: this,
      builder: (context, value, child) {
        return builder(value);
      },
    );
  }

  Widget obxc(Widget Function(BuildContext context, T value) builder) {
    return ValueListenableBuilder<T>(
      valueListenable: this,
      builder: (context, value, child) {
        return builder(context, value);
      },
    );
  }
}
