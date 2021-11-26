import 'package:catweb/data/protocol/model/store.dart';
import 'package:catweb/gen/protobuf/store.pbserver.dart';
import 'package:catweb/ui/components/cupertino_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:flutter_swipe_action_cell/core/controller.dart';
import 'package:get/get.dart';

class RulesAdvance extends StatelessWidget {
  RulesAdvance({
    Key? key,
    required this.model,
  }) : super(key: key);

  final RulesProtocolModel model;

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
                      children: model.headers.asMap().entries.map((e) {
                        return Obx(() => buildDeletableItem(
                            index: e.key,
                            context: context,
                            controller: headerController,
                            text: '${e.value.reg}: ${e.value.value}',
                            onDelete: (index) {
                              model.headers.removeAt(index);
                            },
                            onTap: () => editRegField(context, e.value)));
                      }).toList(),
                    )),
                buildAddItem(
                  context: context,
                  onTap: () {
                    model.headers.add(
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
                      children: model.cookies.asMap().entries.map((e) {
                        return Obx(() => buildDeletableItem(
                            index: e.key,
                            context: context,
                            controller: cookieController,
                            text:
                                '${e.value.reg.isEmpty ? '*' : e.value.reg}: ${e.value.value}',
                            onDelete: (index) {
                              model.cookies.removeAt(index);
                            },
                            onTap: () => editRegField(context, e.value)));
                      }).toList(),
                    )),
                buildAddItem(
                  context: context,
                  onTap: () {
                    model.cookies.add(
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
                onPressed: () => Navigator.of(context).pop(),
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

  Widget buildAddItem({
    required BuildContext context,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: buildListBody(
        padding: 15,
        icon: Icon(
          CupertinoIcons.add_circled_solid,
          color: CupertinoColors.activeGreen.resolveFrom(context),
        ),
        body: const Text('添加'),
      ),
    );
  }

  Widget buildListBody({
    required Widget icon,
    required Widget body,
    double? padding,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          SizedBox(width: padding ?? 10),
          icon,
          const SizedBox(width: 10),
          Expanded(child: body),
        ],
      ),
    );
  }

  Widget buildDeletableItem({
    required BuildContext context,
    required SwipeActionController controller,
    required int index,
    required String text,
    required ValueChanged<int> onDelete,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 0.4,
              color: CupertinoColors.separator.resolveFrom(context),
            ),
          ),
        ),
        child: SwipeActionCell(
          key: UniqueKey(),
          controller: controller,
          index: index,
          child: buildListBody(
            padding: 15,
            icon: CupertinoButton(
              padding: EdgeInsets.zero,
              minSize: 0,
              child: Icon(
                CupertinoIcons.minus_circle_fill,
                color: CupertinoColors.systemRed.resolveFrom(context),
              ),
              onPressed: () {
                controller.openCellAt(
                  index: index,
                  trailing: true,
                );
              },
            ),
            body: Text(
              text,
              style: const TextStyle(fontSize: 15),
            ),
          ),
          trailingActions: <SwipeAction>[
            SwipeAction(
              widthSpace: 50,
              closeOnTap: true,
              icon: const Icon(
                CupertinoIcons.delete,
                color: CupertinoColors.white,
                size: 18,
              ),
              onTap: (CompletionHandler handler) async {
                await handler(true);
                onDelete(index);
              },
              color: CupertinoColors.systemRed.resolveFrom(context),
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
