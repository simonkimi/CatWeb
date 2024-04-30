import 'package:catweb/data/models/site/subpage.dart';
import 'package:catweb/i18n.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_page/site_page_notifier.dart';
import 'package:catweb/ui/widgets/cupertino_deletable_tile.dart';
import 'package:catweb/ui/widgets/cupertino_input.dart';
import 'package:catweb/utils/context_helper.dart';
import 'package:catweb/utils/obs_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_swipe_action_cell/core/controller.dart';
import 'package:provider/provider.dart';

class ListNormalSubPage extends StatelessWidget {
  const ListNormalSubPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cookieController = SwipeActionController();

    final notifier = context.watch<SitePageNotifier>();

    return Selector<SitePageNotifier, List<TemplateListSubPage>>(
      selector: (_, n) => n.templateList.subPages,
      builder: (_, subpage, child) {
        return Column(
          children: [
            for (final MapEntry(:key, :value) in subpage.asMap().entries)
              CupertinoDeletableTile(
                index: key,
                controller: cookieController,
                text: '${value.name} - { ${value.key}: ${value.value} }',
                onDelete: (_) {
                  notifier.removeListTemplate(key);
                },
                onTap: () async {
                  final result = await _editSubPage(context, value);
                  if (result == null) return;
                  notifier.updateListTemplateSubpage(key, result);
                },
              ),
            child!,
          ],
        );
      },
      child: CupertinoClassicalListTile(
        icon: Icon(
          CupertinoIcons.add_circled_solid,
          color: CupertinoColors.systemGreen.resolveFrom(context),
        ),
        text: I.of(context).add,
        onTap: () {
          notifier.addListTemplate();
        },
      ),
    );
  }

  Future<TemplateListSubPage?> _editSubPage(
      BuildContext context, TemplateListSubPage field) async {
    final name = field.name.obs;
    final key = field.key.obs;
    final value = field.value.obs;

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
              child: Text(I.of(context).cancel),
            ),
          ],
          content: Column(
            children: [
              TripleVnTextField(
                labelText: I.of(context).name,
                value: name,
              ),
              TripleVnTextField(
                labelText: I.of(context).key,
                value: key,
              ),
              TripleVnTextField(
                labelText: I.of(context).value,
                value: value,
              ),
            ],
          ),
        );
      },
    );

    name.dispose();
    key.dispose();
    value.dispose();

    if (result != true) {
      return null;
    }
    return TemplateListSubPage(
      name: name.value,
      key: key.value,
      value: value.value,
    );
  }
}
