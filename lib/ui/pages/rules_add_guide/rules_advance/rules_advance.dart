import 'package:catweb/data/protocol/model/store.dart';
import 'package:catweb/gen/protobuf/store.pbserver.dart';
import 'package:catweb/i18n.dart';
import 'package:catweb/ui/widgets/cupertino_deletable_tile.dart';
import 'package:catweb/ui/widgets/cupertino_input.dart';
import 'package:catweb/ui/pages/rules_add_guide/controller/rules_edit_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_swipe_action_cell/core/controller.dart';
import 'package:get/get.dart';

class RulesAdvance extends GetView<RulesEditController> {
  const RulesAdvance({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final headerController = SwipeActionController();
    final cookieController = SwipeActionController();
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 10),
      children: [
        _buildSubTitle(context, 'Headers'),
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
                    children:
                        controller.blueprint.headers.asMap().entries.map((e) {
                      return Obx(() => CupertinoDeletableTile(
                          index: e.key,
                          controller: headerController,
                          text: '${e.value.reg}: ${e.value.value}',
                          onDelete: (index) {
                            controller.blueprint.headers.removeAt(index);
                          },
                          onTap: () => _editRegField(context, e.value)));
                    }).toList(),
                  )),
              CupertinoClassicalListTile(
                icon: Icon(
                  CupertinoIcons.add_circled_solid,
                  color: CupertinoColors.systemGreen.resolveFrom(context),
                ),
                text: I.of(context).add,
                onTap: () {
                  controller.blueprint.headers.add(
                    RegFieldModel(RegField(reg: '*', value: '')),
                  );
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        _buildSubTitle(context, 'Cookies'),
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
                    children:
                        controller.blueprint.cookies.asMap().entries.map((e) {
                      return Obx(() => CupertinoDeletableTile(
                          index: e.key,
                          controller: cookieController,
                          text:
                              '${e.value.reg.isEmpty ? '*' : e.value.reg}: ${e.value.value}',
                          onDelete: (index) {
                            controller.blueprint.cookies.removeAt(index);
                          },
                          onTap: () => _editRegField(context, e.value)));
                    }).toList(),
                  )),
              CupertinoClassicalListTile(
                icon: Icon(
                  CupertinoIcons.add_circled_solid,
                  color: CupertinoColors.systemGreen.resolveFrom(context),
                ),
                text: I.of(context).add,
                onTap: () {
                  controller.blueprint.cookies.add(
                    RegFieldModel(RegField(reg: '', value: '')),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _editRegField(BuildContext context, RegFieldModel field) async {
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
                  labelText: I.of(context).reg,
                  value: field.reg,
                ),
                CupertinoInput(
                  labelText: I.of(context).content,
                  value: field.value,
                ),
              ],
            ),
          );
        });
  }

  Widget _buildSubTitle(BuildContext context, String text) {
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
