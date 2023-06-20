import 'package:catweb/data/models/site_model/parser/parser.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_parser/parser/parser_tile.dart';
import 'package:catweb/ui/pages/setting_page/widgets/setting_tile.dart';
import 'package:catweb/ui/widgets/setting_group.dart';
import 'package:flutter/cupertino.dart';
import 'package:catweb/i18n.dart';
import 'package:get/get.dart';

class NewGalleryParser extends StatelessWidget {
  NewGalleryParser({Key? key}) : super(key: key);

  final Rx<GalleryParser> rxModel = GalleryParser(name: '列表', uuid: '').obs;

  GalleryParser get model => rxModel.value;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      children: [
        ..._buildInfoList(context),
        ..._buildCoverList(context),
      ],
    );
  }

  List<Widget> _buildInfoList(BuildContext context) {
    return [
      const SizedBox(height: 5),
      SettingGroupTitle(I.of(context).basic_setting),
      Obx(() => ParserTile(
        title: I.of(context).title,
        selector: model.title,
        onChanged: (value) {
          rxModel(model.copyWith(title: value));
        },
      )),
      const SettingDivider(),
      Obx(() => ParserTile(
        title: I.of(context).subtitle,
        selector: model.subtitle,
        onChanged: (value) {
          rxModel(model.copyWith(subtitle: value));
        },
      )),
      const SettingDivider(),
      Obx(() => ParserTile(
        title: I.of(context).upload_time,
        selector: model.uploadTime,
        onChanged: (value) {
          rxModel(model.copyWith(uploadTime: value));
        },
      )),
      const SettingDivider(),
      Obx(() => ParserTile(
        title: I.of(context).star,
        selector: model.star,
        onChanged: (value) {
          rxModel(model.copyWith(star: value));
        },
      )),
      const SettingDivider(),
      Obx(() => ParserTile(
        title: I.of(context).language,
        selector: model.language,
        onChanged: (value) {
          rxModel(model.copyWith(language: value));
        },
      )),
      const SettingDivider(),
      Obx(() => ParserTile(
        title: I.of(context).description,
        selector: model.description,
        onChanged: (value) {
          rxModel(model.copyWith(description: value));
        },
      )),
      const SettingDivider(),
      Obx(() => ParserTile(
        title: I.of(context).image_count,
        selector: model.imgCount,
        onChanged: (value) {
          rxModel(model.copyWith(imgCount: value));
        },
      )),
      const SettingDivider(),
      Obx(() => ParserTile(
        title: I.of(context).page_count,
        selector: model.pageCount,
        onChanged: (value) {
          rxModel(model.copyWith(pageCount: value));
        },
      )),
      const SettingDivider(),
      Obx(() => ParserTile(
        title: I.of(context).image_pre_page,
        selector: model.countPrePage,
        onChanged: (value) {
          rxModel(model.copyWith(countPrePage: value));
        },
      )),
    ];
  }

  List<Widget> _buildCoverList(BuildContext context) {
    return [

    ];
  }
}
