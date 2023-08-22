import 'package:catweb/data/models/site_model/parser/parser.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_parser/parser_tile.dart';
import 'package:catweb/ui/widgets/setting_group.dart';
import 'package:flutter/cupertino.dart';

class ListParserEditor extends StatelessWidget {
  const ListParserEditor({Key? key, required this.parser}) : super(key: key);
  final ListViewParser parser;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _buildBaseList(),
        _buildInfoList(),
        _buildCoverList(),
        _buildTagList(),
        _buildBadgeList(),
        _buildIndexList(),
        _buildFlagList(),
      ],
    );
  }

  Widget _buildFlagList() {
    return CupertinoListSection.insetGrouped(
      hasLeading: false,
      header: const SettingGroupTitle('标志位'),
      children: [
        ParserTile(
          title: '请求成功',
          selector: parser.successSelector,
          onlySelector: true,
        ),
        ParserTile(
          title: '请求失败',
          selector: parser.failedSelector,
          onlySelector: true,
        ),
      ],
    );
  }

  Widget _buildIndexList() {
    return CupertinoListSection.insetGrouped(
      header: const SettingGroupTitle('索引'),
      hasLeading: false,
      children: [
        ParserTile(
          title: '下一面地址',
          selector: parser.nextPage,
          onlySelector: true,
        ),
      ],
    );
  }

  Widget _buildBadgeList() {
    return CupertinoListSection.insetGrouped(
      header: const SettingGroupTitle('徽章'),
      hasLeading: false,
      children: [
        ParserTile(
          title: '徽章选择器',
          selector: parser.badgeSelector,
          onlySelector: true,
        ),
        ParserTile(
          title: '徽章文本',
          selector: parser.badgeItem.category,
        ),
        ParserTile(
          title: '徽章颜色',
          selector: parser.badgeItem.color,
        ),
      ],
    );
  }

  Widget _buildTagList() {
    return CupertinoListSection.insetGrouped(
      header: const SettingGroupTitle('标签'),
      hasLeading: false,
      children: [
        ParserTile(
          title: '标签选择器',
          selector: parser.tag,
          onlySelector: true,
        ),
        ParserTile(
          title: '标签文本',
          selector: parser.tagItem.text,
        ),
        ParserTile(
          title: '标签类型',
          selector: parser.tagItem.category,
        ),
        ParserTile(
          title: '标签颜色',
          selector: parser.tagItem.color,
        ),
      ],
    );
  }

  Widget _buildCoverList() {
    return CupertinoListSection.insetGrouped(
      header: const SettingGroupTitle('封面设置'),
      hasLeading: false,
      children: [
        ParserTile(
          title: '封面地址',
          selector: parser.previewImage.url,
        ),
        ParserTile(
          title: '封面宽度',
          selector: parser.previewImage.width,
        ),
        ParserTile(
          title: '封面高度',
          selector: parser.previewImage.height,
        ),
        ParserTile(
          title: '封面X偏移',
          selector: parser.previewImage.x,
          onlySelector: true,
        ),
        ParserTile(
          title: '封面Y偏移',
          selector: parser.previewImage.y,
          onlySelector: true,
        ),
      ],
    );
  }

  Widget _buildBaseList() {
    return CupertinoListSection.insetGrouped(
      hasLeading: false,
      header: const SettingGroupTitle('基础信息'),
      children: [
        ParserTile(
          title: '项目选择器',
          selector: parser.itemSelector,
          onlySelector: true,
        ),
      ],
    );
  }

  Widget _buildInfoList() {
    return CupertinoListSection.insetGrouped(
        header: const SettingGroupTitle('信息设置'),
        hasLeading: false,
        children: [
          ParserTile(
            title: 'idCode',
            selector: parser.idCode,
          ),
          ParserTile(
            title: '标题',
            selector: parser.title,
          ),
          ParserTile(
            title: '副标题',
            selector: parser.subtitle,
          ),
          ParserTile(
            title: '上传时间',
            selector: parser.uploadTime,
          ),
          ParserTile(
            title: '评分',
            selector: parser.star,
          ),
          ParserTile(
            title: '面数',
            selector: parser.imageCount,
          ),
          ParserTile(
            title: '语言',
            selector: parser.language,
          ),
        ]);
  }
}
