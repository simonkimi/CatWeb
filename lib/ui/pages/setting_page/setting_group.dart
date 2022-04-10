import 'package:catweb/ui/theme/colors.dart';
import 'package:flutter/cupertino.dart';

class SettingGroupSliver extends StatelessWidget {
  const SettingGroupSliver({
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

class SettingGroupTitle extends StatelessWidget {
  const SettingGroupTitle(
    this.title, {
    Key? key,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 5),
      child: Text(
        title,
        style: TextStyle(
          color: CupertinoColors.inactiveGray.resolveFrom(context),
          fontSize: 14,
        ),
      ),
    );
  }
}

class SettingGroupWidget extends StatelessWidget {
  const SettingGroupWidget({
    Key? key,
    required this.children,
  }) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
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
    );
  }
}
