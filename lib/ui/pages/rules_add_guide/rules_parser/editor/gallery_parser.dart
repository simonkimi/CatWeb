import 'package:catweb/data/models/site_model/parser/parser.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_parser/parser_tile.dart';
import 'package:catweb/ui/pages/setting_page/widgets/setting_tile.dart';
import 'package:catweb/ui/widgets/setting_group.dart';
import 'package:flutter/cupertino.dart';
import 'package:catweb/i18n.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class GalleryParserEditor extends HookWidget {
  const GalleryParserEditor({Key? key, required this.parser}) : super(key: key);

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
      ),
      const SettingDivider(),
      ParserTile(
        title: I.of(context).subtitle,
        selector: model.value.subtitle,
      ),
      const SettingDivider(),
      ParserTile(
        title: I.of(context).upload_time,
        selector: model.value.uploadTime,
      ),
      const SettingDivider(),
      ParserTile(
        title: I.of(context).star,
        selector: model.value.star,
      ),
      const SettingDivider(),
      ParserTile(
        title: I.of(context).language,
        selector: model.value.language,
      ),
      const SettingDivider(),
      ParserTile(
        title: I.of(context).description,
        selector: model.value.description,
      ),
      const SettingDivider(),
      ParserTile(
        title: I.of(context).tag,
        selector: model.value.tag,
      ),
      const SettingDivider(),
      ParserTile(
        title: I.of(context).tag_color,
        selector: model.value.tagColor,
      ),
      const SettingDivider(),
      ParserTile(
        title: I.of(context).image_count,
        selector: model.value.imgCount,
      ),
      const SettingDivider(),
      ParserTile(
        title: I.of(context).page_count,
        selector: model.value.pageCount,
      ),
      const SettingDivider(),
      ParserTile(
        title: I.of(context).image_pre_page,
        selector: model.value.countPrePage,
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
      ),
      const SettingDivider(),
      ParserTile(
        title: I.of(context).cover_width,
        selector: model.value.coverImg.imgWidth,
      ),
      const SettingDivider(),
      ParserTile(
        title: I.of(context).cover_height,
        selector: model.value.coverImg.imgHeight,
      ),
      const SettingDivider(),
      ParserTile(
        title: I.of(context).cover_x,
        selector: model.value.coverImg.imgX,
      ),
      const SettingDivider(),
      ParserTile(
        title: I.of(context).cover_y,
        selector: model.value.coverImg.imgY,
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
      ),
      const SettingDivider(),
      ParserTile(
        title: I.of(context).badge_content,
        selector: model.value.badgeText,
      ),
      const SettingDivider(),
      ParserTile(
        title: I.of(context).badge_type,
        selector: model.value.badgeCategory,
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
      ),
      const SettingDivider(),
      ParserTile(
        title: I.of(context).comment_content,
        selector: model.value.comments.content,
      ),
      const SettingDivider(),
      ParserTile(
        title: I.of(context).username,
        selector: model.value.comments.username,
      ),
      const SettingDivider(),
      ParserTile(
        title: I.of(context).comment_time,
        selector: model.value.comments.time,
      ),
      const SettingDivider(),
      ParserTile(
        title: I.of(context).comment_score,
        selector: model.value.comments.score,
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
      ),
      const SettingDivider(),
      ParserTile(
        title: I.of(context).thumbnail_target,
        selector: model.value.target,
      ),
      const SettingDivider(),
      ParserTile(
        title: I.of(context).thumbnail_img,
        selector: model.value.thumbnail.imgUrl,
      ),
      const SettingDivider(),
      ParserTile(
        title: I.of(context).thumbnail_width,
        selector: model.value.thumbnail.imgWidth,
      ),
      const SettingDivider(),
      ParserTile(
        title: I.of(context).thumbnail_height,
        selector: model.value.thumbnail.imgHeight,
      ),
      const SettingDivider(),
      ParserTile(
        title: I.of(context).thumbnail_x,
        selector: model.value.thumbnail.imgX,
      ),
      const SettingDivider(),
      ParserTile(
        title: I.of(context).thumbnail_y,
        selector: model.value.thumbnail.imgY,
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
      ),
      const SettingDivider(),
      ParserTile(
        title: '成功标志',
        selector: model.value.successSelector,
      ),
      const SettingDivider(),
      ParserTile(
        title: '失败标志',
        selector: model.value.failedSelector,
      ),
    ];
  }
}
