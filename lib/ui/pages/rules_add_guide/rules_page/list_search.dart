import 'package:catweb/data/models/site_model/pages/site_page.dart';
import 'package:catweb/data/models/site_model/pages/template.dart';
import 'package:catweb/i18n.dart';
import 'package:catweb/ui/widgets/cupertino_deletable_tile.dart';
import 'package:catweb/ui/widgets/cupertino_input.dart';
import 'package:catweb/ui/widgets/dialog.dart';
import 'package:catweb/ui/theme/colors.dart';
import 'package:catweb/utils/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_swipe_action_cell/core/controller.dart';
import 'package:get/get.dart';

class ListFilterEditor extends HookWidget {
  const ListFilterEditor({
    super.key,
    required this.model,
  });

  final SitePage model;

  @override
  Widget build(BuildContext context) {
    final filterController = SwipeActionController();
    final template = useState(model.template as TemplateList);

    useEffect(() {
      return () {
        model.template = template.value;
      };
    });

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
                value: template.value.script.script,
                onTap: () {},
              ),
              Row(
                children: [
                  const Text('过滤器未改变时禁用', style: TextStyle(fontSize: 15)),
                  const Expanded(child: SizedBox()),
                  Transform.scale(
                    alignment: Alignment.centerRight,
                    scale: 0.8,
                    child: Obx(() => CupertinoSwitch(
                        value: template.value.disableUnchanged,
                        onChanged: (value) {
                          template.value =
                              template.value.copyWith(disableUnchanged: value);
                        })),
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
                child: Column(
                  children: template.value.filters.asMap().entries.map((e) {
                    return CupertinoDeletableTile(
                        index: e.key,
                        controller: filterController,
                        text: '${e.value.name} - ${e.value.key}',
                        onDelete: (index) {
                          template.value = template.value.copyWith(
                              filters: template.value.filters.exceptAt(index));
                        },
                        onTap: () => _editFilter(context, e.value));
                  }).toList(),
                ),
              ),
              CupertinoClassicalListTile(
                icon: Icon(
                  CupertinoIcons.add_circled_solid,
                  color: CupertinoColors.systemGreen.resolveFrom(context),
                ),
                text: I.of(context).add,
                onTap: () {
                  template.value = template.value.copyWith(filters: [
                    ...template.value.filters,
                    const TemplateListFilterItem()
                  ]);
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
    var colorString = field.color.toString();
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
                  onChanged: (value) {
                    field = field.copyWith(name: value);
                  },
                ),
                CupertinoInput(
                  labelText: I.of(context).key,
                  value: field.key,
                  onChanged: (value) {
                    field = field.copyWith(key: value);
                  },
                ),
                CupertinoReadOnlyInput(
                  labelText: I.of(context).type,
                  value: field.type.value,
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
                      field = field.copyWith(type: value);
                    }
                  }),
                ),
                if (field.type == FilterType.boolCard)
                  StatefulBuilder(
                    builder: (context, setState) {
                      return CupertinoInput(
                        labelText: I.of(context).color,
                        value: colorString,
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
                        onChanged: (String value) {
                          setState(() {
                            colorString = value;
                          });
                        },
                      );
                    },
                  ),
                CupertinoInput(
                  labelText: I.of(context).default_value,
                  value: field.value,
                  onChanged: (value) {
                    field = field.copyWith(value: value);
                  },
                ),
              ],
            ),
          );
        });
    return field;
  }
}
