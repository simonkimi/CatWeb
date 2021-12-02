import 'package:catweb/data/protocol/model/store.dart';
import 'package:catweb/gen/protobuf/store.pbserver.dart';
import 'package:catweb/ui/components/cupertino_deletable_tile.dart';
import 'package:catweb/ui/components/cupertino_input.dart';
import 'package:catweb/ui/pages/rules_manager/rules_edit/rules_edit_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/controller.dart';
import 'package:get/get.dart';

class RulesAdvance extends GetView<RulesEditController> {
  RulesAdvance({
    Key? key,
  }) : super(key: key);

  final headerController = SwipeActionController();
  final cookieController = SwipeActionController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CupertinoColors.systemGroupedBackground.resolveFrom(context),
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 10),
        children: [
          buildSubTitle(context, 'Headers'),
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
                      children: controller.rulesModel.headers
                          .asMap()
                          .entries
                          .map((e) {
                        return Obx(() => CupertinoDeletableTile(
                            index: e.key,
                            controller: headerController,
                            text: '${e.value.reg}: ${e.value.value}',
                            onDelete: (index) {
                              controller.rulesModel.headers.removeAt(index);
                            },
                            onTap: () => editRegField(context, e.value)));
                      }).toList(),
                    )),
                CupertinoClassicalListTile(
                  icon: Icon(
                    CupertinoIcons.add_circled_solid,
                    color: CupertinoColors.activeGreen.resolveFrom(context),
                  ),
                  body: const Text('添加'),
                  onTap: () {
                    controller.rulesModel.headers.add(
                      RegFieldModel(RegField(reg: '*', value: '')),
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          buildSubTitle(context, 'Cookies'),
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
                      children: controller.rulesModel.cookies
                          .asMap()
                          .entries
                          .map((e) {
                        return Obx(() => CupertinoDeletableTile(
                            index: e.key,
                            controller: cookieController,
                            text:
                                '${e.value.reg.isEmpty ? '*' : e.value.reg}: ${e.value.value}',
                            onDelete: (index) {
                              controller.rulesModel.cookies.removeAt(index);
                            },
                            onTap: () => editRegField(context, e.value)));
                      }).toList(),
                    )),
                CupertinoClassicalListTile(
                  icon: Icon(
                    CupertinoIcons.add_circled_solid,
                    color: CupertinoColors.activeGreen.resolveFrom(context),
                  ),
                  body: const Text('添加'),
                  onTap: () {
                    controller.rulesModel.cookies.add(
                      RegFieldModel(RegField(reg: '', value: '')),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> editRegField(BuildContext context, RegFieldModel field) async {
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
                  labelText: '正则',
                  value: field.reg,
                ),
                CupertinoInput(
                  labelText: '内容',
                  value: field.value,
                ),
              ],
            ),
          );
        });
  }

  Widget buildSubTitle(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        text,
        style: TextStyle(
            fontSize: 14,
            color: CupertinoColors.secondaryLabel.resolveFrom(context)),
      ),
    );
  }
}
