import 'package:catweb/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CupertinoListTile extends HookWidget {
  const CupertinoListTile({
    Key? key,
    this.leading,
    this.title,
    this.enabled = true,
    this.selected = false,
    this.onTap,
    this.trailing,
    this.subtitle,
    this.selectedColor,
    this.onTrailingTap,
  })  : assert(onTrailingTap == null || trailing != null),
        super(key: key);

  final Widget? leading;
  final bool enabled;
  final bool selected;
  final Widget? title;
  final VoidCallback? onTap;
  final Widget? trailing;
  final Widget? subtitle;
  final Color? selectedColor;
  final VoidCallback? onTrailingTap;

  @override
  Widget build(BuildContext context) {
    final _animationController = useAnimationController(
      duration: const Duration(milliseconds: 80),
    );

    final _opacityAnimation = _animationController
        .drive(CurveTween(curve: Curves.decelerate))
        .drive(Tween<double>(begin: 1.0, end: 0.4));

    void _onTapDown() {
      _animationController.forward();
    }

    void _onTapUp() {
      _animationController.reverse();
    }

    final bgColor = selected
        ? selectedColor ?? CupertinoColors.activeBlue
        : isDarkMode(context)
            ? const Color(0xff1c1c1e)
            : CupertinoColors.systemGroupedBackground;

    final textColor = selected
        ? bgColor.isDark
            ? CupertinoColors.white
            : CupertinoColors.black
        : _buildColor(context);

    return GestureDetector(
      onTapDown: (_) {
        if (onTap != null) {
          _onTapDown();
        }
      },
      onTapUp: (_) {
        if (onTap != null) {
          _onTapUp();
          onTap!();
        }
      },
      onTapCancel: () => _onTapUp(),
      child: FadeTransition(
        opacity: _opacityAnimation,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: bgColor,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              children: [
                if (leading != null)
                  SizedBox(
                    width: 50,
                    child: _buildIcon(context, leading!, textColor),
                  ),
                Padding(
                  padding: leading == null
                      ? const EdgeInsets.only(left: 15)
                      : EdgeInsets.zero,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (title != null)
                        _buildText(
                          context,
                          title!,
                          TextStyle(color: textColor, fontSize: 15),
                        ),
                      if (subtitle != null)
                        _buildText(
                          context,
                          subtitle!,
                          TextStyle(color: textColor, fontSize: 12),
                        ),
                    ],
                  ),
                ),
                const Expanded(child: SizedBox()),
                if (trailing != null)
                  SizedBox(
                    width: 50,
                    child: GestureDetector(
                      onTapDown: (_) => {},
                      onTapUp: (_) => {},
                      onTap: onTrailingTap,
                      child: _buildIcon(context, trailing!, textColor),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildText(BuildContext context, Widget widget, TextStyle style) {
    if (widget is Text) {
      return Text(
        widget.data!,
        style: widget.style ?? style,
      );
    }
    return widget;
  }

  Widget _buildIcon(BuildContext context, Widget icon, Color defaultColor) {
    if (icon is Icon) {
      return Icon(
        icon.icon,
        color: icon.color ?? defaultColor,
        size: icon.size ?? 20,
      );
    }
    return icon;
  }

  Color _buildColor(BuildContext context) {
    return isDarkMode(context)
        ? CupertinoColors.systemGrey6
        : CupertinoColors.black;
  }
}
