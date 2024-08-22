import 'package:catweb/data/models/site/field.dart';
import 'package:catweb/i18n.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_editor_notifier.dart';
import 'package:catweb/ui/widgets/cupertino_deletable_tile.dart';
import 'package:catweb/ui/widgets/cupertino_input.dart';
import 'package:catweb/utils/context_helper.dart';
import 'package:catweb/utils/hook_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_swipe_action_cell/core/controller.dart';
import 'package:provider/provider.dart';

class RulesAdvance extends HookWidget {
  const RulesAdvance({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = context.read<RulesEditorNotifier>();

    final cookieController = useSwipeActionController();
    final headerController = useSwipeActionController();

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
              _buildRegFieldList(context, headerController),
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
              _buildCookieList(context, cookieController),
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

  Widget _buildRegFieldList(
      BuildContext context, SwipeActionController controller) {
    final notifier = context.read<RulesEditorNotifier>();
    final headers = context.select(
      (RulesEditorNotifier notifier) => notifier.blueprint.headers,
    );

    return Column(
      children: headers.asMap().entries.map((e) {
        return CupertinoDeletableTile(
          index: e.key,
          controller: controller,
          text: '${e.value.reg}: ${e.value.value}',
          onDelete: (index) {
            notifier.removeHeader(index);
          },
          onTap: () async {
            var newReg = await _editRegField(context, e.value);
            if (newReg == null) return;
            notifier.updateHeader(e.key, newReg);
          },
        );
      }).toList(),
    );
  }

  Widget _buildCookieList(
    BuildContext context,
    SwipeActionController controller,
  ) {
    final notifier = context.read<RulesEditorNotifier>();
    final cookies = context.select(
      (RulesEditorNotifier notifier) => notifier.blueprint.cookies,
    );

    return Column(
      children: cookies.asMap().entries.map((e) {
        return CupertinoDeletableTile(
          index: e.key,
          controller: controller,
          text: '${e.value.reg}: ${e.value.value}',
          onDelete: (index) {
            notifier.removeCookie(index);
          },
          onTap: () async {
            var newReg = await _editRegField(context, e.value);
            if (newReg == null) return;
            notifier.updateCookie(e.key, newReg);
          },
        );
      }).toList(),
    );
  }

  Future<RegField?> _editRegField(BuildContext context, RegField field) async {
    return await showCupertinoDialog<RegField?>(
      barrierDismissible: true,
      context: context,
      builder: (context) => const RegFieldDialog(),
    );
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

class RegFieldDialog extends HookWidget {
  const RegFieldDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final regController = useTextEditingController();
    final valueController = useTextEditingController();

    return CupertinoAlertDialog(
      actions: [
        CupertinoButton(
          child: Text(I.of(context).cancel),
          onPressed: () => context.pop(),
        ),
        CupertinoButton(
          child: Text(I.of(context).positive),
          onPressed: () => context.pop(RegField(
            reg: regController.text,
            value: valueController.text,
          )),
        )
      ],
      content: Column(
        children: [
          TripleTextField(
            labelText: I.of(context).reg,
            controller: regController,
          ),
          TripleTextField(
            labelText: I.of(context).content,
            controller: valueController,
          ),
        ],
      ),
    );
  }
}
