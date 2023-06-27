import 'package:catweb/data/models/site_model/parser/parser.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_parser/parser_tile.dart';
import 'package:catweb/ui/pages/setting_page/widgets/setting_tile.dart';
import 'package:catweb/ui/widgets/setting_group.dart';
import 'package:flutter/cupertino.dart';
import 'package:catweb/i18n.dart';
import 'package:get/get.dart';

class GalleryParserEditor extends StatelessWidget {
  GalleryParserEditor({Key? key}) : super(key: key);

  final Rx<GalleryParser> rxModel = GalleryParser(name: '列表', uuid: '').obs;

  GalleryParser get model => rxModel.value;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10 ),
      children: [
        ..._buildInfoList(context),
        ..._buildCoverList(context),
        ..._buildTagList(context),
        ..._buildCommentList(context),
        ..._buildThumbnailList(context),
        ..._buildFlagList(context),
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
            title: I.of(context).tag,
            selector: model.tag,
            onChanged: (value) {
              rxModel(model.copyWith(tag: value));
            },
          )),
      const SettingDivider(),
      Obx(() => ParserTile(
            title: I.of(context).tag_color,
            selector: model.tagColor,
            onChanged: (value) {
              rxModel(model.copyWith(tagColor: value));
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
      const SizedBox(height: 5),
      SettingGroupTitle(I.of(context).cover),
      Obx(() => ParserTile(
            title: I.of(context).cover_img,
            selector: model.coverImg.imgUrl,
            onChanged: (value) {
              rxModel(model.copyWith(
                  coverImg: model.coverImg.copyWith(imgUrl: value)));
            },
          )),
      const SettingDivider(),
      Obx(() => ParserTile(
            title: I.of(context).cover_width,
            selector: model.coverImg.imgWidth,
            onChanged: (value) {
              rxModel(model.copyWith(
                  coverImg: model.coverImg.copyWith(imgWidth: value)));
            },
          )),
      const SettingDivider(),
      Obx(() => ParserTile(
            title: I.of(context).cover_height,
            selector: model.coverImg.imgHeight,
            onChanged: (value) {
              rxModel(model.copyWith(
                  coverImg: model.coverImg.copyWith(imgHeight: value)));
            },
          )),
      const SettingDivider(),
      Obx(() => ParserTile(
            title: I.of(context).cover_x,
            selector: model.coverImg.imgX,
            onChanged: (value) {
              rxModel(model.copyWith(
                  coverImg: model.coverImg.copyWith(imgX: value)));
            },
          )),
      const SettingDivider(),
      Obx(() => ParserTile(
            title: I.of(context).cover_y,
            selector: model.coverImg.imgY,
            onChanged: (value) {
              rxModel(model.copyWith(
                  coverImg: model.coverImg.copyWith(imgY: value)));
            },
          )),
    ];
  }

  List<Widget> _buildTagList(BuildContext context) {
    return [
      const SizedBox(height: 5),
      SettingGroupTitle(I.of(context).badge),
      Obx(() => ParserTile(
            title: I.of(context).badge_item,
            onlySelector: true,
            selector: model.badgeSelector,
            onChanged: (value) {
              rxModel(model.copyWith(badgeSelector: value));
            },
          )),
      const SettingDivider(),
      Obx(() => ParserTile(
            title: I.of(context).badge_content,
            selector: model.badgeText,
            onChanged: (value) {
              rxModel(model.copyWith(badgeText: value));
            },
          )),
      const SettingDivider(),
      Obx(() => ParserTile(
            title: I.of(context).badge_type,
            selector: model.badgeCategory,
            onChanged: (value) {
              rxModel(model.copyWith(badgeCategory: value));
            },
          )),
    ];
  }

  List<Widget> _buildCommentList(BuildContext context) {
    return [
      const SizedBox(height: 5),
      SettingGroupTitle(I.of(context).comment),
      Obx(() => ParserTile(
            title: I.of(context).comment_item,
            onlySelector: true,
            selector: model.commentSelector,
            onChanged: (value) {
              rxModel(model.copyWith(commentSelector: value));
            },
          )),
      const SettingDivider(),
      Obx(() => ParserTile(
            title: I.of(context).comment_content,
            selector: model.comments.content,
            onChanged: (value) {
              rxModel(model.copyWith(
                  comments: model.comments.copyWith(content: value)));
            },
          )),
      const SettingDivider(),
      Obx(() => ParserTile(
            title: I.of(context).username,
            selector: model.comments.username,
            onChanged: (value) {
              rxModel(model.copyWith(
                  comments: model.comments.copyWith(username: value)));
            },
          )),
      const SettingDivider(),
      Obx(() => ParserTile(
            title: I.of(context).comment_time,
            selector: model.comments.time,
            onChanged: (value) {
              rxModel(model.copyWith(
                  comments: model.comments.copyWith(time: value)));
            },
          )),
      const SettingDivider(),
      Obx(() => ParserTile(
            title: I.of(context).comment_score,
            selector: model.comments.score,
            onChanged: (value) {
              rxModel(model.copyWith(
                  comments: model.comments.copyWith(score: value)));
            },
          )),
    ];
  }

  List<Widget> _buildThumbnailList(BuildContext context) {
    return [
      const SizedBox(height: 5),
      SettingGroupTitle(I.of(context).thumbnail),
      Obx(() => ParserTile(
            title: I.of(context).thumbnail_selector,
            selector: model.thumbnailSelector,
            onlySelector: true,
            onChanged: (value) {
              rxModel(model.copyWith(thumbnailSelector: value));
            },
          )),
      const SettingDivider(),
      Obx(() => ParserTile(
            title: I.of(context).thumbnail_target,
            selector: model.target,
            onChanged: (value) {
              rxModel(model.copyWith(target: value));
            },
          )),
      const SettingDivider(),
      Obx(() => ParserTile(
            title: I.of(context).thumbnail_img,
            selector: model.thumbnail.imgUrl,
            onChanged: (value) {
              rxModel(model.copyWith(
                  thumbnail: model.thumbnail.copyWith(imgUrl: value)));
            },
          )),
      const SettingDivider(),
      Obx(() => ParserTile(
            title: I.of(context).thumbnail_width,
            selector: model.thumbnail.imgWidth,
            onChanged: (value) {
              rxModel(model.copyWith(
                  thumbnail: model.thumbnail.copyWith(imgWidth: value)));
            },
          )),
      const SettingDivider(),
      Obx(() => ParserTile(
            title: I.of(context).thumbnail_height,
            selector: model.thumbnail.imgHeight,
            onChanged: (value) {
              rxModel(model.copyWith(
                  thumbnail: model.thumbnail.copyWith(imgHeight: value)));
            },
          )),
      const SettingDivider(),
      Obx(() => ParserTile(
            title: I.of(context).thumbnail_x,
            selector: model.thumbnail.imgX,
            onChanged: (value) {
              rxModel(model.copyWith(
                  thumbnail: model.thumbnail.copyWith(imgX: value)));
            },
          )),
      const SettingDivider(),
      Obx(() => ParserTile(
            title: I.of(context).thumbnail_y,
            selector: model.thumbnail.imgY,
            onChanged: (value) {
              rxModel(model.copyWith(
                  thumbnail: model.thumbnail.copyWith(imgY: value)));
            },
          )),
    ];
  }

  List<Widget> _buildFlagList(BuildContext context) {
    return [
      const SizedBox(height: 5),
      const SettingGroupTitle('元数据'),
      Obx(() => ParserTile(
            title: I.of(context).next_page,
            selector: model.nextPage,
            onChanged: (value) {
              rxModel(model.copyWith(nextPage: value));
            },
          )),
      const SettingDivider(),
      Obx(() => ParserTile(
            title: '成功标志',
            selector: model.successSelector,
            onChanged: (value) {
              rxModel(model.copyWith(successSelector: value));
            },
          )),
      const SettingDivider(),
      Obx(() => ParserTile(
            title: '失败标志',
            selector: model.failedSelector,
            onChanged: (value) {
              rxModel(model.copyWith(failedSelector: value));
            },
          )),
    ];
  }
}
