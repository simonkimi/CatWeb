import 'package:catweb/data/models/site_model/parser/parser.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_parser/parser_tile.dart';
import 'package:catweb/ui/pages/setting_page/widgets/setting_tile.dart';
import 'package:catweb/ui/widgets/setting_group.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NewImageParserEditor extends StatelessWidget {
  NewImageParserEditor({Key? key}) : super(key: key);

  final Rx<ImageReaderParser> rxModel =
      ImageReaderParser(name: '列表', uuid: '').obs;

  ImageReaderParser get model => rxModel.value;

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
      Obx(() => ParserTile(
            title: '图片地址',
            selector: model.image.imgUrl,
            onChanged: (value) {
              rxModel(
                  model.copyWith(image: model.image.copyWith(imgUrl: value)));
            },
          )),
      const SettingDivider(),
      Obx(() => ParserTile(
            title: '图片宽度',
            selector: model.image.imgWidth,
            onChanged: (value) {
              rxModel(
                  model.copyWith(image: model.image.copyWith(imgWidth: value)));
            },
          )),
      const SettingDivider(),
      Obx(() => ParserTile(
            title: '图片高度',
            selector: model.image.imgHeight,
            onChanged: (value) {
              rxModel(model.copyWith(
                  image: model.image.copyWith(imgHeight: value)));
            },
          )),
      const SettingDivider(),
      Obx(() => ParserTile(
            title: '图片X偏移',
            selector: model.image.imgX,
            onChanged: (value) {
              rxModel(model.copyWith(image: model.image.copyWith(imgX: value)));
            },
          )),
      const SettingDivider(),
      Obx(() => ParserTile(
            title: '图片Y偏移',
            selector: model.image.imgY,
            onChanged: (value) {
              rxModel(model.copyWith(image: model.image.copyWith(imgY: value)));
            },
          )),
    ];
  }

  List<Widget> _buildMetaInfo(BuildContext context) {
    return [
      const SizedBox(height: 5),
      const SettingGroupTitle('图片信息'),
      Obx(() => ParserTile(
            title: '大图地址',
            selector: model.largerImage,
            onChanged: (value) {
              rxModel(model.copyWith(largerImage: value));
            },
          )),
      const SettingDivider(),
      Obx(() => ParserTile(
            title: '原图地址',
            selector: model.rawImage,
            onChanged: (value) {
              rxModel(model.copyWith(rawImage: value));
            },
          )),
      const SettingDivider(),
      Obx(() => ParserTile(
            title: '级别',
            selector: model.rating,
            onChanged: (value) {
              rxModel(model.copyWith(rating: value));
            },
          )),
      const SettingDivider(),
      Obx(() => ParserTile(
            title: '评分',
            selector: model.score,
            onChanged: (value) {
              rxModel(model.copyWith(score: value));
            },
          )),
      const SettingDivider(),
      Obx(() => ParserTile(
            title: '来源',
            selector: model.source,
            onChanged: (value) {
              rxModel(model.copyWith(source: value));
            },
          )),
      const SettingDivider(),
      Obx(() => ParserTile(
            title: '上传时间',
            selector: model.uploadTime,
            onChanged: (value) {
              rxModel(model.copyWith(uploadTime: value));
            },
          )),
    ];
  }

  List<Widget> _buildBadgeList(BuildContext context) {
    return [
      const SizedBox(height: 5),
      const SettingGroupTitle('标签'),
      Obx(() => ParserTile(
            title: '标签项目',
            selector: model.badgeSelector,
            onChanged: (value) {
              rxModel(model.copyWith(badgeSelector: value));
            },
          )),
      const SettingDivider(),
      Obx(() => ParserTile(
            title: '徽章内容',
            selector: model.badgeText,
            onChanged: (value) {
              rxModel(model.copyWith(badgeText: value));
            },
          )),
      const SettingDivider(),
      Obx(() => ParserTile(
            title: '徽章类型',
            selector: model.badgeCategory,
            onChanged: (value) {
              rxModel(model.copyWith(badgeCategory: value));
            },
          )),
    ];
  }
}
