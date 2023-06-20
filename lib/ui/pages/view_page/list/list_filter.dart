import 'package:catweb/data/protocol/model/templete.dart';
import 'package:catweb/gen/protobuf/template.pbenum.dart';
import 'package:catweb/i18n.dart';
import 'package:catweb/ui/widgets/badge.dart';
import 'package:catweb/ui/widgets/cupertino_divider.dart';
import 'package:catweb/ui/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'controller/subpage_controller.dart';

class ListFilterButton extends StatelessWidget {
  const ListFilterButton({
    super.key,
    required this.controller,
  });

  final SubListController controller;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      minSize: 0,
      child: Obx(() => AnimatedSwitcher(
            duration: 200.milliseconds,
            transitionBuilder: (child, animation) => ScaleTransition(
              scale: animation,
              child: child,
            ),
            child: controller.useFilter
                ? const Icon(Icons.filter_alt, key: ValueKey('enable'))
                : const Icon(Icons.filter_alt_outlined,
                    key: ValueKey('disable')),
          )),
      onPressed: () => _showFilterDialog(context),
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
              child: Text(I.of(context).back),
              onPressed: () => Get.back(),
            ),
            CupertinoDialogAction(
              child: Text(I.of(context).apply),
              onPressed: () {
                controller.applyFilter(true);
                Get.back();
              },
            ),
          ],
          content: StatefulBuilder(
            builder: (context, setState) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildDialogHeader(context, setState),
                    const SizedBox(height: 5),
                    const CupertinoDivider(),
                    _buildColorButton(context),
                    for (final item in controller.filter)
                      if (item.type.value !=
                          TemplateListData_FilterType.FILTER_TYPE_BOOL_CARD)
                        _buildFilterItem(context, item),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildColorButton(BuildContext context) {
    final items = controller.filter
        .where((p0) =>
            p0.type.value == TemplateListData_FilterType.FILTER_TYPE_BOOL_CARD)
        .toList();

    void onLongPress(int index) {
      final item = items.elementAt(index);
      var newValue = !(item.value.value == 'true') ? 'true' : 'false';
      final rawIndex = controller.filter.indexOf(item);

      for (var i = 0; i < rawIndex; i++) {
        if (controller.filter[i].type.value ==
            TemplateListData_FilterType.FILTER_TYPE_BOOL_CARD) {
          controller.filter[i].value.value = newValue;
        } else {
          break;
        }
      }

      for (var i = rawIndex + 1; i < controller.filter.length; i++) {
        if (controller.filter[i].type.value ==
            TemplateListData_FilterType.FILTER_TYPE_BOOL_CARD) {
          controller.filter[i].value.value = newValue;
        } else {
          break;
        }
      }
    }

    return Column(
      children: [
        for (var i = 0; i < items.length; i += 2)
          Row(
            children: [
              for (var j = 0; j < 2; j++)
                if (i + j < items.length)
                  Expanded(
                    child: GestureDetector(
                      onTap: () => items.elementAt(i + j).value.value =
                          items.elementAt(i + j).value.value.toLowerCase() ==
                                  'true'
                              ? 'false'
                              : 'true',
                      onLongPress: () => onLongPress(i + j),
                      child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: Obx(() => SlimBadge(
                              disable: items
                                      .elementAt(i + j)
                                      .value
                                      .value
                                      .toLowerCase() !=
                                  'true',
                              text: items.elementAt(i + j).name.value,
                              color: parseColorString(
                                  items.elementAt(i + j).color.value),
                            )),
                      ),
                    ),
                  ),
            ],
          ),
      ],
    );
  }

  Widget _buildDialogHeader(BuildContext context, StateSetter setState) {
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
            controller.resetFilter();
            setState(() {});
          },
          child: const Icon(CupertinoIcons.refresh),
        )
      ],
    );
  }

  Widget _buildFilterItem(BuildContext context, SearchFilterItem item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1),
      child: Row(
        children: [
          Text(item.name.value),
          const Expanded(child: SizedBox()),
          if (item.type.value == TemplateListData_FilterType.FILTER_TYPE_BOOL)
            SizedBox(
              height: 30,
              child: Transform.scale(
                scale: 0.8,
                alignment: Alignment.centerRight,
                child: Obx(() => CupertinoSwitch(
                      value: item.value.value.toLowerCase().trim() == 'true',
                      onChanged: (value) {
                        item.value.value =
                            item.value.value.toLowerCase() == 'true'
                                ? 'false'
                                : 'true';
                      },
                    )),
              ),
            ),
          if (item.type.value ==
                  TemplateListData_FilterType.FILTER_TYPE_STRING ||
              item.type.value == TemplateListData_FilterType.FILTER_TYPE_NUMBER)
            SizedBox(
              height: 30,
              width: 60,
              child: CupertinoTextField(
                controller: TextEditingController(text: item.value.value),
                decoration: BoxDecoration(
                  color: CupertinoColors.systemGroupedBackground
                      .resolveFrom(context),
                  borderRadius: BorderRadius.circular(10),
                ),
                inputFormatters: [
                  if (item.type.value ==
                      TemplateListData_FilterType.FILTER_TYPE_NUMBER)
                    FilteringTextInputFormatter.digitsOnly
                ],
                keyboardType: item.type.value ==
                        TemplateListData_FilterType.FILTER_TYPE_NUMBER
                    ? TextInputType.number
                    : null,
                onChanged: (value) {
                  item.value.value = value;
                },
              ),
            ),
        ],
      ),
    );
  }
}
