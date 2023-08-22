import 'package:catweb/data/models/site_model/parser/parser.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_parser/parser_tile.dart';
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
      children: [
        _buildInfoList(context),
        _buildCoverList(context),
        _buildTagList(context),
        _buildCommentList(context),
        _buildThumbnailList(context),
        _buildFlagList(context),
      ],
    );
  }

  Widget _buildInfoList(BuildContext context) {
    return CupertinoListSection.insetGrouped(
      header: SettingGroupTitle(I.of(context).basic_setting),
      hasLeading: false,
      children: [
        ParserTile(
          title: I.of(context).title,
          selector: parser.title,
        ),
        ParserTile(
          title: I.of(context).subtitle,
          selector: parser.subtitle,
        ),
        ParserTile(
          title: I.of(context).upload_time,
          selector: parser.uploadTime,
        ),
        ParserTile(
          title: I.of(context).star,
          selector: parser.star,
        ),
        ParserTile(
          title: I.of(context).language,
          selector: parser.language,
        ),
        ParserTile(
          title: I.of(context).description,
          selector: parser.description,
        ),
        ParserTile(
          title: I.of(context).image_count,
          selector: parser.imageCount,
        ),
        ParserTile(
          title: I.of(context).page_count,
          selector: parser.pageCount,
        ),
        ParserTile(
          title: I.of(context).image_pre_page,
          selector: parser.countPrePage,
        ),
        ParserTile(
          title: '徽章选择器',
          selector: parser.badgeSelector,
        ),
        ParserTile(
          title: '徽章内容',
          selector: parser.badgeItem.text,
        ),
        ParserTile(
          title: '徽章颜色',
          selector: parser.badgeItem.color,
        ),
      ],
    );
  }

  Widget _buildCoverList(BuildContext context) {
    return CupertinoListSection.insetGrouped(
      header: SettingGroupTitle(I.of(context).cover),
      hasLeading: false,
      children: [
        ParserTile(
          title: I.of(context).cover_img,
          selector: parser.coverImage.url,
        ),
        ParserTile(
          title: I.of(context).cover_width,
          selector: parser.coverImage.width,
        ),
        ParserTile(
          title: I.of(context).cover_height,
          selector: parser.coverImage.height,
        ),
        ParserTile(
          title: I.of(context).cover_x,
          selector: parser.coverImage.x,
        ),
        ParserTile(
          title: I.of(context).cover_y,
          selector: parser.coverImage.y,
        ),
      ],
    );
  }

  Widget _buildTagList(BuildContext context) {
    return CupertinoListSection.insetGrouped(
      header: SettingGroupTitle(I.of(context).badge),
      hasLeading: false,
      children: [
        ParserTile(
          title: I.of(context).badge_item,
          onlySelector: true,
          selector: parser.badgeSelector,
        ),
        ParserTile(
          title: '标签选择器',
          selector: parser.tagSelector,
        ),
        ParserTile(
          title: '标签内容',
          selector: parser.tagItem.text,
        ),
        ParserTile(
          title: '标签颜色',
          selector: parser.tagItem.color,
        ),
        ParserTile(
          title: '标签分类',
          selector: parser.tagItem.category,
        ),
      ],
    );
  }

  Widget _buildCommentList(BuildContext context) {
    return CupertinoListSection.insetGrouped(
      header: SettingGroupTitle(I.of(context).comment),
      hasLeading: false,
      children: [
        ParserTile(
          title: I.of(context).comment_item,
          onlySelector: true,
          selector: parser.commentSelector,
        ),
        ParserTile(
          title: I.of(context).comment_content,
          selector: parser.comments.content,
        ),
        ParserTile(
          title: I.of(context).username,
          selector: parser.comments.username,
        ),
        ParserTile(
          title: I.of(context).comment_time,
          selector: parser.comments.time,
        ),
        ParserTile(
          title: I.of(context).comment_score,
          selector: parser.comments.score,
        ),
      ],
    );
  }

  Widget _buildThumbnailList(BuildContext context) {
    return CupertinoListSection.insetGrouped(
      header: SettingGroupTitle(I.of(context).thumbnail),
      hasLeading: false,
      children: [
        ParserTile(
          title: I.of(context).thumbnail_selector,
          selector: parser.thumbnailSelector,
          onlySelector: true,
        ),
        ParserTile(
          title: I.of(context).thumbnail_target,
          selector: parser.target,
        ),
        ParserTile(
          title: I.of(context).thumbnail_img,
          selector: parser.thumbnail.url,
        ),
        ParserTile(
          title: I.of(context).thumbnail_width,
          selector: parser.thumbnail.width,
        ),
        ParserTile(
          title: I.of(context).thumbnail_height,
          selector: parser.thumbnail.height,
        ),
        ParserTile(
          title: I.of(context).thumbnail_x,
          selector: parser.thumbnail.x,
        ),
        ParserTile(
          title: I.of(context).thumbnail_y,
          selector: parser.thumbnail.y,
        ),
      ],
    );
  }

  Widget _buildFlagList(BuildContext context) {
    return CupertinoListSection.insetGrouped(
      header: const SettingGroupTitle('元数据'),
      hasLeading: false,
      children: [
        ParserTile(
          title: I.of(context).next_page,
          selector: parser.nextPage,
        ),
        ParserTile(
          title: '成功标志',
          selector: parser.successSelector,
        ),
        ParserTile(
          title: '失败标志',
          selector: parser.failedSelector,
        ),
      ],
    );
  }
}
