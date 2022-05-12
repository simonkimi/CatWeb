import 'package:catweb/data/constant.dart';
import 'package:catweb/ui/widgets/zoom.dart';
import 'package:catweb/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:photo_view/photo_view.dart';

class ZoomWidget extends StatelessWidget {
  const ZoomWidget({
    Key? key,
    required this.controller,
    required this.animation,
    required this.canZoom,
    required this.child,
  }) : super(key: key);

  final PhotoViewController controller;
  final ZoomAnimation animation;
  final bool canZoom;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return canZoom
        ? GestureDetector(
            child: child,
            onDoubleTap: () {},
            onDoubleTapDown: (detail) {
              // 缩放
              final position = detail.globalPosition;
              final currentScale = controller.scale ?? 1.0;
              var index = doubleTapScales
                      .indexOf(currentScale.nearList(doubleTapScales)) +
                  1;
              if (index >= doubleTapScales.length) index = 0;
              final scale = doubleTapScales[index];
              animation.animationScale(currentScale, scale);
              // 位移
              final mediaSize = MediaQuery.of(context).size;
              final currentX = controller.position.dx;
              final currentY = controller.position.dy;
              final targetX = (mediaSize.width / 2 - position.dx) * (scale - 1);
              final targetY =
                  (mediaSize.height / 2 - position.dy) * (scale - 1);

              animation.listen((model) {
                controller.scale = model.scale;
                controller.position = model.offset;
              });

              animation.animationOffset(
                Offset(currentX, currentY),
                Offset(targetX, targetY),
              );
            },
          )
        : child;
  }
}
