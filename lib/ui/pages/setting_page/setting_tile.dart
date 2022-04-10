import 'package:catweb/ui/components/dialog.dart';
import 'package:catweb/ui/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

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

class SettingTile extends HookWidget {
  const SettingTile({
    Key? key,
    required this.title,
    this.color,
    this.icon,
    this.onTap,
    this.trailing,
    this.trailingText,
  }) : super(key: key);

  final String title;
  final Color? color;
  final IconData? icon;
  final VoidCallback? onTap;
  final Widget? trailing;
  final String? trailingText;

  @override
  Widget build(BuildContext context) {
    final isTapDown = useState(false);

    return GestureDetector(
      onTap: onTap,
      onTapDown: (_) => isTapDown.value = true,
      onTapUp: (_) => isTapDown.value = false,
      onTapCancel: () => isTapDown.value = false,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        decoration: BoxDecoration(
          color: isTapDown.value
              ? FixColor.pressedColor.resolveFrom(context)
              : null,
        ),
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (trailingText != null)
                        Text(
                          trailingText!,
                          style: const TextStyle(
                            color: CupertinoColors.inactiveGray,
                            fontSize: 16,
                          ),
                        ),
                      const Icon(
                        CupertinoIcons.forward,
                        size: 18,
                        color: CupertinoColors.inactiveGray,
                      )
                    ],
                  ),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingNumberTile extends StatelessWidget {
  const SettingNumberTile({
    Key? key,
    required this.value,
    required this.title,
  }) : super(key: key);

  final String title;
  final RxInt value;

  @override
  Widget build(BuildContext context) {
    return Obx(() => SettingTile(
          title: title,
          trailingText: value.string,
          onTap: () {
            showCupertinoInputDialog(
              context,
              initialValue: value.string,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
            ).then((e) {
              if (e != null) {
                value.value = int.tryParse(e) ?? value.value;
              }
            });
          },
        ));
  }
}
