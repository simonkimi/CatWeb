import 'package:catweb/data/models/site_model/parser/parser.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_parser/parser/parser_tile.dart';
import 'package:catweb/ui/pages/setting_page/widgets/setting_tile.dart';
import 'package:catweb/ui/widgets/setting_group.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NewListParser extends StatelessWidget {
  NewListParser({Key? key}) : super(key: key);

  final Rx<ListViewParser> rxModel = ListViewParser(name: '列表', uuid: '').obs;

  ListViewParser get model => rxModel.value;

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
          Obx(() => ParserTile(
                title: '请求成功',
                selector: model.successSelector,
                onlySelector: true,
                onChanged: (value) {
                  rxModel(model.copyWith(successSelector: value));
                },
              )),
          const SettingDivider(),
          Obx(() => ParserTile(
                title: '请求失败',
                selector: model.failedSelector,
                onlySelector: true,
                onChanged: (value) {
                  rxModel(model.copyWith(failedSelector: value));
                },
              )),
        ],
      ),
    ];
  }

  List<Widget> _buildIndexList() {
    return [
      const SettingGroupTitle('索引'),
      SettingGroupWidget(
        children: [
          Obx(() => ParserTile(
                title: '下一面地址',
                selector: model.nextPage,
                onlySelector: true,
                onChanged: (value) {
                  rxModel(model.copyWith(nextPage: value));
                },
              )),
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
          Obx(() => ParserTile(
                title: '徽章选择器',
                selector: model.badgeText,
                onlySelector: true,
                onChanged: (value) {
                  rxModel(model.copyWith(badgeText: value));
                },
              )),
          const SettingDivider(),
          Obx(() => ParserTile(
                title: '徽章颜色',
                selector: model.badgeColor,
                onChanged: (value) {
                  rxModel(model.copyWith(badgeColor: value));
                },
              )),
        ],
      ),
    ];
  }

  List<Widget> _buildTagList() {
    return [
      const SettingGroupTitle('标签'),
      SettingGroupWidget(
        children: [
          Obx(() => ParserTile(
                title: '标签选择器',
                selector: model.tag,
                onlySelector: true,
                onChanged: (value) {
                  rxModel(model.copyWith(tag: value));
                },
              )),
          const SettingDivider(),
          Obx(() => ParserTile(
                title: '标签颜色',
                selector: model.tagColor,
                onChanged: (value) {
                  rxModel(model.copyWith(tagColor: value));
                },
              )),
        ],
      ),
    ];
  }

  List<Widget> _buildCoverList() {
    return [
      const SettingGroupTitle('封面设置'),
      SettingGroupWidget(
        children: [
          Obx(() => ParserTile(
                title: '封面地址',
                selector: model.previewImg.imgUrl,
                onChanged: (value) {
                  rxModel(model.copyWith(
                      previewImg: model.previewImg.copyWith(
                    imgUrl: value,
                  )));
                },
              )),
          const SettingDivider(),
          Obx(() => ParserTile(
                title: '封面宽度',
                selector: model.previewImg.imgWidth,
                onChanged: (value) {
                  rxModel(model.copyWith(
                      previewImg: model.previewImg.copyWith(
                    imgWidth: value,
                  )));
                },
              )),
          const SettingDivider(),
          Obx(() => ParserTile(
                title: '封面高度',
                selector: model.previewImg.imgHeight,
                onChanged: (value) {
                  rxModel(model.copyWith(
                      previewImg: model.previewImg.copyWith(
                    imgHeight: value,
                  )));
                },
              )),
          const SettingDivider(),
          Obx(() => ParserTile(
                title: '封面X偏移',
                selector: model.previewImg.imgX,
                onlySelector: true,
                onChanged: (value) {
                  rxModel(model.copyWith(
                      previewImg: model.previewImg.copyWith(
                    imgX: value,
                  )));
                },
              )),
          const SettingDivider(),
          Obx(() => ParserTile(
                title: '封面Y偏移',
                selector: model.previewImg.imgY,
                onlySelector: true,
                onChanged: (value) {
                  rxModel(model.copyWith(
                      previewImg: model.previewImg.copyWith(
                    imgY: value,
                  )));
                },
              )),
        ],
      ),
    ];
  }

  List<Widget> _buildBaseList() {
    return [
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
        ],
      ),
    ];
  }

  List<Widget> _buildInfoList() {
    return [
      const SettingGroupTitle('信息设置'),
      SettingGroupWidget(
        children: [
          Obx(() => ParserTile(
                title: 'idCode',
                selector: model.idCode,
                onChanged: (value) {
                  rxModel(model.copyWith(idCode: value));
                },
              )),
          const SettingDivider(),
          Obx(() => ParserTile(
                title: '标题',
                selector: model.title,
                onChanged: (value) {
                  rxModel(model.copyWith(title: value));
                },
              )),
          const SettingDivider(),
          Obx(() => ParserTile(
                title: '副标题',
                selector: model.subtitle,
                onChanged: (value) {
                  rxModel(model.copyWith(subtitle: value));
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
          const SettingDivider(),
          Obx(() => ParserTile(
                title: '评分',
                selector: model.star,
                onChanged: (value) {
                  rxModel(model.copyWith(star: value));
                },
              )),
          const SettingDivider(),
          Obx(() => ParserTile(
                title: '面数',
                selector: model.imgCount,
                onChanged: (value) {
                  rxModel(model.copyWith(imgCount: value));
                },
              )),
          const SettingDivider(),
          Obx(() => ParserTile(
                title: '语言',
                selector: model.language,
                onChanged: (value) {
                  rxModel(model.copyWith(language: value));
                },
              )),
        ],
      ),
    ];
  }
}
