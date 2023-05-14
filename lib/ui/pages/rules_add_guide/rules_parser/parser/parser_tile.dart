import 'package:catweb/data/models/site_model/parser/selector.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_parser/parser/selector_editor.dart';
import 'package:catweb/ui/pages/setting_page/widgets/setting_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ParserTile extends StatelessWidget {
  const ParserTile({
    Key? key,
    required this.title,
    required this.selector,
    this.onChanged,
    this.onlySelector = false,
  }) : super(key: key);

  final String title;
  final Selector selector;
  final Function(Selector)? onChanged;
  final bool onlySelector;

  @override
  Widget build(BuildContext context) {
    return SettingTile(
      title: title,
      onTap: () {
        showCupertinoModalBottomSheet(
          context: context,
          expand: true,
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
