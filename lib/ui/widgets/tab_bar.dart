import 'package:catweb/ui/layout/window_size.dart';
import 'package:catweb/ui/theme/colors.dart';
import 'package:catweb/ui/widgets/side_navigation.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:material_ui/material_ui.dart';

import 'grey_tab_indicator.dart';

class CupertinoTab extends StatelessWidget {
  const CupertinoTab(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Tab(
      height: 30,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          color: CupertinoColors.label.resolveFrom(context),
        ),
        maxLines: 1,
      ),
    );
  }
}

class CupertinoTabBarView extends StatelessWidget {
  const CupertinoTabBarView({
    super.key,
    required this.tabs,
    required this.children,
  }) : assert(tabs.length == children.length);

  final List<CupertinoTab> tabs;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    if (tabs.length == 1) return children.first;
    return DefaultTabController(
      length: tabs.length,
      child: SafeArea(
        child: Builder(
          builder: (context) {
            final controller = DefaultTabController.of(context);
            return LayoutBuilder(
              builder: (context, constraints) {
                final expanded = constraints.maxWidth >= WindowSize.expanded;
                return AnimatedBuilder(
                  animation: controller,
                  builder: (context, _) {
                    return Row(
                      children: [
                        if (expanded)
                          SideNavigation(
                            width: 176,
                            destinations: [
                              for (final tab in tabs)
                                SideNavigationDestination(label: tab.text),
                            ],
                            selectedIndex: controller.index,
                            onDestinationSelected: (index) {
                              if (controller.index != index) {
                                controller.animateTo(index);
                              }
                            },
                          )
                        else
                          const SizedBox.shrink(),
                        Expanded(
                          child: Column(
                            children: [
                              if (expanded)
                                const SizedBox.shrink()
                              else
                                Material(
                                  color: FixColor.navigationBarBackground
                                      .resolveFrom(context),
                                  child: TabBar(
                                    controller: controller,
                                    isScrollable: true,
                                    tabAlignment: TabAlignment.start,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                    ),
                                    labelPadding: const EdgeInsets.symmetric(
                                      horizontal: 14,
                                    ),
                                    labelColor: FixColor.title.resolveFrom(
                                      context,
                                    ),
                                    indicator:
                                        const GreyUnderlineTabIndicator(),
                                    tabs: tabs,
                                  ),
                                ),
                              Expanded(
                                child: TabBarView(
                                  controller: controller,
                                  physics: expanded
                                      ? const NeverScrollableScrollPhysics()
                                      : null,
                                  children: children,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
