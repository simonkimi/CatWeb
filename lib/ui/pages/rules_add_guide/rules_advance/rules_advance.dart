import 'package:catweb/data/models/site_model/fields/field.dart';
import 'package:catweb/i18n.dart';
import 'package:catweb/ui/widgets/cupertino_deletable_tile.dart';
import 'package:catweb/ui/widgets/cupertino_input.dart';
import 'package:catweb/ui/pages/rules_add_guide/controller/rules_edit_controller.dart';
import 'package:catweb/utils/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_swipe_action_cell/core/controller.dart';
import 'package:get/get.dart';

class RulesAdvance extends HookWidget {
  const RulesAdvance({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final headerController = SwipeActionController();
    final cookieController = SwipeActionController();

    final c = Get.find<RulesEditController>();
    final model = useState(c.blueprint);

    useEffect(() {
      return () => c.updateBlueMap(model.value);
    });

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
              Column(
                children: model.value.headers.asMap().entries.map((e) {
                  return Obx(() => CupertinoDeletableTile(
                      index: e.key,
                      controller: headerController,
                      text: '${e.value.reg}: ${e.value.value}',
                      onDelete: (index) {
                        model.value = model.value.copyWith(
                            headers: model.value.headers.exceptAt(index));
                      },
                      onTap: () async {
                        var newReg = await _editRegField(context, e.value);
                        model.value = model.value.copyWith(
                            headers: [...model.value.headers]
                              ..replaceRange(e.key, e.key + 1, [newReg]));
                      }));
                }).toList(),
              ),
              CupertinoClassicalListTile(
                icon: Icon(
                  CupertinoIcons.add_circled_solid,
                  color: CupertinoColors.systemGreen.resolveFrom(context),
                ),
                text: I.of(context).add,
                onTap: () {
                  model.value = model.value.copyWith(headers: [
                    ...model.value.headers,
                    const RegField(reg: '*', value: '')
                  ], cookies: model.value.cookies);
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
              Column(
                children: model.value.cookies.asMap().entries.map((e) {
                  return CupertinoDeletableTile(
                      index: e.key,
                      controller: cookieController,
                      text:
                      '${e.value.reg.isEmpty ? '*' : e.value.reg}: ${e.value.value}',
                      onDelete: (index) {
                        model.value.cookies =
                            model.value.cookies.exceptAt(index);
                      },
                      onTap: () async {
                        var newReg = await _editRegField(context, e.value);
                        model.value.cookies = [...model.value.cookies]
                          ..replaceRange(e.key, e.key + 1, [newReg]);
                      });
                }).toList(),
              ),
              CupertinoClassicalListTile(
                icon: Icon(
                  CupertinoIcons.add_circled_solid,
                  color: CupertinoColors.systemGreen.resolveFrom(context),
                ),
                text: I.of(context).add,
                onTap: () {
                  model.value = model.value.copyWith(cookies: [
                    ...model.value.cookies,
                    const RegField(reg: '*', value: '')
                  ], headers: model.value.headers);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<RegField> _editRegField(BuildContext context, RegField field) async {
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
                  onChanged: (value) {
                    field = field.copyWith(reg: value);
                  },
                ),
                CupertinoInput(
                  labelText: I.of(context).content,
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
