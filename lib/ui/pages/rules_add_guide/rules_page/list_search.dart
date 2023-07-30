import 'package:catweb/data/models/site_model/pages/subpage.dart';
import 'package:catweb/data/models/site_model/pages/template_list.dart';
import 'package:catweb/i18n.dart';
import 'package:catweb/ui/widgets/cupertino_deletable_tile.dart';
import 'package:catweb/ui/widgets/cupertino_input.dart';
import 'package:catweb/ui/widgets/cupertino_obs_swiitch.dart';
import 'package:catweb/ui/widgets/dialog.dart';
import 'package:catweb/ui/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_swipe_action_cell/core/controller.dart';
import 'package:get/get.dart';

class ListFilterEditor extends HookWidget {
  const ListFilterEditor({
    super.key,
    required this.templateBase,
  });

  final TemplateList templateBase;

  @override
  Widget build(BuildContext context) {
    final filterController = SwipeActionController();

    return ListView(
      children: [
        Container(
          decoration: BoxDecoration(
            color: CupertinoColors.systemBackground.resolveFrom(context),
            border: Border.symmetric(
                horizontal: BorderSide(
              width: 0.4,
              color: CupertinoColors.separator.resolveFrom(context),
            )),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              CupertinoReadOnlyInput(
                labelText: I.of(context).script,
                value: templateBase.script.type.value.value,
                onTap: () {},
              ),
              Row(
                children: [
                  const Text('过滤器未改变时禁用', style: TextStyle(fontSize: 15)),
                  const Expanded(child: SizedBox()),
                  Transform.scale(
                    alignment: Alignment.centerRight,
                    scale: 0.8,
                    child: CupertinoObxSwitch(
                      value: templateBase.disableUnchanged,
                      scale: 0.8,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 30),
          child: Text(
            I.of(context).filter,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: CupertinoColors.systemBackground.resolveFrom(context),
            border: Border.symmetric(
                horizontal: BorderSide(
              width: 0.4,
              color: CupertinoColors.separator.resolveFrom(context),
            )),
          ),
          child: Column(
            children: [
              ColoredBox(
                color: CupertinoColors.systemGroupedBackground
                    .resolveFrom(context),
                child: Obx(() => Column(
                      children: templateBase.filters.asMap().entries.map((e) {
                        return CupertinoDeletableTile(
                            index: e.key,
                            controller: filterController,
                            text: '${e.value.name} - ${e.value.key}',
                            onDelete: (index) {
                              templateBase.filters.removeAt(index);
                            },
                            onTap: () => _editFilter(context, e.value));
                      }).toList(),
                    )),
              ),
              CupertinoClassicalListTile(
                icon: Icon(
                  CupertinoIcons.add_circled_solid,
                  color: CupertinoColors.systemGreen.resolveFrom(context),
                ),
                text: I.of(context).add,
                onTap: () {
                  templateBase.filters.add(TemplateListFilterItem());
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<TemplateListFilterItem> _editFilter(
      BuildContext context, TemplateListFilterItem field) async {
    var colorString = field.color.hex;
    await showCupertinoDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            actions: [
              CupertinoButton(
                child: Text(I.of(context).positive),
                onPressed: () => Get.back(),
              )
            ],
            content: Column(
              children: [
                CupertinoInput(
                  labelText: I.of(context).name,
                  value: field.name,
                ),
                CupertinoInput(
                  labelText: I.of(context).key,
                  value: field.key,
                ),
                CupertinoReadOnlyInput(
                  labelText: I.of(context).type,
                  value: field.type.value.value,
                  onTap: () => showCupertinoSelectDialog<FilterType>(
                    context: context,
                    items: FilterType.values
                        .map((e) => SelectTileItem(
                              title: e.value,
                              value: e,
                            ))
                        .toList(),
                    cancelText: I.of(context).negative,
                  ).then((value) {
                    if (value != null) {
                      field.type.value = value;
                    }
                  }),
                ),
                if (field.type.value == FilterType.boolCard)
                  StatefulBuilder(
                    builder: (context, setState) {
                      return CupertinoInput(
                        labelText: I.of(context).color,
                        value: ''.obs,
                        prefix: Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Container(
                            height: 15,
                            width: 15,
                            decoration: BoxDecoration(
                              color: parseColorString(colorString),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                CupertinoInput(
                  labelText: I.of(context).default_value,
                  value: field.value,
                ),
              ],
            ),
          );
        });
    return field;
  }
}
