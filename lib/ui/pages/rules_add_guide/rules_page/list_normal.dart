import 'package:catweb/i18n.dart';
import 'package:catweb/ui/widgets/cupertino_deletable_tile.dart';
import 'package:catweb/ui/widgets/cupertino_input.dart';
import 'package:catweb/utils/context_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_swipe_action_cell/core/controller.dart';

class ListNormalSubPage extends StatelessWidget {
  const ListNormalSubPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cookieController = SwipeActionController();

    return ColoredBox(
      color: CupertinoColors.systemGroupedBackground.resolveFrom(context),
      child: ListView(
        children: [
          Container(
            decoration: BoxDecoration(





























              color: CupertinoColors.systemBackground.resolveFrom(context),
              border: Border.symmetric(
                horizontal: BorderSide(
                  width: 0.4,
                  color: CupertinoColors.separator.resolveFrom(context),
                ),
              ),
            ),
            child: ListenableBuilder(
              listenable: templateBase.subPages,
              child: CupertinoClassicalListTile(
                icon: Icon(
                  CupertinoIcons.add_circled_solid,
                  color: CupertinoColors.systemGreen.resolveFrom(context),
                ),
                text: I.of(context).add,
                onTap: () {
                  templateBase.subPages.add(TemplateListSubPage());
                },
              ),
              builder: (context, child) {
                return Column(
                  children: [
                    ...templateBase.subPages.asMap().entries.map((e) {
                      return CupertinoDeletableTile(
                          index: e.key,
                          controller: cookieController,
                          text:
                              '${e.value.name} - { ${e.value.key}: ${e.value.value} }',
                          onDelete: (index) {
                            templateBase.subPages.removeAt(index);
                          },
                          onTap: () async {
                            await _editSubPage(context, e.value);
                          });
                    }),
                    child!,
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Future<TemplateListSubPage> _editSubPage(
    BuildContext context,
    TemplateListSubPage field,
  ) async {
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
                CupertinoVnTextInput(
                  labelText: I.of(context).name,
                  value: field.name,
                ),
                CupertinoVnTextInput(
                  labelText: I.of(context).key,
                  value: field.key,
                ),
                CupertinoVnTextInput(
                  labelText: I.of(context).value,
                  value: field.value,
                ),
              ],
            ),
          );
        });
    return field;
  }
}
