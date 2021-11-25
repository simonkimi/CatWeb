import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CupertinoRemovableListTile extends HookWidget {
  const CupertinoRemovableListTile({
    Key? key,
    required this.title,
    this.height = 50,
    this.deleteText,
    this.onDelete,
  }) : super(key: key);

  final double height;
  final Widget title;
  final String? deleteText;

  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    final transAnimationController = useAnimationController(
      duration: const Duration(milliseconds: 200),
    );

    final deleteAnimationController = useAnimationController(
      duration: const Duration(milliseconds: 200),
    );

    final rowAnimation = transAnimationController.drive(
        Tween<Offset>(begin: const Offset(0, 0), end: const Offset(-0.1, 0)));

    final buttonAnimation = transAnimationController.drive(
        Tween<Offset>(begin: const Offset(1, 0), end: const Offset(0, 0)));

    final deleteButtonHeightAnimation = deleteAnimationController
        .drive(CurveTween(curve: Curves.decelerate))
        .drive(Tween<double>(begin: height, end: 0));

    final deleteButtonWidthAnimation = deleteAnimationController
        .drive(CurveTween(curve: Curves.decelerate))
        .drive(
            Tween<double>(begin: 80, end: MediaQuery.of(context).size.width));

    final rowDeleteAnimation = deleteAnimationController
        .drive(CurveTween(curve: Curves.decelerate))
        .drive(
            Tween<Offset>(begin: const Offset(0, 0), end: const Offset(-1, 0)));

    final isFold = useState(false);
    final listHeight = useState(deleteButtonHeightAnimation.value);
    final listWidth = useState(deleteButtonWidthAnimation.value);
    final isComplete = useState(false);

    deleteAnimationController.addListener(() {
      listHeight.value = deleteButtonHeightAnimation.value;
      listWidth.value = deleteButtonWidthAnimation.value;
    });

    deleteAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed && !isComplete.value) {
        isComplete.value = true;
        onDelete?.call();
      }
    });

    return AnimatedContainer(
      height: listHeight.value,
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: CupertinoColors.separator.resolveFrom(context),
            width: 0.5,
          ),
        ),
      ),
      child: GestureDetector(
        onTap: () {
          if (!isFold.value) {
            isFold.value = true;
            transAnimationController.reverse();
          }
        },
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: SlideTransition(
                  position: rowDeleteAnimation,
                  child: SlideTransition(
                    position: rowAnimation,
                    child: listHeight.value >= 20
                        ? Row(
                            children: [
                              const SizedBox(width: 10),
                              CupertinoButton(
                                padding: EdgeInsets.zero,
                                minSize: 0,
                                child: Icon(
                                  CupertinoIcons.minus_circle_fill,
                                  color: CupertinoColors.systemRed
                                      .resolveFrom(context),
                                ),
                                onPressed: () {
                                  isFold.value = false;
                                  transAnimationController.forward();
                                },
                              ),
                              const SizedBox(width: 15),
                              Expanded(child: title),
                            ],
                          )
                        : const SizedBox(),
                  ),
                ),
              ),
            ),
            SlideTransition(
              position: buttonAnimation,
              child: GestureDetector(
                onTap: () {
                  deleteAnimationController.forward();
                },
                child: AnimatedContainer(
                  width: listWidth.value,
                  height: listHeight.value,
                  decoration: BoxDecoration(
                    color: CupertinoColors.systemRed.resolveFrom(context),
                  ),
                  duration: const Duration(milliseconds: 200),
                  child: Center(
                    child: Text(
                      deleteText ?? '删除',
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
