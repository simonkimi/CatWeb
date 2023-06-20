import 'package:catweb/data/models/site_model/parser/selector.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_parser/parser/selector_editor.dart';
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
    this.onChanged,
    this.onlySelector = false,
    this.onExtraChanged,
  }) : super(key: key);

  final String title;
  final Selector selector;
  final Function(Selector)? onChanged;
  final Function(ExtraSelector)? onExtraChanged;
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
            onChanged: onChanged,
            selector: selector,
            title: title,
          ),
        );
      },
      trailing: selector.isEmpty()
          ? const Icon(
              CupertinoIcons.add,
              size: 18,
              color: CupertinoColors.inactiveGray,
            )
          : Icon(
              Icons.edit,
              size: 18,
              color: CupertinoColors.activeGreen.resolveFrom(context),
            ),
    );
  }
}

class ExtraParserTile extends StatelessWidget {
  ExtraParserTile({
    Key? key,
    required this.title,
    required ExtraSelector selector,
    this.onlySelector = false,
    this.onChanged,
  })  : rxSelector = selector.obs,
        super(key: key);

  final String title;

  final Function(ExtraSelector)? onChanged;
  final bool onlySelector;

  final Rx<ExtraSelector> rxSelector;

  @override
  Widget build(BuildContext context) {
    return SettingTile(
      title: title,
      onTap: () {
        showCupertinoModalSheet(
          context: context,
          builder: (context) => SelectorEditor(
            onlySelector: onlySelector,
            onChanged: (selector) {
              rxSelector(rxSelector.value.copyWith(selector: selector));
              onChanged?.call(rxSelector.value);
            },
            onExtraChanged: (extra) {
              rxSelector(extra);
              onChanged?.call(rxSelector.value);
            },
            selector: rxSelector.value.selector,
            title: title,
          ),
        );
      },
      trailing: rxSelector.value.selector.isEmpty()
          ? const Icon(
              CupertinoIcons.add,
              size: 18,
              color: CupertinoColors.inactiveGray,
            )
          : Icon(
              Icons.edit,
              size: 18,
              color: CupertinoColors.activeGreen.resolveFrom(context),
            ),
    );
  }
}
