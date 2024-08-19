import 'package:catweb/data/models/site/subpage.dart';
import 'package:catweb/i18n.dart';
import 'package:catweb/ui/widgets/cupertino_divider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'notifier/filter_notifier.dart';

class ListFilterButton extends StatelessWidget {
  const ListFilterButton({
    super.key,
    required this.initFilter,
    required this.onFilterChanged,
  });

  final List<TemplateListFilterItem> initFilter;
  final ValueChanged<List<TemplateListFilterItem>> onFilterChanged;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FilterNotifier(initFilter: initFilter),
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        minSize: 0,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          transitionBuilder: (child, animation) =>
              ScaleTransition(
                scale: animation,
                child: child,
              ),
          child: Consumer<FilterNotifier>(
            builder: (context, controller, child) {
              return controller.isFilterChanged
                  ? const Icon(Icons.filter_alt, key: ValueKey('enable'))
                  : const Icon(Icons.filter_alt_outlined,
                  key: ValueKey('disable'));
            },
          ),
        ),
        onPressed: () => _showFilterDialog(context),
      ),
    );
  }

  void _showFilterDialog(BuildContext context) {
    showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return CupertinoAlertDialog(
          actions: [
            CupertinoDialogAction(
              child: Text(I
                  .of(context)
                  .back),
              onPressed: () => Navigator.of(context).pop(),
            ),
            CupertinoDialogAction(
              child: Text(I
                  .of(context)
                  .apply),
              onPressed: () {
                context.read<FilterNotifier>().applyFilter();
                Navigator.of(context).pop();
              },
            ),
          ],
          content: StatefulBuilder(
            builder: (context, setState) {
              return SingleChildScrollView(
                child: Consumer<FilterNotifier>(
                  builder: (context, controller, _) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildDialogHeader(context, setState),
                        const SizedBox(height: 5),
                        const CupertinoDivider(),
                        for (final item in controller.currentFilter)
                          _buildFilterItem(context, item),
                      ],
                    );
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildDialogHeader(BuildContext context, StateSetter setState) {
    return Row(
      children: [
        Text(
          I
              .of(context)
              .filter,
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
            context.read<FilterNotifier>().resetFilter();
            setState(() {});
          },
          child: const Icon(CupertinoIcons.refresh),
        )
      ],
    );
  }

  Widget _buildFilterItem(BuildContext context, TemplateListFilterItem item) {
    return SizedBox();
    // return Padding(
    //   padding: const EdgeInsets.symmetric(vertical: 1),
    //   child: Row(
    //     children: [
    //       Text(item.name),
    //       const Expanded(child: SizedBox()),
    //
    //       switch(item) {
    //         TemplateListFilterItemBool item =>
    //             SizedBox(
    //               height: 30,
    //               child: Transform.scale(
    //                 scale: 0.8,
    //                 alignment: Alignment.centerRight,
    //                 child: CupertinoSwitch(
    //                   value: item.value.value.toLowerCase().trim() == 'true',
    //                   onChanged: (value) {
    //                     item.value.value =
    //                     item.value.value.toLowerCase() == 'true'
    //                         ? 'false'
    //                         : 'true';
    //                   },
    //                 ),
    //               ),
    //             ),
    //         TemplateListFilterItem() => throw UnimplementedError(),
    //       }
    //
    //
    //       if (item is TemplateListFilterItemBool)
    //         SizedBox(
    //           height: 30,
    //           child: Transform.scale(
    //             scale: 0.8,
    //             alignment: Alignment.centerRight,
    //             child: CupertinoSwitch(
    //               value: item.value.value.toLowerCase().trim() == 'true',
    //               onChanged: (value) {
    //                 item.value.value = item.value.value.toLowerCase() == 'true'
    //                     ? 'false'
    //                     : 'true';
    //               },
    //             ),
    //           ),
    //         ),
    //
    //
    //       if (item.type == FilterType.string || item.type == FilterType.number)
    //         SizedBox(
    //           height: 30,
    //           width: 60,
    //           child: CupertinoTextField(
    //             controller: TextEditingController(text: item.value.value),
    //             decoration: BoxDecoration(
    //               color: CupertinoColors.systemGroupedBackground
    //                   .resolveFrom(context),
    //               borderRadius: BorderRadius.circular(10),
    //             ),
    //             inputFormatters: [
    //               if (item.type == FilterType.number)
    //                 FilteringTextInputFormatter.digitsOnly
    //             ],
    //             keyboardType: item.type == FilterType.number
    //                 ? TextInputType.number
    //                 : null,
    //             onChanged: (value) {
    //               item.value.value = value;
    //             },
    //           ),
    //         ),
    //     ],
    //   ),
    // );
  }
}
