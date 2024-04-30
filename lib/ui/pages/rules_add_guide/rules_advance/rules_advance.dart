import 'package:catweb/data/models/site/field.dart';
import 'package:catweb/i18n.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_editor_notifier.dart';
import 'package:catweb/ui/widgets/cupertino_deletable_tile.dart';
import 'package:catweb/ui/widgets/cupertino_input.dart';
import 'package:catweb/utils/context_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_swipe_action_cell/core/controller.dart';
import 'package:provider/provider.dart';

class RulesAdvance extends StatelessWidget {
  const RulesAdvance({super.key});

  @override
  Widget build(BuildContext context) {
    final headerController = SwipeActionController();
    final cookieController = SwipeActionController();
    final notifier = context.read<RulesEditorNotifier>();

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
              Selector<RulesEditorNotifier, List<RegField>>(
                selector: (_, notifier) => notifier.blueprint.headers,
                builder: (_, value, __) {
                  return Column(
                    children: value.asMap().entries.map((e) {
                      return CupertinoDeletableTile(
                        index: e.key,
                        controller: headerController,
                        text: '${e.value.reg}: ${e.value.value}',
                        onDelete: (index) {
                          notifier.removeHeader(index);
                        },
                        onTap: () async {
                          var newReg = await _editRegField(context, e.value);
                          notifier.updateHeader(e.key, newReg);
                        },
                      );
                    }).toList(),
                  );
                },
              ),
              CupertinoClassicalListTile(
                icon: Icon(
                  CupertinoIcons.add_circled_solid,
                  color: CupertinoColors.systemGreen.resolveFrom(context),
                ),
                text: I.of(context).add,
                onTap: () {
                  notifier.addHeader(const RegField(reg: '*', value: ''));
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
              Selector<RulesEditorNotifier, List<RegField>>(
                selector: (_, notifier) => notifier.blueprint.cookies,
                builder: (_, value, __) {
                  return Column(
                    children: value.asMap().entries.map((e) {
                      return CupertinoDeletableTile(
                        index: e.key,
                        controller: cookieController,
                        text: '${e.value.reg}: ${e.value.value}',
                        onDelete: (index) {
                          notifier.removeCookie(index);
                        },
                        onTap: () async {
                          var newReg = await _editRegField(context, e.value);
                          notifier.updateCookie(e.key, newReg);
                        },
                      );
                    }).toList(),
                  );
                },
              ),
              CupertinoClassicalListTile(
                icon: Icon(
                  CupertinoIcons.add_circled_solid,
                  color: CupertinoColors.systemGreen.resolveFrom(context),
                ),
                text: I.of(context).add,
                onTap: () {
                  notifier.addCookie(const RegField(reg: '*', value: ''));
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<RegField> _editRegField(BuildContext context, RegField field) async {
    final reg = ValueNotifier(field.reg);
    final value = ValueNotifier(field.value);

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
              TripleVnTextField(
                labelText: I.of(context).reg,
                value: reg,
              ),
              TripleVnTextField(
                labelText: I.of(context).content,
                value: value,
              ),
            ],
          ),
        );
      },
    );
    reg.dispose();
    value.dispose();
    return field;
  }

  Widget _buildSubTitle(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          color: CupertinoColors.secondaryLabel.resolveFrom(context),
        ),
      ),
    );
  }
}
