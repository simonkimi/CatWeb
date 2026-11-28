import 'package:catweb/ui/layout/window_size.dart';
import 'package:catweb/ui/theme/colors.dart';
import 'package:catweb/ui/widgets/side_navigation.dart';
import 'package:cupertino_ui/cupertino_ui.dart';

/// Segmented controls stay readable up to five choices. Longer lists use a menu.
const kMaxSegmentedChoices = 5;

class CupertinoTab {
  const CupertinoTab(this.text);

  final String text;
}

class CupertinoSegmentedTabs extends StatelessWidget {
  const CupertinoSegmentedTabs({
    super.key,
    required this.labels,
    required this.selectedIndex,
    required this.onChanged,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
    this.maxWidth = 720,
  });

  final List<String> labels;
  final int selectedIndex;
  final ValueChanged<int> onChanged;
  final EdgeInsetsGeometry padding;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    if (labels.length < 2) return const SizedBox.shrink();
    final index = selectedIndex.clamp(0, labels.length - 1);
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: Padding(
          padding: padding,
          child: SizedBox(
            width: double.infinity,
            child: CupertinoSlidingSegmentedControl<int>(
              groupValue: index,
              onValueChanged: (value) {
                if (value != null) onChanged(value);
              },
              children: {
                for (var i = 0; i < labels.length; i++)
                  i: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Text(
                      labels[i],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13,
                        color: CupertinoColors.label.resolveFrom(context),
                      ),
                    ),
                  ),
              },
            ),
          ),
        ),
      ),
    );
  }
}

class CupertinoTitleMenu extends StatelessWidget {
  const CupertinoTitleMenu({
    super.key,
    required this.title,
    required this.labels,
    required this.selectedIndex,
    required this.onSelected,
  });

  final String title;
  final List<String> labels;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    if (labels.length < 2) {
      return Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 16,
          height: 1.1,
          fontWeight: FontWeight.bold,
          color: FixColor.title.resolveFrom(context),
        ),
      );
    }

    final index = selectedIndex.clamp(0, labels.length - 1);
    final selected = labels[index];
    final titleColor = FixColor.title.resolveFrom(context);
    final available = MediaQuery.sizeOf(context).width - 128;
    final maxWidth = available < 96 ? 96.0 : available;
    final menuHeight = MediaQuery.sizeOf(context).height * 0.6;

    return CupertinoMenuAnchor(
      constrainCrossAxis: true,
      consumeOutsideTaps: true,
      constraints: BoxConstraints(
        minWidth: 220,
        maxWidth: 300,
        maxHeight: menuHeight,
      ),
      menuChildren: [
        for (var i = 0; i < labels.length; i++)
          CupertinoMenuItem(
            onPressed: () => onSelected(i),
            leading: i == index
                ? Icon(
                    CupertinoIcons.check_mark,
                    size: 16,
                    color: CupertinoColors.label.resolveFrom(context),
                  )
                : null,
            child: Text(
              labels[i],
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
      ],
      builder: (context, controller, _) {
        return CupertinoButton(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          minimumSize: Size.zero,
          onPressed: () {
            if (controller.isOpen) {
              controller.close();
            } else {
              controller.open();
            }
          },
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: maxWidth),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: maxWidth - 20),
                      child: Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16,
                          height: 1.1,
                          fontWeight: FontWeight.bold,
                          color: titleColor,
                        ),
                      ),
                    ),
                    const SizedBox(width: 3),
                    Icon(
                      CupertinoIcons.chevron_down,
                      size: 12,
                      color: titleColor,
                    ),
                  ],
                ),
                if (selected.isNotEmpty)
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: maxWidth),
                    child: Text(
                      selected,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 11,
                        height: 1.1,
                        color: CupertinoColors.secondaryLabel.resolveFrom(
                          context,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CupertinoTabBarView extends StatefulWidget {
  const CupertinoTabBarView({
    super.key,
    required this.tabs,
    required this.children,
  }) : assert(tabs.length == children.length);

  final List<CupertinoTab> tabs;
  final List<Widget> children;

  @override
  State<CupertinoTabBarView> createState() => _CupertinoTabBarViewState();
}

class _CupertinoTabBarViewState extends State<CupertinoTabBarView> {
  int _index = 0;

  @override
  void didUpdateWidget(covariant CupertinoTabBarView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_index >= widget.children.length) {
      _index = widget.children.isEmpty ? 0 : widget.children.length - 1;
    }
  }

  void _select(int index) {
    if (index == _index || index < 0 || index >= widget.children.length) {
      return;
    }
    FocusManager.instance.primaryFocus?.unfocus();
    setState(() => _index = index);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.tabs.length <= 1) {
      return widget.children.isEmpty
          ? const SizedBox.shrink()
          : widget.children.first;
    }
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final expanded = constraints.maxWidth >= WindowSize.expanded;
          return Row(
            children: [
              if (expanded)
                SideNavigation(
                  width: 176,
                  destinations: [
                    for (final tab in widget.tabs)
                      SideNavigationDestination(label: tab.text),
                  ],
                  selectedIndex: _index,
                  onDestinationSelected: _select,
                ),
              Expanded(
                child: Column(
                  children: [
                    if (!expanded)
                      Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 8),
                        child: CupertinoSegmentedTabs(
                          labels: [for (final tab in widget.tabs) tab.text],
                          selectedIndex: _index,
                          onChanged: _select,
                        ),
                      ),
                    Expanded(
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          for (var i = 0; i < widget.children.length; i++)
                            Offstage(
                              offstage: i != _index,
                              child: TickerMode(
                                enabled: i == _index,
                                child: widget.children[i],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
