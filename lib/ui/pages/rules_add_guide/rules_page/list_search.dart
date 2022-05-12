import 'package:catweb/data/protocol/model/page.dart';
import 'package:catweb/data/protocol/model/templete.dart';
import 'package:catweb/gen/protobuf/template.pbenum.dart';
import 'package:catweb/i18n.dart';
import 'package:catweb/ui/widgets/cupertino_deletable_tile.dart';
import 'package:catweb/ui/widgets/cupertino_input.dart';
import 'package:catweb/ui/widgets/dialog.dart';
import 'package:catweb/ui/pages/javascript_editor/editor.dart';
import 'package:catweb/ui/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_swipe_action_cell/core/controller.dart';
import 'package:get/get.dart';

class ListFilterEditor extends StatelessWidget {
  const ListFilterEditor({
    super.key,
    required this.model,
  });

  final PageBlueprintModel model;

  @override
  Widget build(BuildContext context) {
    final filterController = SwipeActionController();
    final extra = model.templateData as TemplateListDataModel;

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
              Obx(() => CupertinoReadOnlyInput(
                    labelText: I.of(context).script,
                    value: extra.script.value,
                    onTap: () =>
                        Get.to(() => JavaScriptEditor(script: extra.script)),
                  )),
              Row(
                children: [
                  const Text('过滤器未改变时禁用', style: TextStyle(fontSize: 15)),
                  const Expanded(child: SizedBox()),
                  Transform.scale(
                    alignment: Alignment.centerRight,
                    scale: 0.8,
                    child: Obx(() => CupertinoSwitch(
                          value: extra.disableUnchanged.value,
                          onChanged: (value) =>
                              extra.disableUnchanged.value = value,
                        )),
                  ),
                ],
              ),
              const SizedBox(height: 5),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.only(left: 20),
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
                      children: extra.filterItem.asMap().entries.map((e) {
                        return Obx(
                          () => CupertinoDeletableTile(
                              index: e.key,
                              controller: filterController,
                              text:
                                  '${e.value.name.value} - ${e.value.key.value}',
                              onDelete: (index) {
                                extra.filterItem.removeAt(index);
                              },
                              onTap: () => _editFilter(context, e.value)),
                        );
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
                  extra.filterItem.add(SearchFilterItem());
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _editFilter(BuildContext context, SearchFilterItem field) async {
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
                Obx(() => CupertinoReadOnlyInput(
                      labelText: I.of(context).type,
                      value: field.type.value.string(context),
                      onTap: () => showCupertinoSelectDialog<
                          TemplateListData_FilterType>(
                        context: context,
                        items: TemplateListData_FilterType.values
                            .map((e) => SelectTileItem(
                                  title: e.string(context),
                                  value: e,
                                ))
                            .toList(),
                        cancelText: I.of(context).negative,
                      ).then((value) {
                        if (value != null) {
                          field.type.value = value;
                        }
                      }),
                    )),
                Obx(() {
                  if (field.type.value ==
                      TemplateListData_FilterType.FILTER_TYPE_BOOL_CARD) {
                    return CupertinoInput(
                      labelText: I.of(context).color,
                      value: field.color,
                      prefix: Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Obx(() => Container(
                              height: 15,
                              width: 15,
                              decoration: BoxDecoration(
                                color: parseColorString(field.color.value),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            )),
                      ),
                    );
                  }
                  return const SizedBox();
                }),
                CupertinoInput(
                  labelText: I.of(context).default_value,
                  value: field.value,
                ),
              ],
            ),
          );
        });
  }
}
