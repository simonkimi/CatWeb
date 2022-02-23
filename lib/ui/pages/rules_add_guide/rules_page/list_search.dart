import 'package:catweb/data/protocol/model/page.dart';
import 'package:catweb/data/protocol/model/templete.dart';
import 'package:catweb/gen/protobuf/template.pbenum.dart';
import 'package:catweb/ui/components/cupertino_deletable_tile.dart';
import 'package:catweb/ui/components/cupertino_input.dart';
import 'package:catweb/ui/components/dialog.dart';
import 'package:catweb/ui/pages/javascript_editor/editor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_swipe_action_cell/core/controller.dart';
import 'package:get/get.dart';

class ListSearchEditor extends StatelessWidget {
  const ListSearchEditor({
    Key? key,
    required this.model,
  }) : super(key: key);

  final PageBlueprint model;

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
                text: '添加',
                onTap: () {
                  extra.filterItem.add(SearchFilterItem());
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: CupertinoColors.systemBackground.resolveFrom(context),
            border: Border.symmetric(
                horizontal: BorderSide(
              width: 0.4,
              color: CupertinoColors.separator.resolveFrom(context),
            )),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Obx(() => CupertinoReadOnlyInput(
                labelText: '脚本',
                value: extra.script.value,
                onTap: () =>
                    Get.to(() => JavaScriptEditor(script: extra.script)),
              )),
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
                child: const Text('确定'),
                onPressed: () => Get.back(),
              )
            ],
            content: Column(
              children: [
                CupertinoInput(
                  labelText: '名称',
                  value: field.name,
                ),
                CupertinoInput(
                  labelText: '键',
                  value: field.key,
                ),
                Obx(() => CupertinoReadOnlyInput(
                      labelText: '类型',
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
                        cancelText: '取消',
                      ).then((value) {
                        if (value != null) {
                          field.type.value = value;
                        }
                      }),
                    )),
                CupertinoInput(
                  labelText: '默认值',
                  value: field.value,
                ),
              ],
            ),
          );
        });
  }
}
