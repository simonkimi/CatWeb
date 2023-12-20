import 'package:catweb/ui/widgets/cupertino_divider.dart';
import 'package:catweb/ui/widgets/dialog.dart';
import 'package:catweb/utils/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class SettingIconDivider extends StatelessWidget {
  const SettingIconDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoDivider(
      height: 1,
      padding: EdgeInsets.only(left: 54),
    );
  }
}

class SettingDivider extends StatelessWidget {
  const SettingDivider({super.key});

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
    super.key,
    required this.text,
  });

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
    super.key,
    required this.title,
    this.color,
    this.icon,
    this.onTap,
    this.trailing,
    this.trailingText,
    this.autoImplyTrailing = true,
  });

  final String title;
  final Color? color;
  final IconData? icon;
  final VoidCallback? onTap;
  final Widget? trailing;
  final String? trailingText;
  final bool autoImplyTrailing;

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile.notched(
      title: Text(title),
      onTap: onTap,
      leading: icon != null && color != null
          ? Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(3),
              ),
              child: Icon(
                icon,
                size: 18,
                color: CupertinoColors.white,
              ),
            )
          : null,
      trailing: trailing ??
          (autoImplyTrailing ? const CupertinoListTileChevron() : null),
      additionalInfo: trailingText != null ? Text(trailingText!) : null,
    );
  }
}

class SettingNumberTile extends StatelessWidget {
  const SettingNumberTile({
    super.key,
    required this.value,
    required this.title,
  });

  final String title;
  final ValueNotifier<int> value;

  @override
  Widget build(BuildContext context) {
    return value.obx((v) => SettingTile(
          title: title,
          trailingText: v.toString(),
          onTap: () {
            showCupertinoInputDialog(
              context,
              initialValue: v.toString(),
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
