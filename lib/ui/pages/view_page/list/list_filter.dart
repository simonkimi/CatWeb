import 'package:catweb/data/models/site/subpage.dart';
import 'package:catweb/i18n.dart';
import 'package:catweb/ui/widgets/cupertino_divider.dart';
import 'package:catweb/ui/widgets/cupertino_input.dart';
import 'package:catweb/utils/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ListFilterButton extends StatelessWidget {
  const ListFilterButton({
    super.key,
    required this.initFilter,
    required this.onFilterChanged,
  });

  final TemplateListFilter initFilter;
  final ValueChanged<TemplateListFilter> onFilterChanged;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      minSize: 0,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        transitionBuilder: (child, animation) => ScaleTransition(
          scale: animation,
          child: child,
        ),
        child: initFilter.isFilterChanged
            ? const Icon(Icons.filter_alt, key: ValueKey('enable'))
            : const Icon(
                Icons.filter_alt_outlined,
                key: ValueKey('disable'),
              ),
      ),
      onPressed: () => _showFilterDialog(context),
    );
  }

  void _showFilterDialog(BuildContext context) async {
    final result = await showCupertinoDialog<TemplateListFilter?>(
      context: context,
      barrierDismissible: true,
      builder: (context) => FilterDialog(initFilter: initFilter),
    );

    if (result != null) {
      onFilterChanged(result);
    }
  }
}

class FilterDialog extends HookWidget {
  const FilterDialog({super.key, required this.initFilter});

  final TemplateListFilter initFilter;

  @override
  Widget build(BuildContext context) {
    final currentFilter = useState(initFilter.copyWith());
    return CupertinoAlertDialog(
      actions: [
        CupertinoDialogAction(
          child: Text(I.of(context).back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        CupertinoDialogAction(
          child: Text(I.of(context).apply),
          onPressed: () {
            Navigator.of(context).pop(currentFilter.value);
          },
        ),
      ],
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildDialogHeader(context, currentFilter),
            const SizedBox(height: 5),
            const CupertinoDivider(),
            for (final MapEntry(key: index, value: item)
                in currentFilter.value.items.asMap().entries)
              _buildFilterItem(context, index, item, currentFilter),
          ],
        ),
      ),
    );
  }

  Widget _buildDialogHeader(
    BuildContext context,
    ValueNotifier<TemplateListFilter> currentFilter,
  ) {
    return Row(
      children: [
        Text(
          I.of(context).filter,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Expanded(child: SizedBox()),
        CupertinoButton(
          padding: EdgeInsets.zero,
          minSize: 0,
          onPressed: () {
            currentFilter.value = currentFilter.value.reset();
          },
          child: const Icon(CupertinoIcons.refresh),
        )
      ],
    );
  }

  Widget _buildStringFilter(
    BuildContext context,
    String value,
    ValueChanged<String> onChanged,
  ) {
    return SizedBox(
      height: 30,
      width: 60,
      child: CupertinoText(
        initialValue: value,
        decoration: BoxDecoration(
          color: CupertinoColors.systemGroupedBackground.resolveFrom(context),
          borderRadius: BorderRadius.circular(10),
        ),
        onSubmitted: onChanged,
      ),
    );
  }

  Widget _buildIntFilter(
    BuildContext context,
    TemplateListFilterItemNumber item,
    ValueChanged<int> onSubmitted,
  ) {
    return CupertinoIntInput(
      height: 30,
      width: 60,
      decoration: BoxDecoration(
        color: CupertinoColors.systemGroupedBackground.resolveFrom(context),
        borderRadius: BorderRadius.circular(10),
      ),
      initialValue: item.value,
      onSubmitted: onSubmitted,
    );
  }

  Widget _buildFloatFilter(
    BuildContext context,
    TemplateListFilterItemFloat item,
    ValueChanged<double> onSubmitted,
  ) {
    return CupertinoDoubleInput(
      height: 30,
      width: 60,
      decoration: BoxDecoration(
        color: CupertinoColors.systemGroupedBackground.resolveFrom(context),
        borderRadius: BorderRadius.circular(10),
      ),
      initialValue: item.value,
      onSubmitted: onSubmitted,
    );
  }

  Widget _buildBoolFilter(bool value, ValueChanged<bool> onChanged) {
    return SizedBox(
      height: 30,
      child: Transform.scale(
        scale: 0.8,
        alignment: Alignment.centerRight,
        child: CupertinoSwitch(
          value: value,
          onChanged: onChanged,
        ),
      ),
    );
  }

  Widget _buildFilterItem(
    BuildContext context,
    int index,
    TemplateListFilterItem item,
    ValueNotifier<TemplateListFilter> currentFilter,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1),
      child: Row(
        children: [
          Text(item.name),
          const Expanded(child: SizedBox()),
          switch (item) {
            TemplateListFilterItemString item =>
              _buildStringFilter(context, item.value, (value) {
                currentFilter.value = currentFilter.value.copyWith(
                  items: currentFilter.value.items
                      .replaceAt(index, item.copyWith(value: value)),
                );
              }),
            TemplateListFilterItemNumber item =>
              _buildIntFilter(context, item, (value) {
                currentFilter.value = currentFilter.value.copyWith(
                  items: currentFilter.value.items
                      .replaceAt(index, item.copyWith(value: value)),
                );
              }),
            TemplateListFilterItemFloat item =>
              _buildFloatFilter(context, item, (value) {
                currentFilter.value = currentFilter.value.copyWith(
                  items: currentFilter.value.items
                      .replaceAt(index, item.copyWith(value: value)),
                );
              }),
            TemplateListFilterItemBool item =>
              _buildBoolFilter(item.value, (value) {
                currentFilter.value = currentFilter.value.copyWith(
                  items: currentFilter.value.items
                      .replaceAt(index, item.copyWith(value: value)),
                );
              }),
            _ => throw UnimplementedError(),
          }
        ],
      ),
    );
  }
}
