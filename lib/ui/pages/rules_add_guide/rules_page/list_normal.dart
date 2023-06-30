import 'package:catweb/data/models/site_model/pages/site_page.dart';
import 'package:catweb/data/models/site_model/pages/template.dart';
import 'package:catweb/i18n.dart';
import 'package:catweb/ui/widgets/cupertino_deletable_tile.dart';
import 'package:catweb/ui/widgets/cupertino_input.dart';
import 'package:catweb/utils/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_swipe_action_cell/core/controller.dart';
import 'package:get/get.dart';

class ListNormalSubPage extends HookWidget {
  const ListNormalSubPage({
    super.key,
    required this.model,
  });

  final SitePage model;

  @override
  Widget build(BuildContext context) {
    final cookieController = SwipeActionController();
    final template = useState(model.template as TemplateList);

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
              )),
            ),
            child: Column(
              children: [
                Column(
                  children: template.value.subPages.asMap().entries.map((e) {
                    return CupertinoDeletableTile(
                        index: e.key,
                        controller: cookieController,
                        text:
                            '${e.value.name} - { ${e.value.key}: ${e.value.value} }',
                        onDelete: (index) {
                          template.value.subPages.removeAt(index);
                        },
                        onTap: () async {
                          final newPage = await _editSubPage(context, e.value);
                          template.value = template.value.copyWith(
                              subPages: template.value.subPages
                                  .replaceAt(e.key, newPage));
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
                    template.value = template.value.copyWith(subPages: [
                      ...template.value.subPages,
                      const TemplateListSubPage()
                    ]);
                  },
                ),
              ],
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
                onPressed: () => Get.back(),
              )
            ],
            content: Column(
              children: [
                CupertinoInput(
                  labelText: I.of(context).name,
                  value: field.name,
                  onChanged: (value) {
                    field = field.copyWith(name: value);
                  },
                ),
                CupertinoInput(
                  labelText: I.of(context).key,
                  value: field.key,
                  onChanged: (value) {
                    field = field.copyWith(key: value);
                  },
                ),
                CupertinoInput(
                  labelText: I.of(context).value,
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
}
