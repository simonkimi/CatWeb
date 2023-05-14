import 'package:catweb/data/models/site_model/parser/parser.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_parser/parser/parser_tile.dart';
import 'package:catweb/ui/pages/setting_page/widgets/setting_tile.dart';
import 'package:catweb/ui/widgets/setting_group.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'selector_editor.dart';

class AutoCompleteParserEdit extends StatelessWidget {
  AutoCompleteParserEdit({Key? key}) : super(key: key);

  final Rx<AutoCompleteParser> rxModel =
      AutoCompleteParser(name: '自动补全', uuid: 'test').obs;

  AutoCompleteParser get model => rxModel.value;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 5),
        const SettingGroupTitle('基础信息'),
        SettingGroupWidget(
          children: [
            Obx(() => ParserTile(
              title: '项目选择器',
              selector: model.itemSelector,
              onlySelector: true,
              onChanged: (value) {
                rxModel(model.copyWith(itemSelector: value));
              },
            )),
            const SettingDivider(),
            Obx(() => ParserTile(
              title: '标题',
              selector: model.itemTitle,
              onChanged: (value) {
                rxModel(model.copyWith(itemTitle: value));
              },
            )),
            const SettingDivider(),
            Obx(() => ParserTile(
              title: '副标题',
              selector: model.itemSubtitle,
              onChanged: (value) {
                rxModel(model.copyWith(itemSubtitle: value));
              },
            )),
            const SettingDivider(),
            Obx(() => ParserTile(
              title: '补全内容',
              selector: model.itemComplete,
              onChanged: (value) {
                rxModel(model.copyWith(itemComplete: value));
              },
            )),
          ],
        )
      ],
    );
  }
}
