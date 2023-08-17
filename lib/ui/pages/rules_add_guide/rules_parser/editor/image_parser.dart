import 'package:catweb/data/models/site_model/parser/parser.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_parser/parser_tile.dart';
import 'package:catweb/ui/widgets/setting_group.dart';
import 'package:flutter/cupertino.dart';

class NewImageParserEditor extends StatelessWidget {
  const NewImageParserEditor({Key? key, required this.parser})
      : super(key: key);
  final ImageReaderParser parser;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _buildImage(context),
        _buildMetaInfo(context),
        _buildBadgeList(context),
      ],
    );
  }

  Widget _buildImage(BuildContext context) {
    return CupertinoListSection.insetGrouped(
      header: const SettingGroupTitle('图片'),
      hasLeading: false,
      children: [
        ParserTile(
          title: '图片地址',
          selector: parser.image.url,
        ),
        ParserTile(
          title: '图片宽度',
          selector: parser.image.width,
        ),
        ParserTile(
          title: '图片高度',
          selector: parser.image.height,
        ),
        ParserTile(
          title: '图片X偏移',
          selector: parser.image.x,
        ),
        ParserTile(
          title: '图片Y偏移',
          selector: parser.image.y,
        ),
      ],
    );
  }

  Widget _buildMetaInfo(BuildContext context) {
    return CupertinoListSection.insetGrouped(
      header: const SettingGroupTitle('图片信息'),
      hasLeading: false,
      children: [
        ParserTile(
          title: '大图地址',
          selector: parser.largerImage,
        ),
        ParserTile(
          title: '原图地址',
          selector: parser.rawImage,
        ),
        ParserTile(
          title: '级别',
          selector: parser.rating,
        ),
        ParserTile(
          title: '评分',
          selector: parser.score,
        ),
        ParserTile(
          title: '来源',
          selector: parser.source,
        ),
        ParserTile(
          title: '上传时间',
          selector: parser.uploadTime,
        ),
      ],
    );
  }

  Widget _buildBadgeList(BuildContext context) {
    return CupertinoListSection.insetGrouped(
      header: const SettingGroupTitle('标签'),
      hasLeading: false,
      children: [
        ParserTile(
          title: '标签项目',
          selector: parser.tagSelector,
        ),
        ParserTile(
          title: '标签内容',
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
}
