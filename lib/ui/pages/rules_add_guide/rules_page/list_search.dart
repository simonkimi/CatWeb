import 'package:catweb/data/models/site/field.dart';
import 'package:catweb/data/models/site/subpage.dart';
import 'package:catweb/i18n.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_page/site_page_notifier.dart';
import 'package:catweb/ui/widgets/cupertino_deletable_tile.dart';
import 'package:catweb/ui/widgets/cupertino_input.dart';
import 'package:catweb/ui/widgets/dialog.dart';
import 'package:catweb/ui/widgets/notifier_selector.dart';
import 'package:catweb/utils/context_helper.dart';
import 'package:catweb/utils/obs_helper.dart';
import 'package:catweb/utils/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_swipe_action_cell/core/controller.dart';
import 'package:provider/provider.dart';

class ListFilterEditor extends StatelessWidget {
  const ListFilterEditor({super.key});

  @override
  Widget build(BuildContext context) {
    final filterController = SwipeActionController();
    final notifier = context.read<SitePageNotifier>();

    return ListView(
      children: [
        Selector<SitePageNotifier, ScriptField>(
          selector: (_, n) => n.templateList.script,
          builder: (_, script, __) {
            return TripleReadonlyTextField(
              labelText: I.of(context).script,
              value: script.toString(),
              onTap: () {},
            );
          },
        ),
        Row(
          children: [
            const Text('过滤器未改变时禁用', style: TextStyle(fontSize: 15)),
            const Expanded(child: SizedBox()),
            NotifierSwitchField<SitePageNotifier>(
              selector: (n) => n.templateList.disableUnchanged,
              scale: 0.8,
              save: (n) => n.updateListTemplateDisableUnchanged,
            ),
          ],
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 30),
          child: Text(
            I.of(context).filter,
            style: const TextStyle(fontSize: 14),
          ),
        ),
        Selector<SitePageNotifier, List<TemplateListFilterItem>>(
          selector: (_, n) => n.templateList.filters,
          builder: (_, filters, __) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (final MapEntry(:key, :value) in filters.asMap().entries)
                  CupertinoDeletableTile(
                    index: key,
                    controller: filterController,
                    text: '${value.name} - ${value.key}',
                    onDelete: (index) {
                      notifier.removeListTemplateFilter(key);
                    },
                    onTap: () async {
                      var result = await _editFilter(context, value);
                      if (result == null) return;
                      notifier.updateListTemplateFilter(key, result);
                    },
                  ),
              ],
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
            notifier.addListTemplateFilter();
          },
        ),
      ],
    );
  }

  Future<TemplateListFilterItem?> _editFilter(
    BuildContext context,
    TemplateListFilterItem field,
  ) async {
    final nameNotifier = field.name.obs;
    final keyNotifier = field.key.obs;
    final valueNotifier = field.value.obs;
    final typeNotifier = field.type.obs;

    final result = await showCupertinoDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          actions: [
            CupertinoDialogAction(
              child: Text(I.of(context).save),
              onPressed: () => context.pop(true),
            ),
            CupertinoDialogAction(
              isDestructiveAction: true,
              onPressed: () => context.pop(false),
              child: Text(I.of(context).negative),
            ),
          ],
          content: Column(
            children: [
              TripleVnTextField(
                labelText: I.of(context).name,
                value: nameNotifier,
              ),
              TripleVnTextField(
                labelText: I.of(context).key,
                value: keyNotifier,
              ),
              typeNotifier.obx((type) {
                return TripleReadonlyTextField(
                  labelText: I.of(context).type,
                  value: type.getDescription(context),
                  onTap: () => showCupertinoSelectDialog<FilterType>(
                    context: context,
                    items: FilterType.values.map((e) {
                      return SelectTileItem(
                        title: e.getDescription(context),
                        value: e,
                      );
                    }).toList(),
                    cancelText: I.of(context).negative,
                  ).then((value) {
                    if (value != null) {
                      typeNotifier.value = value;
                    }
                  }),
                );
              }),
              TripleVnTextField(
                labelText: I.of(context).default_value,
                value: valueNotifier,
              ),
            ],
          ),
        );
      },
    );

    nameNotifier.dispose();
    keyNotifier.dispose();
    valueNotifier.dispose();
    typeNotifier.dispose();

    if (result != true) {
      return null;
    }

    return TemplateListFilterItem(
      name: nameNotifier.value,
      key: keyNotifier.value,
      value: valueNotifier.value,
      type: typeNotifier.value,
    );
  }
}
