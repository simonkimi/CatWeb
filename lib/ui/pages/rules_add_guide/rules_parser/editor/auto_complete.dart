import 'package:catweb/data/models/site_model/parser/parser.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_parser/parser_tile.dart';
import 'package:catweb/ui/pages/setting_page/widgets/setting_tile.dart';
import 'package:catweb/ui/widgets/setting_group.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:uuid/uuid.dart';

class AutoCompleteParserEditor extends HookWidget {
  AutoCompleteParserEditor({Key? key, AutoCompleteParser? parser})
      : parser = parser ??
            AutoCompleteParser(
                name: '自动补全', uuid: const Uuid().v4().toString()),
        super(key: key);

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
              onChanged: (value) {
                model.value = model.value.copyWith(itemSelector: value);
              },
            ),
            const SettingDivider(),
            ParserTile(
              title: '标题',
              selector: model.value.itemTitle,
              onChanged: (value) {
                model.value = model.value.copyWith(itemTitle: value);
              },
            ),
            const SettingDivider(),
            ParserTile(
              title: '副标题',
              selector: model.value.itemSubtitle,
              onChanged: (value) {
                model.value = model.value.copyWith(itemSubtitle: value);
              },
            ),
            const SettingDivider(),
            ParserTile(
              title: '补全内容',
              selector: model.value.itemComplete,
              onChanged: (value) {
                model.value = model.value.copyWith(itemComplete: value);
              },
            ),
          ],
        )
      ],
    );
  }
}
