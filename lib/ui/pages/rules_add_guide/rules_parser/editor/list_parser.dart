import 'package:catweb/data/models/site_model/parser/parser.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_parser/parser_tile.dart';
import 'package:catweb/ui/pages/setting_page/widgets/setting_tile.dart';
import 'package:catweb/ui/widgets/setting_group.dart';
import 'package:flutter/cupertino.dart';

class ListParserEditor extends StatelessWidget {
  const ListParserEditor({Key? key, required this.parser}) : super(key: key);
  final ListViewParser parser;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      children: [
        ..._buildBaseList(),
        ..._buildInfoList(),
        ..._buildCoverList(),
        ..._buildTagList(),
        ..._buildBadgeList(),
        ..._buildIndexList(),
        ..._buildFlagList(),
      ],
    );
  }

  List<Widget> _buildFlagList() {
    return [
      const SettingGroupTitle('标志位'),
      SettingGroupWidget(
        children: [
          ParserTile(
            title: '请求成功',
            selector: parser.successSelector,
            onlySelector: true,
          ),
          const SettingDivider(),
          ParserTile(
            title: '请求失败',
            selector: parser.failedSelector,
            onlySelector: true,
          ),
        ],
      ),
    ];
  }

  List<Widget> _buildIndexList() {
    return [
      const SettingGroupTitle('索引'),
      SettingGroupWidget(
        children: [
          ParserTile(
            title: '下一面地址',
            selector: parser.nextPage,
            onlySelector: true,
          ),
          const SettingDivider(),
        ],
      ),
    ];
  }

  List<Widget> _buildBadgeList() {
    return [
      const SettingGroupTitle('徽章'),
      SettingGroupWidget(
        children: [
          ParserTile(
            title: '徽章选择器',
            selector: parser.badgeSelector,
            onlySelector: true,
          ),
          const SettingDivider(),
          ParserTile(
            title: '徽章文本',
            selector: parser.badgeItem.category,
          ),
          const SettingDivider(),
          ParserTile(
            title: '徽章颜色',
            selector: parser.badgeItem.color,
          ),
        ],
      ),
    ];
  }

  List<Widget> _buildTagList() {
    return [
      const SettingGroupTitle('标签'),
      SettingGroupWidget(
        children: [
          ParserTile(
            title: '标签选择器',
            selector: parser.tag,
            onlySelector: true,
          ),
          const SettingDivider(),
          ParserTile(
            title: '标签文本',
            selector: parser.tagItem.text,
          ),
          const SettingDivider(),
          ParserTile(
            title: '标签类型',
            selector: parser.tagItem.category,
          ),
          const SettingDivider(),
          ParserTile(
            title: '标签颜色',
            selector: parser.tagItem.color,
          ),
        ],
      ),
    ];
  }

  List<Widget> _buildCoverList() {
    return [
      const SettingGroupTitle('封面设置'),
      SettingGroupWidget(
        children: [
          ParserTile(
            title: '封面地址',
            selector: parser.previewImage.url,
          ),
          const SettingDivider(),
          ParserTile(
            title: '封面宽度',
            selector: parser.previewImage.width,
          ),
          const SettingDivider(),
          ParserTile(
            title: '封面高度',
            selector: parser.previewImage.height,
          ),
          const SettingDivider(),
          ParserTile(
            title: '封面X偏移',
            selector: parser.previewImage.x,
            onlySelector: true,
          ),
          const SettingDivider(),
          ParserTile(
            title: '封面Y偏移',
            selector: parser.previewImage.y,
            onlySelector: true,
          ),
        ],
      ),
    ];
  }

  List<Widget> _buildBaseList() {
    return [
      const SettingGroupTitle('基础信息'),
      SettingGroupWidget(
        children: [
          ParserTile(
            title: '项目选择器',
            selector: parser.itemSelector,
            onlySelector: true,
          ),
        ],
      ),
    ];
  }

  List<Widget> _buildInfoList() {
    return [
      const SettingGroupTitle('信息设置'),
      SettingGroupWidget(
        children: [
          ParserTile(
            title: 'idCode',
            selector: parser.idCode,
          ),
          const SettingDivider(),
          ParserTile(
            title: '标题',
            selector: parser.title,
          ),
          const SettingDivider(),
          ParserTile(
            title: '副标题',
            selector: parser.subtitle,
          ),
          const SettingDivider(),
          ParserTile(
            title: '上传时间',
            selector: parser.uploadTime,
          ),
          const SettingDivider(),
          ParserTile(
            title: '评分',
            selector: parser.star,
          ),
          const SettingDivider(),
          ParserTile(
            title: '面数',
            selector: parser.imageCount,
          ),
          const SettingDivider(),
          ParserTile(
            title: '语言',
            selector: parser.language,
          ),
        ],
      ),
    ];
  }
}
