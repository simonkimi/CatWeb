import 'package:catweb/data/models/site_model/parser/selector.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_parser/selector_editor.dart';
import 'package:catweb/ui/pages/setting_page/widgets/setting_tile.dart';
import 'package:cupertino_modal_sheet/cupertino_modal_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ParserTile extends StatelessWidget {
  const ParserTile({
    Key? key,
    required this.title,
    required this.selector,
    this.onlySelector = false,
  }) : super(key: key);

  final String title;
  final Selector selector;
  final bool onlySelector;

  @override
  Widget build(BuildContext context) {
    return SettingTile(
      title: title,
      onTap: () {
        showCupertinoModalSheet(
          context: context,
          builder: (context) => SelectorEditor(
            onlySelector: onlySelector,
            selector: selector,
            title: title,
          ),
        );
      },
      trailing: Obx(() => selector.isEmpty
          ? const Icon(
              CupertinoIcons.add,
              size: 18,
              color: CupertinoColors.inactiveGray,
            )
          : Icon(
              Icons.edit,
              size: 18,
              color: CupertinoColors.activeGreen.resolveFrom(context),
            )),
    );
  }
}

class ExtraParserTile extends StatelessWidget {
  const ExtraParserTile({
    Key? key,
    required this.title,
    required this.extraSelector,
    this.onlySelector = false,
  }) : super(key: key);

  final String title;

  final bool onlySelector;

  final ExtraSelector extraSelector;

  @override
  Widget build(BuildContext context) {
    return SettingTile(
      title: title,
      onTap: () {
        showCupertinoModalSheet(
          context: context,
          builder: (context) => SelectorEditor(
            onlySelector: onlySelector,
            selector: extraSelector.selector,
            title: title,
          ),
        );
      },
      trailing: Obx(() => extraSelector.selector.isEmpty
          ? const Icon(
              CupertinoIcons.add,
              size: 18,
              color: CupertinoColors.inactiveGray,
            )
          : Icon(
              Icons.edit,
              size: 18,
              color: CupertinoColors.activeGreen.resolveFrom(context),
            )),
    );
  }
}
