import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CupertinoInfProgress extends HookWidget {
  const CupertinoInfProgress({
    super.key,
    this.size,
    this.duration = const Duration(seconds: 2),
  });

  final double? size;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    final aniController = useAnimationController(duration: duration);
    final ani =
        useAnimation(Tween<double>(begin: 0, end: 1).animate(aniController));
    aniController.repeat();
    return CustomPaint(
      size: Size.square(size ?? 20),
      painter: _CircularInfProgressPaint(ani),
    );
  }
}

class _CircularInfProgressPaint extends CustomPainter {
  _CircularInfProgressPaint(this.value);

  final double value;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    final outerPaint = Paint()
      ..color = CupertinoColors.white
      ..strokeWidth = 0.06 * size.width
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final progress = 2 * pi * value;

    final innerPaint = Paint()
      ..color = CupertinoColors.white
      ..strokeWidth = 5;

    canvas.drawCircle(
      center,
      min(size.width, size.height),
      outerPaint,
    );

    canvas.drawCircle(
      Offset(center.dx - sin(progress) * size.width,
          center.dy + cos(progress) * size.width),
      size.width * 0.15,
      innerPaint,
    );
  }

  @override
  bool shouldRepaint(_CircularInfProgressPaint oldDelegate) =>
      oldDelegate.value != value;
}

class CupertinoProgress extends ImplicitlyAnimatedWidget {
  const CupertinoProgress({
    super.key,
    required this.progress,
    super.duration = const Duration(milliseconds: 200),
    this.size,
  });

  final double progress;
  final double? size;

  @override
  AnimatedWidgetBaseState<CupertinoProgress> createState() =>
      _CupertinoProgressState();
}

class _CupertinoProgressState
    extends AnimatedWidgetBaseState<CupertinoProgress> {
  Tween<double>? _progressTween;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.square(widget.size ?? 20),
      painter: _CircularProgressPaint(
        _progressTween!.evaluate(animation).clamp(0, 1),
      ),
    );
  }

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _progressTween = visitor(_progressTween, widget.progress,
        (dynamic value) => Tween<double>(begin: value)) as Tween<double>?;
  }
}

class _CircularProgressPaint extends CustomPainter {
  _CircularProgressPaint(this.progress);

  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    final outerPaint = Paint()
      ..color = CupertinoColors.white
      ..strokeWidth = 0.06 * size.width
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    final innerPaint = Paint()
      ..color = CupertinoColors.white
      ..strokeWidth = 5;

    canvas.drawCircle(
      center,
      min(size.width, size.height),
      outerPaint,
    );

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: size.width - (0.1 * size.width)),
      -0.5 * pi,
      2 * pi * progress,
      true,
      innerPaint,
    );
  }

  @override
  bool shouldRepaint(_CircularProgressPaint oldDelegate) =>
      oldDelegate.progress != progress;
}
