import 'package:catweb/data/models/site_model/parser/parser.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_parser/parser_tile.dart';
import 'package:catweb/ui/widgets/setting_group.dart';
import 'package:flutter/cupertino.dart';

class AutoCompleteParserEditor extends StatelessWidget {
  const AutoCompleteParserEditor({Key? key, required this.parser})
      : super(key: key);

  final AutoCompleteParser parser;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CupertinoListSection.insetGrouped(
          header: const SettingGroupTitle('基础信息'),
          hasLeading: false,
          children: [
            ParserTile(
              title: '项目选择器',
              selector: parser.itemSelector,
              onlySelector: true,
            ),
            ParserTile(
              title: '标题',
              selector: parser.itemTitle,
            ),
            ParserTile(
              title: '副标题',
              selector: parser.itemSubtitle,
            ),
            ParserTile(
              title: '补全内容',
              selector: parser.itemComplete,
            ),
          ],
        )
      ],
    );
  }
}
