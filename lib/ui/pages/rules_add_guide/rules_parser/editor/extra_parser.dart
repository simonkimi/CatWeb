import 'package:catweb/ui/pages/rules_add_guide/rules_parser/parser_notifier.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_parser/selector_editor.dart';
import 'package:catweb/ui/widgets/cupertino_list_tile.dart';
import 'package:catweb/ui/widgets/dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExtraParserEditor extends StatelessWidget {
  const ExtraParserEditor({super.key});

  @override
  Widget build(BuildContext context) {
    final extraList = context.select((RuleParserNotifier n) => n.parser.extra);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ListView(
        children: [
          for (final MapEntry(key: index, value: extra)
              in extraList.asMap().entries)
            CupertinoCardTile(
              title: Text(extra.id),
              trailing: const Icon(Icons.more_horiz_outlined),
              onTap: () async {
                final newSelector =
                    await Navigator.of(context).push(CupertinoPageRoute(
                  builder: (context) => SelectorEditor(
                    selector: extra.selector,
                    title: extra.id,
                  ),
                ));
                if (newSelector != null) {
                  context
                      .read<RuleParserNotifier>()
                      .updateExtra(index, newSelector);
                }
              },
              onTrailingTap: () {},
            ),
          CupertinoCardTile(
            title: const Text('添加规则'),
            leading: const Icon(CupertinoIcons.add),
            onTap: () {
              showCupertinoInputDialog(
                context,
                title: '规则id',
                initialValue: '',
              ).then((value) {
                if (value == null) return;
                context.read<RuleParserNotifier>().addExtra(value);
              });
            },
          ),
        ],
      ),
    );
  }
}
