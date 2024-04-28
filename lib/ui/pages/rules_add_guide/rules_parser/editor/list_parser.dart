import 'package:catweb/ui/pages/rules_add_guide/rules_parser/parser_tile.dart';
import 'package:catweb/ui/widgets/setting_group.dart';
import 'package:flutter/cupertino.dart';

class ListParserEditor extends StatelessWidget {
  const ListParserEditor({super.key});

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
        ParserTileConsumer(
          title: '请求成功',
          selector: (n) => n.list.successSelector,
          onChanged: (n, v) =>
              n.updateParser(n.list.copyWith(successSelector: v)),
        ),
        ParserTileConsumer(
          title: '请求失败',
          selector: (n) => n.list.failedSelector,
          onChanged: (n, v) =>
              n.updateParser(n.list.copyWith(failedSelector: v)),
        ),
      ],
    );
  }

  Widget _buildIndexList() {
    return CupertinoListSection.insetGrouped(
      header: const SettingGroupTitle('索引'),
      hasLeading: false,
      children: [
        ParserTileConsumer(
          title: '下一面地址',
          selector: (n) => n.list.nextPage,
          onChanged: (n, v) => n.updateParser(n.list.copyWith(nextPage: v)),
        ),
      ],
    );
  }

  Widget _buildBadgeList() {
    return CupertinoListSection.insetGrouped(
      header: const SettingGroupTitle('徽章'),
      hasLeading: false,
      children: [
        ParserTileConsumer(
          title: '徽章选择器',
          selector: (n) => n.list.badgeSelector,
          onChanged: (n, v) =>
              n.updateParser(n.list.copyWith(badgeSelector: v)),
        ),
        ParserTileConsumer(
          title: '徽章文本',
          selector: (n) => n.list.badgeItem.category,
          onChanged: (n, v) => n.updateParser(n.list.copyWith(
            badgeItem: n.list.badgeItem.copyWith(category: v),
          )),
        ),
        ParserTileConsumer(
          title: '徽章颜色',
          selector: (n) => n.list.badgeItem.color,
          onChanged: (n, v) => n.updateParser(n.list.copyWith(
            badgeItem: n.list.badgeItem.copyWith(color: v),
          )),
        ),
      ],
    );
  }

  Widget _buildTagList() {
    return CupertinoListSection.insetGrouped(
      header: const SettingGroupTitle('标签'),
      hasLeading: false,
      children: [
        ParserTileConsumer(
          title: '标签选择器',
          selector: (n) => n.list.tag,
          onChanged: (n, v) => n.updateParser(n.list.copyWith(tag: v)),
          onlySelector: true,
        ),
        ParserTileConsumer(
          title: '标签文本',
          selector: (n) => n.list.tagItem.text,
          onChanged: (n, v) => n.updateParser(n.list.copyWith(
            tagItem: n.list.tagItem.copyWith(text: v),
          )),
        ),
        ParserTileConsumer(
          title: '标签类型',
          selector: (n) => n.list.tagItem.category,
          onChanged: (n, v) => n.updateParser(n.list.copyWith(
            tagItem: n.list.tagItem.copyWith(category: v),
          )),
        ),
        ParserTileConsumer(
          title: '标签颜色',
          selector: (n) => n.list.tagItem.color,
          onChanged: (n, v) => n.updateParser(n.list.copyWith(
            tagItem: n.list.tagItem.copyWith(color: v),
          )),
        ),
      ],
    );
  }

  Widget _buildCoverList() {
    return CupertinoListSection.insetGrouped(
      header: const SettingGroupTitle('封面设置'),
      hasLeading: false,
      children: [
        ParserTileConsumer(
          title: '封面地址',
          selector: (n) => n.list.previewImage.url,
          onChanged: (n, v) => n.updateParser(n.list.copyWith(
            previewImage: n.list.previewImage.copyWith(url: v),
          )),
        ),
        ParserTileConsumer(
          title: '封面宽度',
          selector: (n) => n.list.previewImage.width,
          onChanged: (n, v) => n.updateParser(n.list.copyWith(
            previewImage: n.list.previewImage.copyWith(width: v),
          )),
        ),
        ParserTileConsumer(
          title: '封面高度',
          selector: (n) => n.list.previewImage.height,
          onChanged: (n, v) => n.updateParser(n.list.copyWith(
            previewImage: n.list.previewImage.copyWith(height: v),
          )),
        ),
        ParserTileConsumer(
          title: '封面X偏移',
          selector: (n) => n.list.previewImage.x,
          onChanged: (n, v) => n.updateParser(n.list.copyWith(
            previewImage: n.list.previewImage.copyWith(x: v),
          )),
        ),
        ParserTileConsumer(
          title: '封面Y偏移',
          selector: (n) => n.list.previewImage.y,
          onChanged: (n, v) => n.updateParser(n.list.copyWith(
            previewImage: n.list.previewImage.copyWith(y: v),
          )),
        ),
      ],
    );
  }

  Widget _buildBaseList() {
    return CupertinoListSection.insetGrouped(
      hasLeading: false,
      header: const SettingGroupTitle('基础信息'),
      children: [
        ParserTileConsumer(
          title: '项目选择器',
          selector: (n) => n.list.itemSelector,
          onChanged: (n, v) => n.updateParser(n.list.copyWith(itemSelector: v)),
        ),
      ],
    );
  }

  Widget _buildInfoList() {
    return CupertinoListSection.insetGrouped(
      header: const SettingGroupTitle('信息设置'),
      hasLeading: false,
      children: [
        ParserTileConsumer(
          title: 'idCode',
          selector: (n) => n.list.idCode,
          onChanged: (n, v) => n.updateParser(n.list.copyWith(idCode: v)),
        ),
        ParserTileConsumer(
          title: '标题',
          selector: (n) => n.list.title,
          onChanged: (n, v) => n.updateParser(n.list.copyWith(title: v)),
        ),
        ParserTileConsumer(
          title: '副标题',
          selector: (n) => n.list.subtitle,
          onChanged: (n, v) => n.updateParser(n.list.copyWith(subtitle: v)),
        ),
        ParserTileConsumer(
          title: '上传时间',
          selector: (n) => n.list.uploadTime,
          onChanged: (n, v) => n.updateParser(n.list.copyWith(uploadTime: v)),
        ),
        ParserTileConsumer(
          title: '评分',
          selector: (n) => n.list.star,
          onChanged: (n, v) => n.updateParser(n.list.copyWith(star: v)),
        ),
        ParserTileConsumer(
          title: '面数',
          selector: (n) => n.list.imageCount,
          onChanged: (n, v) => n.updateParser(n.list.copyWith(imageCount: v)),
        ),
        ParserTileConsumer(
          title: '语言',
          selector: (n) => n.list.language,
          onChanged: (n, v) => n.updateParser(n.list.copyWith(language: v)),
        ),
      ],
    );
  }
}
