import 'package:catweb/ui/theme/colors.dart';
import 'package:flutter/cupertino.dart';

import 'cupertino_divider.dart';

class SettingDivider extends StatelessWidget {
  const SettingDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoDivider(
      height: 1,
      padding: EdgeInsets.only(left: 45),
    );
  }
}

class SettingTile extends StatelessWidget {
  const SettingTile({
    Key? key,
    required this.title,
    required this.color,
    required this.icon,
    this.onTap,
  }) : super(key: key);

  final String title;
  final Color color;
  final IconData? icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (icon != null)
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
