import 'package:catweb/data/models/site_model/parser/parser.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_parser/parser_tile.dart';
import 'package:catweb/ui/pages/setting_page/widgets/setting_tile.dart';
import 'package:catweb/ui/widgets/setting_group.dart';
import 'package:flutter/cupertino.dart';

class ListParserEditor extends StatefulWidget {
  ListParserEditor({Key? key, ListViewParser? parser})
      : parser = parser ?? ListViewParser(name: '列表', uuid: ''),
        super(key: key);

  final ListViewParser parser;

  @override
  State<StatefulWidget> createState() => _ListParserEditorState();
}

class _ListParserEditorState extends State<ListParserEditor> {
  late ListViewParser model;

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
            selector: model.successSelector,
            onlySelector: true,
            onChanged: (value) {
              setState(() => model.successSelector = value);
            },
          ),
          const SettingDivider(),
          ParserTile(
            title: '请求失败',
            selector: model.failedSelector,
            onlySelector: true,
            onChanged: (value) {
              setState(() => model.failedSelector = value);
            },
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
            selector: model.nextPage,
            onlySelector: true,
            onChanged: (value) {
              setState(() => model.nextPage = value);
            },
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
            selector: model.badgeText,
            onlySelector: true,
            onChanged: (value) {
              setState(() => model.badgeText = value);
            },
          ),
          const SettingDivider(),
          ParserTile(
            title: '徽章颜色',
            selector: model.badgeColor,
            onChanged: (value) {
              setState(() => model.badgeColor = value);
            },
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
            selector: model.tag,
            onlySelector: true,
            onChanged: (value) {
              setState(() => model.tag = value);
            },
          ),
          const SettingDivider(),
          ParserTile(
            title: '标签颜色',
            selector: model.tagColor,
            onChanged: (value) {
              setState(() => model.tagColor = value);
            },
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
            selector: model.previewImg.imgUrl,
            onChanged: (value) {
              setState(() => model.previewImg = model.previewImg.copyWith(imgUrl: value));
            },
          ),
          const SettingDivider(),
          ParserTile(
            title: '封面宽度',
            selector: model.previewImg.imgWidth,
            onChanged: (value) {
              // setState(() => model.previewImg.imgWidth = value);
              setState(() {
                model.previewImg = model.previewImg.copyWith(imgWidth: value);
              });
            },
          ),
          const SettingDivider(),
          ParserTile(
            title: '封面高度',
            selector: model.previewImg.imgHeight,
            onChanged: (value) {
              setState(() {
                model.previewImg = model.previewImg.copyWith(imgHeight: value);
              });
            },
          ),
          const SettingDivider(),
          ParserTile(
            title: '封面X偏移',
            selector: model.previewImg.imgX,
            onlySelector: true,
            onChanged: (value) {
              setState(() {
                model.previewImg = model.previewImg.copyWith(imgX: value);
              });
            },
          ),
          const SettingDivider(),
          ParserTile(
            title: '封面Y偏移',
            selector: model.previewImg.imgY,
            onlySelector: true,
            onChanged: (value) {
              setState(() {
                model.previewImg = model.previewImg.copyWith(imgY: value);
              });
            },
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
            selector: model.itemSelector,
            onlySelector: true,
            onChanged: (value) {
              setState(() => model.itemSelector = value);
            },
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
            selector: model.idCode,
            onChanged: (value) {
              setState(() => model.idCode = value);
            },
          ),
          const SettingDivider(),
          ParserTile(
            title: '标题',
            selector: model.title,
            onChanged: (value) {
              setState(() => model.title = value);
            },
          ),
          const SettingDivider(),
          ParserTile(
            title: '副标题',
            selector: model.subtitle,
            onChanged: (value) {
              setState(() => model.subtitle = value);
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
          const SettingDivider(),
          ParserTile(
            title: '评分',
            selector: model.star,
            onChanged: (value) {
              setState(() => model.star = value);
            },
          ),
          const SettingDivider(),
          ParserTile(
            title: '面数',
            selector: model.imgCount,
            onChanged: (value) {
              setState(() => model.imgCount = value);
            },
          ),
          const SettingDivider(),
          ParserTile(
            title: '语言',
            selector: model.language,
            onChanged: (value) {
              setState(() => model.language = value);
            },
          ),
        ],
      ),
    ];
  }
}
