import 'package:catweb/data/models/site_model/parser/parser.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_parser/parser_tile.dart';
import 'package:catweb/ui/pages/setting_page/widgets/setting_tile.dart';
import 'package:catweb/ui/widgets/setting_group.dart';
import 'package:flutter/cupertino.dart';
import 'package:catweb/i18n.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DetailParserEditor extends HookWidget {
  const DetailParserEditor({Key? key, required this.parser}) : super(key: key);

  final DetailParser parser;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
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
      ParserTile(
        title: I.of(context).title,
        selector: parser.title,
      ),
      const SettingDivider(),
      ParserTile(
        title: I.of(context).subtitle,
        selector: parser.subtitle,
      ),
      const SettingDivider(),
      ParserTile(
        title: I.of(context).upload_time,
        selector: parser.uploadTime,
      ),
      const SettingDivider(),
      ParserTile(
        title: I.of(context).star,
        selector: parser.star,
      ),
      const SettingDivider(),
      ParserTile(
        title: I.of(context).language,
        selector: parser.language,
      ),
      const SettingDivider(),
      ParserTile(
        title: I.of(context).description,
        selector: parser.description,
      ),
      const SettingDivider(),
      ParserTile(
        title: I.of(context).image_count,
        selector: parser.imageCount,
      ),
      const SettingDivider(),
      ParserTile(
        title: I.of(context).page_count,
        selector: parser.pageCount,
      ),
      const SettingDivider(),
      ParserTile(
        title: I.of(context).image_pre_page,
        selector: parser.countPrePage,
      ),
      const SettingDivider(),
      ParserTile(
        title: '徽章选择器',
        selector: parser.badgeSelector,
      ),
      const SettingDivider(),
      ParserTile(
        title: '徽章内容',
        selector: parser.badgeItem.text,
      ),
      const SettingDivider(),
      ParserTile(
        title: '徽章颜色',
        selector: parser.badgeItem.color,
      ),
    ];
  }

  List<Widget> _buildCoverList(BuildContext context) {
    return [
      const SizedBox(height: 5),
      SettingGroupTitle(I.of(context).cover),
      ParserTile(
        title: I.of(context).cover_img,
        selector: parser.coverImage.url,
      ),
      const SettingDivider(),
      ParserTile(
        title: I.of(context).cover_width,
        selector: parser.coverImage.width,
      ),
      const SettingDivider(),
      ParserTile(
        title: I.of(context).cover_height,
        selector: parser.coverImage.height,
      ),
      const SettingDivider(),
      ParserTile(
        title: I.of(context).cover_x,
        selector: parser.coverImage.x,
      ),
      const SettingDivider(),
      ParserTile(
        title: I.of(context).cover_y,
        selector: parser.coverImage.y,
      ),
    ];
  }

  List<Widget> _buildTagList(BuildContext context) {
    return [
      const SizedBox(height: 5),
      SettingGroupTitle(I.of(context).badge),
      ParserTile(
        title: I.of(context).badge_item,
        onlySelector: true,
        selector: parser.badgeSelector,
      ),
      const SettingDivider(),
      ParserTile(
        title: '标签选择器',
        selector: parser.tagSelector,
      ),
      const SettingDivider(),
      ParserTile(
        title: '标签内容',
        selector: parser.tagItem.text,
      ),
      const SettingDivider(),
      ParserTile(
        title: '标签颜色',
        selector: parser.tagItem.color,
      ),
      const SettingDivider(),
      ParserTile(
        title: '标签分类',
        selector: parser.tagItem.category,
      ),
    ];
  }

  List<Widget> _buildCommentList(BuildContext context) {
    return [
      const SizedBox(height: 5),
      SettingGroupTitle(I.of(context).comment),
      ParserTile(
        title: I.of(context).comment_item,
        onlySelector: true,
        selector: parser.commentSelector,
      ),
      const SettingDivider(),
      ParserTile(
        title: I.of(context).comment_content,
        selector: parser.comments.content,
      ),
      const SettingDivider(),
      ParserTile(
        title: I.of(context).username,
        selector: parser.comments.username,
      ),
      const SettingDivider(),
      ParserTile(
        title: I.of(context).comment_time,
        selector: parser.comments.time,
      ),
      const SettingDivider(),
      ParserTile(
        title: I.of(context).comment_score,
        selector: parser.comments.score,
      ),
    ];
  }

  List<Widget> _buildThumbnailList(BuildContext context) {
    return [
      const SizedBox(height: 5),
      SettingGroupTitle(I.of(context).thumbnail),
      ParserTile(
        title: I.of(context).thumbnail_selector,
        selector: parser.thumbnailSelector,
        onlySelector: true,
      ),
      const SettingDivider(),
      ParserTile(
        title: I.of(context).thumbnail_target,
        selector: parser.target,
      ),
      const SettingDivider(),
      ParserTile(
        title: I.of(context).thumbnail_img,
        selector: parser.thumbnail.url,
      ),
      const SettingDivider(),
      ParserTile(
        title: I.of(context).thumbnail_width,
        selector: parser.thumbnail.width,
      ),
      const SettingDivider(),
      ParserTile(
        title: I.of(context).thumbnail_height,
        selector: parser.thumbnail.height,
      ),
      const SettingDivider(),
      ParserTile(
        title: I.of(context).thumbnail_x,
        selector: parser.thumbnail.x,
      ),
      const SettingDivider(),
      ParserTile(
        title: I.of(context).thumbnail_y,
        selector: parser.thumbnail.y,
      ),
    ];
  }

  List<Widget> _buildFlagList(BuildContext context) {
    return [
      const SizedBox(height: 5),
      const SettingGroupTitle('元数据'),
      ParserTile(
        title: I.of(context).next_page,
        selector: parser.nextPage,
      ),
      const SettingDivider(),
      ParserTile(
        title: '成功标志',
        selector: parser.successSelector,
      ),
      const SettingDivider(),
      ParserTile(
        title: '失败标志',
        selector: parser.failedSelector,
      ),
    ];
  }
}
