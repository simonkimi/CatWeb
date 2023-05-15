import 'package:catweb/ui/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CupertinoCardTile extends HookWidget {
  const CupertinoCardTile({
    super.key,
    this.leading,
    this.title,
    this.enabled = true,
    this.selected = false,
    this.onTap,
    this.trailing,
    this.subtitle,
    this.selectedColor,
    this.onTrailingTap,
    this.padding = const EdgeInsets.symmetric(vertical: 5),
  }) : assert(onTrailingTap == null || trailing != null);

  final Widget? leading;
  final bool enabled;
  final bool selected;
  final Widget? title;
  final VoidCallback? onTap;
  final Widget? trailing;
  final Widget? subtitle;
  final Color? selectedColor;
  final VoidCallback? onTrailingTap;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final isTap = useState(false);

    final bgColor = selected
        ? selectedColor ?? CupertinoColors.activeBlue.resolveFrom(context)
        : FixColor.groupedColor.resolveFrom(context);

    final textColor = selected
        ? bgColor.isDark
            ? CupertinoColors.white
            : CupertinoColors.black
        : _buildColor(context);

    return GestureDetector(
      onTapDown: (_) {
        if (onTap != null) {
          isTap.value = true;
        }
      },
      onTapUp: (details) {
        if (onTap != null) {
          isTap.value = false;
          if (context.size != null &&
              onTrailingTap != null &&
              details.localPosition.dx > context.size!.width / 7 * 6) {
            onTrailingTap?.call();
          } else {
            onTap!();
          }
        }
      },
      onTapCancel: () => isTap.value = false,
      child: Padding(
        padding: padding,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: isTap.value ? bgColor.withOpacity(0.4) : bgColor,
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
