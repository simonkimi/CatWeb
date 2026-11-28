import 'package:catweb/data/constant.dart';
import 'package:catweb/ui/widgets/zoom.dart';
import 'package:catweb/utils/helper.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:photo_view/photo_view.dart';

class ZoomWidget extends StatefulWidget {
  const ZoomWidget({
    super.key,
    required this.controller,
    required this.canZoom,
    required this.child,
  });

  final PhotoViewController controller;
  final bool canZoom;
  final Widget child;

  @override
  State<ZoomWidget> createState() => _ZoomWidgetState();
}

class _ZoomWidgetState extends State<ZoomWidget> with TickerProviderStateMixin {
  late final ZoomAnimation animation;

  @override
  void initState() {
    super.initState();
    animation = ZoomAnimation(
      this,
      duration: const Duration(milliseconds: 200),
    );
  }

  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.canZoom
        ? GestureDetector(
            child: widget.child,
            onDoubleTap: () {},
            onDoubleTapDown: (detail) {
              // 缩放
              final position = detail.globalPosition;
              final controller = widget.controller;
              final currentScale = controller.scale ?? 1.0;
              var index =
                  doubleTapScales.indexOf(
                    currentScale.nearList(doubleTapScales),
                  ) +
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
        : widget.child;
  }
}
