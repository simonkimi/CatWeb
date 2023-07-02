import 'package:catweb/data/models/site_model/parser/parser.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_parser/parser_tile.dart';
import 'package:catweb/ui/pages/setting_page/widgets/setting_tile.dart';
import 'package:catweb/ui/widgets/setting_group.dart';
import 'package:flutter/cupertino.dart';
import 'package:catweb/i18n.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class GalleryParserEditor extends HookWidget {
  GalleryParserEditor({Key? key, GalleryParser? parser})
      : parser = parser ?? GalleryParser(name: '列表', uuid: ''),
        super(key: key);

  final GalleryParser parser;

  @override
  Widget build(BuildContext context) {
    final model = useState(parser);

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      children: [
        ..._buildInfoList(model, context),
        ..._buildCoverList(model, context),
        ..._buildTagList(model, context),
        ..._buildCommentList(model, context),
        ..._buildThumbnailList(model, context),
        ..._buildFlagList(model, context),
      ],
    );
  }

  List<Widget> _buildInfoList(
      ValueNotifier<GalleryParser> model, BuildContext context) {
    return [
      const SizedBox(height: 5),
      SettingGroupTitle(I.of(context).basic_setting),
      ParserTile(
        title: I.of(context).title,
        selector: model.value.title,
        onChanged: (value) {
          model.value = model.value.copyWith(title: value);
        },
      ),
      const SettingDivider(),
      ParserTile(
        title: I.of(context).subtitle,
        selector: model.value.subtitle,
        onChanged: (value) {
          model.value = model.value.copyWith(subtitle: value);
        },
      ),
      const SettingDivider(),
      ParserTile(
        title: I.of(context).upload_time,
        selector: model.value.uploadTime,
        onChanged: (value) {
          model.value = model.value.copyWith(uploadTime: value);
        },
      ),
      const SettingDivider(),
      ParserTile(
        title: I.of(context).star,
        selector: model.value.star,
        onChanged: (value) {
          model.value = model.value.copyWith(star: value);
        },
      ),
      const SettingDivider(),
      ParserTile(
        title: I.of(context).language,
        selector: model.value.language,
        onChanged: (value) {
          model.value = model.value.copyWith(language: value);
        },
      ),
      const SettingDivider(),
      ParserTile(
        title: I.of(context).description,
        selector: model.value.description,
        onChanged: (value) {
          model.value = model.value.copyWith(description: value);
        },
      ),
      const SettingDivider(),
      ParserTile(
        title: I.of(context).tag,
        selector: model.value.tag,
        onChanged: (value) {
          model.value = model.value.copyWith(tag: value);
        },
      ),
      const SettingDivider(),
      ParserTile(
        title: I.of(context).tag_color,
        selector: model.value.tagColor,
        onChanged: (value) {
          model.value = model.value.copyWith(tagColor: value);
        },
      ),
      const SettingDivider(),
      ParserTile(
        title: I.of(context).image_count,
        selector: model.value.imgCount,
        onChanged: (value) {
          model.value = model.value.copyWith(imgCount: value);
        },
      ),
      const SettingDivider(),
      ParserTile(
        title: I.of(context).page_count,
        selector: model.value.pageCount,
        onChanged: (value) {
          model.value = model.value.copyWith(pageCount: value);
        },
      ),
      const SettingDivider(),
      ParserTile(
        title: I.of(context).image_pre_page,
        selector: model.value.countPrePage,
        onChanged: (value) {
          model.value = model.value.copyWith(countPrePage: value);
        },
      ),
    ];
  }

  List<Widget> _buildCoverList(
      ValueNotifier<GalleryParser> model, BuildContext context) {
    return [
      const SizedBox(height: 5),
      SettingGroupTitle(I.of(context).cover),
      ParserTile(
        title: I.of(context).cover_img,
        selector: model.value.coverImg.imgUrl,
        onChanged: (value) {
          model.value = model.value
              .copyWith(coverImg: model.value.coverImg.copyWith(imgUrl: value));
        },
      ),
      const SettingDivider(),
      ParserTile(
        title: I.of(context).cover_width,
        selector: model.value.coverImg.imgWidth,
        onChanged: (value) {
          model.value = model.value.copyWith(
              coverImg: model.value.coverImg.copyWith(imgWidth: value));
        },
      ),
      const SettingDivider(),
      ParserTile(
        title: I.of(context).cover_height,
        selector: model.value.coverImg.imgHeight,
        onChanged: (value) {
          model.value = model.value.copyWith(
              coverImg: model.value.coverImg.copyWith(imgHeight: value));
        },
      ),
      const SettingDivider(),
      ParserTile(
        title: I.of(context).cover_x,
        selector: model.value.coverImg.imgX,
        onChanged: (value) {
          model.value = model.value
              .copyWith(coverImg: model.value.coverImg.copyWith(imgX: value));
        },
      ),
      const SettingDivider(),
      ParserTile(
        title: I.of(context).cover_y,
        selector: model.value.coverImg.imgY,
        onChanged: (value) {
          model.value = model.value
              .copyWith(coverImg: model.value.coverImg.copyWith(imgY: value));
        },
      ),
    ];
  }

  List<Widget> _buildTagList(
      ValueNotifier<GalleryParser> model, BuildContext context) {
    return [
      const SizedBox(height: 5),
      SettingGroupTitle(I.of(context).badge),
      ParserTile(
        title: I.of(context).badge_item,
        onlySelector: true,
        selector: model.value.badgeSelector,
        onChanged: (value) {
          model.value = model.value.copyWith(badgeSelector: value);
        },
      ),
      const SettingDivider(),
      ParserTile(
        title: I.of(context).badge_content,
        selector: model.value.badgeText,
        onChanged: (value) {
          model.value = model.value.copyWith(badgeText: value);
        },
      ),
      const SettingDivider(),
      ParserTile(
        title: I.of(context).badge_type,
        selector: model.value.badgeCategory,
        onChanged: (value) {
          model.value = model.value.copyWith(badgeCategory: value);
        },
      ),
    ];
  }

  List<Widget> _buildCommentList(
      ValueNotifier<GalleryParser> model, BuildContext context) {
    return [
      const SizedBox(height: 5),
      SettingGroupTitle(I.of(context).comment),
      ParserTile(
        title: I.of(context).comment_item,
        onlySelector: true,
        selector: model.value.commentSelector,
        onChanged: (value) {
          model.value = model.value.copyWith(commentSelector: value);
        },
      ),
      const SettingDivider(),
      ParserTile(
        title: I.of(context).comment_content,
        selector: model.value.comments.content,
        onChanged: (value) {
          model.value = model.value.copyWith(
              comments: model.value.comments.copyWith(content: value));
        },
      ),
      const SettingDivider(),
      ParserTile(
        title: I.of(context).username,
        selector: model.value.comments.username,
        onChanged: (value) {
          model.value = model.value.copyWith(
              comments: model.value.comments.copyWith(username: value));
        },
      ),
      const SettingDivider(),
      ParserTile(
        title: I.of(context).comment_time,
        selector: model.value.comments.time,
        onChanged: (value) {
          model.value = model.value
              .copyWith(comments: model.value.comments.copyWith(time: value));
        },
      ),
      const SettingDivider(),
      ParserTile(
        title: I.of(context).comment_score,
        selector: model.value.comments.score,
        onChanged: (value) {
          model.value = model.value
              .copyWith(comments: model.value.comments.copyWith(score: value));
        },
      ),
    ];
  }

  List<Widget> _buildThumbnailList(
      ValueNotifier<GalleryParser> model, BuildContext context) {
    return [
      const SizedBox(height: 5),
      SettingGroupTitle(I.of(context).thumbnail),
      ParserTile(
        title: I.of(context).thumbnail_selector,
        selector: model.value.thumbnailSelector,
        onlySelector: true,
        onChanged: (value) {
          model.value = model.value.copyWith(thumbnailSelector: value);
        },
      ),
      const SettingDivider(),
      ParserTile(
        title: I.of(context).thumbnail_target,
        selector: model.value.target,
        onChanged: (value) {
          model.value = model.value.copyWith(target: value);
        },
      ),
      const SettingDivider(),
      ParserTile(
        title: I.of(context).thumbnail_img,
        selector: model.value.thumbnail.imgUrl,
        onChanged: (value) {
          model.value = model.value.copyWith(
              thumbnail: model.value.thumbnail.copyWith(imgUrl: value));
        },
      ),
      const SettingDivider(),
      ParserTile(
        title: I.of(context).thumbnail_width,
        selector: model.value.thumbnail.imgWidth,
        onChanged: (value) {
          model.value = model.value.copyWith(
              thumbnail: model.value.thumbnail.copyWith(imgWidth: value));
        },
      ),
      const SettingDivider(),
      ParserTile(
        title: I.of(context).thumbnail_height,
        selector: model.value.thumbnail.imgHeight,
        onChanged: (value) {
          model.value = model.value.copyWith(
              thumbnail: model.value.thumbnail.copyWith(imgHeight: value));
        },
      ),
      const SettingDivider(),
      ParserTile(
        title: I.of(context).thumbnail_x,
        selector: model.value.thumbnail.imgX,
        onChanged: (value) {
          model.value = model.value
              .copyWith(thumbnail: model.value.thumbnail.copyWith(imgX: value));
        },
      ),
      const SettingDivider(),
      ParserTile(
        title: I.of(context).thumbnail_y,
        selector: model.value.thumbnail.imgY,
        onChanged: (value) {
          model.value = model.value
              .copyWith(thumbnail: model.value.thumbnail.copyWith(imgY: value));
        },
      ),
    ];
  }

  List<Widget> _buildFlagList(
      ValueNotifier<GalleryParser> model, BuildContext context) {
    return [
      const SizedBox(height: 5),
      const SettingGroupTitle('元数据'),
      ParserTile(
        title: I.of(context).next_page,
        selector: model.value.nextPage,
        onChanged: (value) {
          model.value = model.value.copyWith(nextPage: value);
        },
      ),
      const SettingDivider(),
      ParserTile(
        title: '成功标志',
        selector: model.value.successSelector,
        onChanged: (value) {
          model.value = model.value.copyWith(successSelector: value);
        },
      ),
      const SettingDivider(),
      ParserTile(
        title: '失败标志',
        selector: model.value.failedSelector,
        onChanged: (value) {
          model.value = model.value.copyWith(failedSelector: value);
        },
      ),
    ];
  }
}
