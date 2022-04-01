import 'package:catweb/ui/theme/colors.dart';
import 'package:flutter/cupertino.dart';

import '../../components/cupertino_divider.dart';

class SettingIconDivider extends StatelessWidget {
  const SettingIconDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoDivider(
      height: 1,
      padding: EdgeInsets.only(left: 54),
    );
  }
}

class SettingDivider extends StatelessWidget {
  const SettingDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoDivider(
      height: 1,
      padding: EdgeInsets.only(left: 10),
    );
  }
}

class SettingTileTrailing extends StatelessWidget {
  const SettingTileTrailing({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(text),
        const Icon(
          CupertinoIcons.forward,
          size: 18,
          color: CupertinoColors.inactiveGray,
        )
      ],
    );
  }
}

class SettingTile extends StatelessWidget {
  const SettingTile({
    Key? key,
    required this.title,
    this.color,
    this.icon,
    this.onTap,
    this.trailing,
  }) : super(key: key);

  final String title;
  final Color? color;
  final IconData? icon;
  final VoidCallback? onTap;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (icon != null && color != null) ...[
              Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Icon(
                  icon,
                  size: 20,
                  color: CupertinoColors.white,
                ),
              ),
              const SizedBox(width: 10),
            ],
            Expanded(
              child: Row(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: FixColor.title.resolveFrom(context),
                    ),
                  ),
                ],
              ),
            ),
            trailing ??
                const Icon(
                  CupertinoIcons.forward,
                  size: 18,
                  color: CupertinoColors.inactiveGray,
                ),
          ],
        ),
      ),
    );
  }
}
