import 'package:catweb/data/models/site_model/pages/subpage.dart';
import 'package:catweb/data/models/site_model/pages/template_list.dart';
import 'package:catweb/i18n.dart';
import 'package:catweb/ui/widgets/cupertino_deletable_tile.dart';
import 'package:catweb/ui/widgets/cupertino_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_swipe_action_cell/core/controller.dart';
import 'package:get/get.dart';

class ListNormalSubPage extends StatelessWidget {
  const ListNormalSubPage({
    super.key,
    required this.templateBase,
  });

  final TemplateList templateBase;

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
              )),
            ),
            child: Obx(() => Column(
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
                CupertinoClassicalListTile(
                  icon: Icon(
                    CupertinoIcons.add_circled_solid,
                    color: CupertinoColors.systemGreen.resolveFrom(context),
                  ),
                  text: I.of(context).add,
                  onTap: () {
                    templateBase.subPages.add(TemplateListSubPage());
                  },
                ),
              ],
            )),
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
                ),
                CupertinoInput(
                  labelText: I.of(context).key,
                  value: field.key,
                ),
                CupertinoInput(
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
