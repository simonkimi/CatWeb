import 'package:catweb/data/models/site/selector.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_parser/parser_notifier.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_parser/selector_editor.dart';
import 'package:catweb/ui/pages/setting_page/widgets/setting_tile.dart';
import 'package:cupertino_modal_sheet/cupertino_modal_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ParserTileConsumer extends StatelessWidget {
  const ParserTileConsumer({
    super.key,
    required this.title,
    required this.selector,
    required this.onChanged,
    this.onlySelector = false,
  });

  final String title;
  final SelectorModel Function(RuleParserNotifier) selector;
  final void Function(RuleParserNotifier, SelectorModel) onChanged;
  final bool onlySelector;

  @override
  Widget build(BuildContext context) {
    return Selector<RuleParserNotifier, SelectorModel>(
      selector: (_, n) => selector(n),
      builder: (_, selector, __) {
        return ParserTile(
          title: title,
          selector: selector,
          onlySelector: onlySelector,
          onChanged: (value) {
            onChanged(context.read<RuleParserNotifier>(), value);
          },
        );
      },
    );
  }
}

class ParserTile extends StatelessWidget {
  const ParserTile({
    super.key,
    required this.title,
    required this.selector,
    required this.onChanged,
    this.onlySelector = false,
  });

  final String title;
  final SelectorModel selector;
  final ValueChanged<SelectorModel> onChanged;
  final bool onlySelector;

  @override
  Widget build(BuildContext context) {
    return SettingTile(
      title: title,
      onTap: () async {
        final model = await showCupertinoModalSheet(
          context: context,
          builder: (context) => SelectorEditor(
            onlySelector: onlySelector,
            selector: selector,
            title: title,
          ),
        );
        if (model is SelectorModel) {
          onChanged(model);
        }
      },
      trailing: selector.isEmpty
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
  const ExtraParserTile({
    super.key,
    required this.title,
    required this.extraSelector,
    this.onlySelector = false,
  });

  final String title;

  final bool onlySelector;

  final ExtraSelectorModel extraSelector;

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
      trailing: extraSelector.selector.isEmpty
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
