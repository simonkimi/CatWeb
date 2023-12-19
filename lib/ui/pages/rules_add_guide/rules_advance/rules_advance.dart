import 'package:catweb/data/models/site_model/parser/field.dart';
import 'package:catweb/data/models/site_model/site_blue_map.dart';
import 'package:catweb/i18n.dart';
import 'package:catweb/ui/widgets/cupertino_deletable_tile.dart';
import 'package:catweb/ui/widgets/cupertino_input.dart';
import 'package:catweb/ui/pages/rules_add_guide/controller/rules_edit_controller.dart';
import 'package:catweb/utils/context_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_swipe_action_cell/core/controller.dart';

class RulesAdvance extends StatelessWidget {
  const RulesAdvance(
    this.controller, {
    super.key,
  });

  final RulesEditController controller;

  SiteBlueMap get model => controller.blueprint;

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
              ListenableBuilder(
                  listenable: model.headers,
                  builder: (context, child) {
                    return Column(
                      children: model.headers.asMap().entries.map((e) {
                        return CupertinoDeletableTile(
                            index: e.key,
                            controller: headerController,
                            text: '${e.value.reg}: ${e.value.value}',
                            onDelete: (index) {
                              model.headers.removeAt(index);
                            },
                            onTap: () async {
                              var newReg =
                                  await _editRegField(context, e.value);
                              model.headers[e.key] = newReg;
                            });
                      }).toList(),
                    );
                  }),
              CupertinoClassicalListTile(
                icon: Icon(
                  CupertinoIcons.add_circled_solid,
                  color: CupertinoColors.systemGreen.resolveFrom(context),
                ),
                text: I.of(context).add,
                onTap: () {
                  model.headers.add(RegField(reg: '*', value: ''));
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
              ListenableBuilder(
                  listenable: model.cookies,
                  builder: (context, child) {
                    return Column(
                      children: model.cookies.asMap().entries.map((e) {
                        return CupertinoDeletableTile(
                            index: e.key,
                            controller: cookieController,
                            text:
                                '${e.value.reg.value.isEmpty ? '*' : e.value.reg}: ${e.value.value}',
                            onDelete: (index) {
                              model.cookies.removeAt(index);
                            },
                            onTap: () async {
                              var newReg =
                                  await _editRegField(context, e.value);
                              model.cookies[e.key] = newReg;
                            });
                      }).toList(),
                    );
                  }),
              CupertinoClassicalListTile(
                icon: Icon(
                  CupertinoIcons.add_circled_solid,
                  color: CupertinoColors.systemGreen.resolveFrom(context),
                ),
                text: I.of(context).add,
                onTap: () {
                  model.cookies.add(RegField(reg: '*', value: ''));
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
                onPressed: () => context.pop(),
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
