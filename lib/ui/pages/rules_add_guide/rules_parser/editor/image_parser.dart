import 'package:catweb/data/models/site_model/parser/parser.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_parser/parser_tile.dart';
import 'package:catweb/ui/pages/setting_page/widgets/setting_tile.dart';
import 'package:catweb/ui/widgets/setting_group.dart';
import 'package:flutter/cupertino.dart';

class NewImageParserEditor extends StatefulWidget {
  NewImageParserEditor({Key? key, ImageReaderParser? parser})
      : parser = parser ?? ImageReaderParser(name: '列表', uuid: ''),
        super(key: key);

  final ImageReaderParser parser;

  @override
  State<NewImageParserEditor> createState() => _NewImageParserEditorState();
}

class _NewImageParserEditorState extends State<NewImageParserEditor> {
  late ImageReaderParser model;

  @override
  void initState() {
    model = widget.parser;
    super.initState();
  }

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
        selector: model.image.imgUrl,
        onChanged: (value) {
          // setState(() => model.image.imgUrl = value);
          setState(() => model.image = model.image.copyWith(imgUrl: value));
        },
      ),
      const SettingDivider(),
      ParserTile(
        title: '图片宽度',
        selector: model.image.imgWidth,
        onChanged: (value) {
          // setState(() => model.image.imgWidth = value);
          setState(() => model.image = model.image.copyWith(imgWidth: value));
        },
      ),
      const SettingDivider(),
      ParserTile(
        title: '图片高度',
        selector: model.image.imgHeight,
        onChanged: (value) {
          // setState(() => model.image.imgHeight = value);
          setState(() => model.image = model.image.copyWith(imgHeight: value));
        },
      ),
      const SettingDivider(),
      ParserTile(
        title: '图片X偏移',
        selector: model.image.imgX,
        onChanged: (value) {
          // setState(() => model.image.imgX = value);
          setState(() => model.image = model.image.copyWith(imgX: value));
        },
      ),
      const SettingDivider(),
      ParserTile(
        title: '图片Y偏移',
        selector: model.image.imgY,
        onChanged: (value) {
          // setState(() => model.image.imgY = value);
          setState(() => model.image = model.image.copyWith(imgY: value));
        },
      ),
    ];
  }

  List<Widget> _buildMetaInfo(BuildContext context) {
    return [
      const SizedBox(height: 5),
      const SettingGroupTitle('图片信息'),
      ParserTile(
        title: '大图地址',
        selector: model.largerImage,
        onChanged: (value) {
          setState(() => model.largerImage = value);
        },
      ),
      const SettingDivider(),
      ParserTile(
        title: '原图地址',
        selector: model.rawImage,
        onChanged: (value) {
          setState(() => model.rawImage = value);
        },
      ),
      const SettingDivider(),
      ParserTile(
        title: '级别',
        selector: model.rating,
        onChanged: (value) {
          setState(() => model.rating = value);
        },
      ),
      const SettingDivider(),
      ParserTile(
        title: '评分',
        selector: model.score,
        onChanged: (value) {
          setState(() => model.score = value);
        },
      ),
      const SettingDivider(),
      ParserTile(
        title: '来源',
        selector: model.source,
        onChanged: (value) {
          setState(() => model.source = value);
        },
      ),
      const SettingDivider(),
      ParserTile(
        title: '上传时间',
        selector: model.uploadTime,
        onChanged: (value) {
          setState(() => model.uploadTime = value);
        },
      ),
    ];
  }

  List<Widget> _buildBadgeList(BuildContext context) {
    return [
      const SizedBox(height: 5),
      const SettingGroupTitle('标签'),
      ParserTile(
        title: '标签项目',
        selector: model.badgeSelector,
        onChanged: (value) {
          setState(() => model.badgeSelector = value);
        },
      ),
      const SettingDivider(),
      ParserTile(
        title: '徽章内容',
        selector: model.badgeText,
        onChanged: (value) {
          setState(() => model.badgeText = value);
        },
      ),
      const SettingDivider(),
      ParserTile(
        title: '徽章类型',
        selector: model.badgeCategory,
        onChanged: (value) {
          setState(() => model.badgeCategory = value);
        },
      ),
    ];
  }
}
