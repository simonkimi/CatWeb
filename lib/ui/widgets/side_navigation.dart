import 'package:catweb/ui/theme/colors.dart';
import 'package:cupertino_ui/cupertino_ui.dart';

class SideNavigationDestination {
  const SideNavigationDestination({required this.label, this.icon});

  final String label;
  final IconData? icon;
}

class SideNavigation extends StatelessWidget {
  const SideNavigation({
    required this.destinations,
    required this.selectedIndex,
    required this.onDestinationSelected,
    this.extended = true,
    this.width,
    super.key,
  });

  final List<SideNavigationDestination> destinations;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final bool extended;
  final double? width;

  @override
  Widget build(BuildContext context) {
    final railWidth = width ?? (extended ? 208 : 64);
    return DecoratedBox(
      decoration: BoxDecoration(
        color: FixColor.groupedColor.resolveFrom(context),
        border: Border(
          right: BorderSide(
            color: CupertinoColors.separator.resolveFrom(context),
          ),
        ),
      ),
      child: SizedBox(
        width: railWidth,
        child: ListView(
          padding: EdgeInsets.fromLTRB(
            extended ? 8 : 4,
            8,
            extended ? 8 : 4,
            12,
          ),
          children: [
            for (var i = 0; i < destinations.length; i++)
              _SideNavigationTile(
                destination: destinations[i],
                selected: i == selectedIndex,
                extended: extended || destinations[i].icon == null,
                onTap: () => onDestinationSelected(i),
              ),
          ],
        ),
      ),
    );
  }
}

class _SideNavigationTile extends StatefulWidget {
  const _SideNavigationTile({
    required this.destination,
    required this.selected,
    required this.extended,
    required this.onTap,
  });

  final SideNavigationDestination destination;
  final bool selected;
  final bool extended;
  final VoidCallback onTap;

  @override
  State<_SideNavigationTile> createState() => _SideNavigationTileState();
}

class _SideNavigationTileState extends State<_SideNavigationTile> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final primary = CupertinoTheme.of(context).primaryColor;
    final color = widget.selected
        ? primary
        : CupertinoColors.label.resolveFrom(context);
    final background = widget.selected
        ? primary.withValues(alpha: 0.16)
        : _hovered
        ? CupertinoColors.systemFill.resolveFrom(context)
        : const Color(0x00000000);
    final icon = widget.destination.icon;
    final label = Text(
      widget.destination.label,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: color,
        fontSize: widget.extended ? 14 : 11,
        fontWeight: widget.selected ? FontWeight.w600 : FontWeight.w400,
      ),
    );

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 140),
          curve: Curves.easeOut,
          margin: const EdgeInsets.symmetric(vertical: 2),
          padding: EdgeInsets.symmetric(
            horizontal: widget.extended ? 12 : 4,
            vertical: widget.extended ? 10 : 8,
          ),
          decoration: BoxDecoration(
            color: background,
            borderRadius: BorderRadius.circular(8),
          ),
          child: icon == null
              ? Align(alignment: Alignment.centerLeft, child: label)
              : widget.extended
              ? Row(
                  children: [
                    Icon(icon, size: 20, color: color),
                    const SizedBox(width: 12),
                    Expanded(child: label),
                  ],
                )
              : Column(
                  children: [
                    Icon(icon, size: 22, color: color),
                    const SizedBox(height: 4),
                    label,
                  ],
                ),
        ),
      ),
    );
  }
}
