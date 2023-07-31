import 'package:catweb/data/models/site_model/parser/parser.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_parser/parser_tile.dart';
import 'package:catweb/ui/pages/setting_page/widgets/setting_tile.dart';
import 'package:catweb/ui/widgets/setting_group.dart';
import 'package:flutter/cupertino.dart';

class NewImageParserEditor extends StatelessWidget {
  const NewImageParserEditor({Key? key, required this.parser})
      : super(key: key);
  final ImageReaderParser parser;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      children: [
        ..._buildImage(context),
        ..._buildMetaInfo(context),
        ..._buildBadgeList(context),
      ],
    );
  }

  List<Widget> _buildImage(BuildContext context) {
    return [
      const SizedBox(height: 5),
      const SettingGroupTitle('缩略图'),
      ParserTile(
        title: '图片地址',
        selector: parser.image.imgUrl,
      ),
      const SettingDivider(),
      ParserTile(
        title: '图片宽度',
        selector: parser.image.imgWidth,
      ),
      const SettingDivider(),
      ParserTile(
        title: '图片高度',
        selector: parser.image.imgHeight,
      ),
      const SettingDivider(),
      ParserTile(
        title: '图片X偏移',
        selector: parser.image.imgX,
      ),
      const SettingDivider(),
      ParserTile(
        title: '图片Y偏移',
        selector: parser.image.imgY,
      ),
    ];
  }

  List<Widget> _buildMetaInfo(BuildContext context) {
    return [
      const SizedBox(height: 5),
      const SettingGroupTitle('图片信息'),
      ParserTile(
        title: '大图地址',
        selector: parser.largerImage,
      ),
      const SettingDivider(),
      ParserTile(
        title: '原图地址',
        selector: parser.rawImage,
      ),
      const SettingDivider(),
      ParserTile(
        title: '级别',
        selector: parser.rating,
      ),
      const SettingDivider(),
      ParserTile(
        title: '评分',
        selector: parser.score,
      ),
      const SettingDivider(),
      ParserTile(
        title: '来源',
        selector: parser.source,
      ),
      const SettingDivider(),
      ParserTile(
        title: '上传时间',
        selector: parser.uploadTime,
      ),
    ];
  }

  List<Widget> _buildBadgeList(BuildContext context) {
    return [
      const SizedBox(height: 5),
      const SettingGroupTitle('标签'),
      ParserTile(
        title: '标签项目',
        selector: parser.badgeSelector,
      ),
      const SettingDivider(),
      ParserTile(
        title: '徽章内容',
        selector: parser.badgeText,
      ),
      const SettingDivider(),
      ParserTile(
        title: '徽章类型',
        selector: parser.badgeCategory,
      ),
    ];
  }
}
