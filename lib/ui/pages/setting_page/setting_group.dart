import 'package:catweb/ui/theme/colors.dart';
import 'package:flutter/cupertino.dart';

class SettingGroupWidget extends StatelessWidget {
  const SettingGroupWidget({
    Key? key,
    required this.children,
  }) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: isDarkMode(context)
                ? const Color(0xff1c1c1e)
                : CupertinoColors.systemBackground,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: children,
          ),
        ),
      ),
    );
  }
}
