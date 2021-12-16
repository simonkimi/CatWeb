import 'package:flutter/cupertino.dart';

class GreyUnderlineTabIndicator extends Decoration {
  const GreyUnderlineTabIndicator({
    this.width = 2.0,
    this.indicatorColor = CupertinoColors.activeBlue,
    this.emptyColor = CupertinoColors.systemGrey4,
  });

  final double width;
  final Color indicatorColor;
  final Color emptyColor;

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _UnderlinePainter(this, onChanged);
  }

  Rect _indicatorRectFor(Rect rect, TextDirection textDirection) {
    final Rect indicator = EdgeInsets.zero.deflateRect(rect);
    return Rect.fromLTWH(
      indicator.left,
      indicator.bottom - width,
      indicator.width,
      width,
    );
  }

  @override
  Path getClipPath(Rect rect, TextDirection textDirection) {
    return Path()..addRect(_indicatorRectFor(rect, textDirection));
  }
}

class _UnderlinePainter extends BoxPainter {
  _UnderlinePainter(this.decoration, VoidCallback? onChanged)
      : super(onChanged);

  final GreyUnderlineTabIndicator decoration;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration.size != null);

    final Rect rect = offset & configuration.size!;
    final TextDirection textDirection = configuration.textDirection!;

    final Rect indicator = decoration
        ._indicatorRectFor(rect, textDirection)
        .deflate(decoration.width / 2.0);

    final Paint paint = Paint()
      ..strokeWidth = decoration.width
      ..color = CupertinoColors.activeBlue;

    final Paint paint2 = Paint()
      ..strokeWidth = decoration.width / 4.0
      ..color = CupertinoColors.systemGrey4;

    canvas.drawLine(
        Offset(0, indicator.bottom), Offset(5000, indicator.bottom), paint2);

    canvas.drawLine(indicator.bottomLeft, indicator.bottomRight, paint);
  }
}
