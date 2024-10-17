import 'package:catweb/utils/context_helper.dart';
import 'package:flutter/cupertino.dart';

class SettingGroupSliver extends StatelessWidget {
  const SettingGroupSliver({
    super.key,
    required this.children,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: context.isDarkMode
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
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: CupertinoColors.inactiveGray.resolveFrom(context),
        fontSize: 14,
      ),
    );
  }
}

class SettingGroupWidget extends StatelessWidget {
  const SettingGroupWidget({
    super.key,
    required this.children,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: context.isDarkMode
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
