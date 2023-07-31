import 'package:catweb/data/models/site_model/parser/parser.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_parser/parser_tile.dart';
import 'package:catweb/ui/pages/setting_page/widgets/setting_tile.dart';
import 'package:catweb/ui/widgets/setting_group.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AutoCompleteParserEditor extends StatelessWidget {
  const AutoCompleteParserEditor({Key? key, required this.parser})
      : super(key: key);

  final AutoCompleteParser parser;

  @override
  Widget build(BuildContext context) {
    final model = useState(parser);

    return ListView(
      children: [
        const SizedBox(height: 5),
        const SettingGroupTitle('基础信息'),
        SettingGroupWidget(
          children: [
            ParserTile(
              title: '项目选择器',
              selector: model.value.itemSelector,
              onlySelector: true,
            ),
            const SettingDivider(),
            ParserTile(
              title: '标题',
              selector: model.value.itemTitle,
            ),
            const SettingDivider(),
            ParserTile(
              title: '副标题',
              selector: model.value.itemSubtitle,
            ),
            const SettingDivider(),
            ParserTile(
              title: '补全内容',
              selector: model.value.itemComplete,
            ),
          ],
        )
      ],
    );
  }
}
