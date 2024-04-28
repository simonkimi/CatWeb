import 'package:catweb/ui/pages/rules_add_guide/rules_parser/parser_tile.dart';
import 'package:catweb/ui/widgets/setting_group.dart';
import 'package:flutter/cupertino.dart';

class AutoCompleteParserEditor extends StatelessWidget {
  const AutoCompleteParserEditor({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CupertinoListSection.insetGrouped(
          header: const SettingGroupTitle('基础信息'),
          hasLeading: false,
          children: [
            ParserTileConsumer(
              title: '项目选择器',
              selector: (n) => n.autoComplete.itemSelector,
              onChanged: (n, v) => {
                n.parser = n.autoComplete.copyWith(itemSelector: v),
              },
            ),
            ParserTileConsumer(
              title: '标题',
              selector: (n) => n.autoComplete.itemTitle,
              onChanged: (n, v) => {
                n.updateParser(n.autoComplete.copyWith(itemTitle: v))
              },
            ),
            ParserTileConsumer(
              title: '副标题',
              selector: (n) => n.autoComplete.itemSubtitle,
              onChanged: (n, v) => {
                n.updateParser(n.autoComplete.copyWith(itemSubtitle: v))
              },
            ),
            ParserTileConsumer(
              title: '补全内容',
              selector: (n) => n.autoComplete.itemComplete,
              onChanged: (n, v) => {
                n.updateParser(n.autoComplete.copyWith(itemComplete: v))
              },
            ),
          ],
        )
      ],
    );
  }
}
