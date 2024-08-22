import 'package:catweb/data/models/site/subpage.dart';
import 'package:catweb/i18n.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_page/site_page_notifier.dart';
import 'package:catweb/ui/widgets/cupertino_deletable_tile.dart';
import 'package:catweb/ui/widgets/cupertino_input.dart';
import 'package:catweb/utils/context_helper.dart';
import 'package:catweb/utils/hook_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

class ListNormalSubPage extends HookWidget {
  const ListNormalSubPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cookieController = useSwipeActionController();

    SitePageNotifier notifier = context.read();
    final subpages =
        context.select((SitePageNotifier n) => n.templateList.subPages);
    return Column(
      children: [
        for (final MapEntry(:key, :value) in subpages.asMap().entries)
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
        CupertinoClassicalListTile(
          icon: Icon(
            CupertinoIcons.add_circled_solid,
            color: CupertinoColors.systemGreen.resolveFrom(context),
          ),
          text: I.of(context).add,
          onTap: () {
            notifier.addListTemplate();
          },
        ),
      ],
    );
  }

  Future<TemplateListSubPage?> _editSubPage(
    BuildContext context,
    TemplateListSubPage field,
  ) async {
    return await showCupertinoDialog<TemplateListSubPage?>(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return SubPageDialog(subPage: field);
      },
    );
  }
}

class SubPageDialog extends HookWidget {
  const SubPageDialog({super.key, required this.subPage});

  final TemplateListSubPage subPage;

  @override
  Widget build(BuildContext context) {
    final nameController = useTextEditingController(text: subPage.name);
    final keyController = useTextEditingController(text: subPage.key);
    final valueController = useTextEditingController(text: subPage.value);

    return CupertinoAlertDialog(
      actions: [
        CupertinoDialogAction(
          child: Text(I.of(context).save),
          onPressed: () => context.pop(
            TemplateListSubPage(
              name: nameController.text,
              key: keyController.text,
              value: valueController.text,
            ),
          ),
        ),
        CupertinoDialogAction(
          isDestructiveAction: true,
          onPressed: () => context.pop(null),
          child: Text(I.of(context).cancel),
        ),
      ],
      content: Column(
        children: [
          TripleTextField(
            labelText: I.of(context).name,
            controller: nameController,
          ),
          TripleTextField(
            labelText: I.of(context).key,
            controller: keyController,
          ),
          TripleTextField(
            labelText: I.of(context).value,
            controller: valueController,
          ),
        ],
      ),
    );
  }
}
