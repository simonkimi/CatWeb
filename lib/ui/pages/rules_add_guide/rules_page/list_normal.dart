import 'package:catweb/data/protocol/model/page.dart';
import 'package:catweb/data/protocol/model/templete.dart';
import 'package:catweb/ui/components/cupertino_deletable_tile.dart';
import 'package:catweb/ui/components/cupertino_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_swipe_action_cell/core/controller.dart';
import 'package:get/get.dart';

class ListNormalSubPage extends StatelessWidget {
  const ListNormalSubPage({
    Key? key,
    required this.model,
  }) : super(key: key);

  final PageBlueprint model;

  @override
  Widget build(BuildContext context) {
    final cookieController = SwipeActionController();
    final extra = model.templateData as TemplateListDataModel;
    return ColoredBox(
      color: CupertinoColors.systemGroupedBackground.resolveFrom(context),
      child: ListView(
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
                Obx(() => Column(
                      children: extra.subPages.asMap().entries.map((e) {
                        return Obx(() => CupertinoDeletableTile(
                            index: e.key,
                            controller: cookieController,
                            text:
                                '${e.value.name.value} - { ${e.value.key.value}: ${e.value.value.value} }',
                            onDelete: (index) {
                              extra.subPages.removeAt(index);
                            },
                            onTap: () => _editSubPage(context, e.value)));
                      }).toList(),
                    )),
                CupertinoClassicalListTile(
                  icon: Icon(
                    CupertinoIcons.add_circled_solid,
                    color: CupertinoColors.systemGreen.resolveFrom(context),
                  ),
                  text: '添加',
                  onTap: () {
                    extra.subPages.add(SubPageModel());
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> _editSubPage(BuildContext context, SubPageModel field) =>
      showCupertinoDialog(
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
                  CupertinoInput(
                    labelText: '值',
                    value: field.value,
                  ),
                ],
              ),
            );
          });
}
