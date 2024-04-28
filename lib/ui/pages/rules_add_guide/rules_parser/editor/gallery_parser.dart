import 'package:catweb/ui/pages/rules_add_guide/rules_parser/parser_tile.dart';
import 'package:catweb/ui/widgets/setting_group.dart';
import 'package:flutter/cupertino.dart';
import 'package:catweb/i18n.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DetailParserEditor extends HookWidget {
  const DetailParserEditor({super.key});

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
        ParserTileConsumer(
          title: I.of(context).title,
          selector: (n) => n.detail.title,
          onChanged: (n, v) => n.updateParser(n.detail.copyWith(title: v)),
        ),
        ParserTileConsumer(
          title: I.of(context).subtitle,
          selector: (n) => n.detail.subtitle,
          onChanged: (n, v) => n.updateParser(n.detail.copyWith(subtitle: v)),
        ),
        ParserTileConsumer(
          title: I.of(context).upload_time,
          selector: (n) => n.detail.uploadTime,
          onChanged: (n, v) => n.updateParser(n.detail.copyWith(uploadTime: v)),
        ),
        ParserTileConsumer(
          title: I.of(context).star,
          selector: (n) => n.detail.star,
          onChanged: (n, v) => n.updateParser(n.detail.copyWith(star: v)),
        ),
        ParserTileConsumer(
          title: I.of(context).language,
          selector: (n) => n.detail.language,
          onChanged: (n, v) => n.updateParser(n.detail.copyWith(language: v)),
        ),
        ParserTileConsumer(
          title: I.of(context).description,
          selector: (n) => n.detail.description,
          onChanged: (n, v) =>
              n.updateParser(n.detail.copyWith(description: v)),
        ),
        ParserTileConsumer(
          title: I.of(context).image_count,
          selector: (n) => n.detail.imageCount,
          onChanged: (n, v) => n.updateParser(n.detail.copyWith(imageCount: v)),
        ),
        ParserTileConsumer(
          title: I.of(context).page_count,
          selector: (n) => n.detail.pageCount,
          onChanged: (n, v) => n.updateParser(n.detail.copyWith(pageCount: v)),
        ),
        ParserTileConsumer(
          title: I.of(context).image_pre_page,
          selector: (n) => n.detail.countPrePage,
          onChanged: (n, v) =>
              n.updateParser(n.detail.copyWith(countPrePage: v)),
        ),
        ParserTileConsumer(
          title: '徽章选择器',
          selector: (n) => n.detail.badgeSelector,
          onlySelector: true,
          onChanged: (n, v) =>
              n.updateParser(n.detail.copyWith(badgeSelector: v)),
        ),
        ParserTileConsumer(
          title: '徽章内容',
          selector: (n) => n.detail.badgeItem.text,
          onChanged: (n, v) => n.updateParser(n.detail.copyWith(
            badgeItem: n.detail.badgeItem.copyWith(text: v),
          )),
        ),
        ParserTileConsumer(
          title: '徽章颜色',
          selector: (n) => n.detail.badgeItem.color,
          onChanged: (n, v) => n.updateParser(n.detail.copyWith(
            badgeItem: n.detail.badgeItem.copyWith(color: v),
          )),
        ),
      ],
    );
  }

  Widget _buildCoverList(BuildContext context) {
    return CupertinoListSection.insetGrouped(
      header: SettingGroupTitle(I.of(context).cover),
      hasLeading: false,
      children: [
        ParserTileConsumer(
          title: I.of(context).cover_img,
          selector: (n) => n.detail.coverImage.url,
          onChanged: (n, v) => n.updateParser(n.detail.copyWith(
            coverImage: n.detail.coverImage.copyWith(url: v),
          )),
        ),
        ParserTileConsumer(
          title: I.of(context).cover_width,
          selector: (n) => n.detail.coverImage.width,
          onChanged: (n, v) => n.updateParser(n.detail.copyWith(
            coverImage: n.detail.coverImage.copyWith(width: v),
          )),
        ),
        ParserTileConsumer(
          title: I.of(context).cover_height,
          selector: (n) => n.detail.coverImage.height,
          onChanged: (n, v) => n.updateParser(n.detail.copyWith(
            coverImage: n.detail.coverImage.copyWith(height: v),
          )),
        ),
        ParserTileConsumer(
          title: I.of(context).cover_x,
          selector: (n) => n.detail.coverImage.x,
          onChanged: (n, v) => n.updateParser(n.detail.copyWith(
            coverImage: n.detail.coverImage.copyWith(x: v),
          )),
        ),
        ParserTileConsumer(
          title: I.of(context).cover_y,
          selector: (n) => n.detail.coverImage.y,
          onChanged: (n, v) => n.updateParser(n.detail.copyWith(
            coverImage: n.detail.coverImage.copyWith(y: v),
          )),
        ),
      ],
    );
  }

  Widget _buildTagList(BuildContext context) {
    return CupertinoListSection.insetGrouped(
      header: SettingGroupTitle(I.of(context).badge),
      hasLeading: false,
      children: [
        ParserTileConsumer(
          title: '标签选择器',
          selector: (n) => n.detail.tagSelector,
          onlySelector: true,
          onChanged: (n, v) =>
              n.updateParser(n.detail.copyWith(tagSelector: v)),
        ),
        ParserTileConsumer(
          title: '标签内容',
          selector: (n) => n.detail.tagItem.text,
          onChanged: (n, v) => n.updateParser(n.detail.copyWith(
            tagItem: n.detail.tagItem.copyWith(text: v),
          )),
        ),
        ParserTileConsumer(
          title: '标签颜色',
          selector: (n) => n.detail.tagItem.color,
          onChanged: (n, v) => n.updateParser(n.detail.copyWith(
            tagItem: n.detail.tagItem.copyWith(color: v),
          )),
        ),
        ParserTileConsumer(
          title: '标签分类',
          selector: (n) => n.detail.tagItem.category,
          onChanged: (n, v) => n.updateParser(n.detail.copyWith(
            tagItem: n.detail.tagItem.copyWith(category: v),
          )),
        ),
      ],
    );
  }

  Widget _buildCommentList(BuildContext context) {
    return CupertinoListSection.insetGrouped(
      header: SettingGroupTitle(I.of(context).comment),
      hasLeading: false,
      children: [
        ParserTileConsumer(
          title: I.of(context).comment_item,
          selector: (n) => n.detail.commentSelector,
          onlySelector: true,
          onChanged: (n, v) =>
              n.updateParser(n.detail.copyWith(commentSelector: v)),
        ),
        ParserTileConsumer(
          title: I.of(context).comment_content,
          selector: (n) => n.detail.comments.content,
          onChanged: (n, v) => n.updateParser(n.detail.copyWith(
            comments: n.detail.comments.copyWith(content: v),
          )),
        ),
        ParserTileConsumer(
          title: I.of(context).username,
          selector: (n) => n.detail.comments.username,
          onChanged: (n, v) => n.updateParser(n.detail.copyWith(
            comments: n.detail.comments.copyWith(username: v),
          )),
        ),
        ParserTileConsumer(
          title: I.of(context).comment_time,
          selector: (n) => n.detail.comments.time,
          onChanged: (n, v) => n.updateParser(n.detail.copyWith(
            comments: n.detail.comments.copyWith(time: v),
          )),
        ),
      ],
    );
  }

  Widget _buildThumbnailList(BuildContext context) {
    return CupertinoListSection.insetGrouped(
      header: SettingGroupTitle(I.of(context).thumbnail),
      hasLeading: false,
      children: [
        // ParserTile(
        //   title: I.of(context).thumbnail_selector,
        //   selector: parser.thumbnailSelector,
        //   onlySelector: true,
        // ),
        // ParserTile(
        //   title: I.of(context).thumbnail_target,
        //   selector: parser.target,
        // ),
        // ParserTile(
        //   title: I.of(context).thumbnail_img,
        //   selector: parser.thumbnail.url,
        // ),
        // ParserTile(
        //   title: I.of(context).thumbnail_width,
        //   selector: parser.thumbnail.width,
        // ),
        // ParserTile(
        //   title: I.of(context).thumbnail_height,
        //   selector: parser.thumbnail.height,
        // ),
        // ParserTile(
        //   title: I.of(context).thumbnail_x,
        //   selector: parser.thumbnail.x,
        // ),
        // ParserTile(
        //   title: I.of(context).thumbnail_y,
        //   selector: parser.thumbnail.y,
        // ),
        ParserTileConsumer(
          title: I.of(context).thumbnail_selector,
          selector: (n) => n.detail.thumbnailSelector,
          onlySelector: true,
          onChanged: (n, v) =>
              n.updateParser(n.detail.copyWith(thumbnailSelector: v)),
        ),
        ParserTileConsumer(
          title: I.of(context).thumbnail_target,
          selector: (n) => n.detail.target,
          onChanged: (n, v) => n.updateParser(n.detail.copyWith(target: v)),
        ),
        ParserTileConsumer(
          title: I.of(context).thumbnail_img,
          selector: (n) => n.detail.thumbnail.url,
          onChanged: (n, v) => n.updateParser(n.detail.copyWith(
            thumbnail: n.detail.thumbnail.copyWith(url: v),
          )),
        ),
        ParserTileConsumer(
          title: I.of(context).thumbnail_width,
          selector: (n) => n.detail.thumbnail.width,
          onChanged: (n, v) => n.updateParser(n.detail.copyWith(
            thumbnail: n.detail.thumbnail.copyWith(width: v),
          )),
        ),
        ParserTileConsumer(
          title: I.of(context).thumbnail_height,
          selector: (n) => n.detail.thumbnail.height,
          onChanged: (n, v) => n.updateParser(n.detail.copyWith(
            thumbnail: n.detail.thumbnail.copyWith(height: v),
          )),
        ),
        ParserTileConsumer(
          title: I.of(context).thumbnail_x,
          selector: (n) => n.detail.thumbnail.x,
          onChanged: (n, v) => n.updateParser(n.detail.copyWith(
            thumbnail: n.detail.thumbnail.copyWith(x: v),
          )),
        ),
        ParserTileConsumer(
          title: I.of(context).thumbnail_y,
          selector: (n) => n.detail.thumbnail.y,
          onChanged: (n, v) => n.updateParser(n.detail.copyWith(
            thumbnail: n.detail.thumbnail.copyWith(y: v),
          )),
        ),
      ],
    );
  }

  Widget _buildFlagList(BuildContext context) {
    return CupertinoListSection.insetGrouped(
      header: const SettingGroupTitle('元数据'),
      hasLeading: false,
      children: [
        ParserTileConsumer(
          title: I.of(context).next_page,
          selector: (n) => n.detail.nextPage,
          onChanged: (n, v) => n.updateParser(n.detail.copyWith(nextPage: v)),
        ),
        ParserTileConsumer(
          title: '成功标志',
          selector: (n) => n.detail.successSelector,
          onChanged: (n, v) =>
              n.updateParser(n.detail.copyWith(successSelector: v)),
        ),
        ParserTileConsumer(
          title: '失败标志',
          selector: (n) => n.detail.failedSelector,
          onChanged: (n, v) =>
              n.updateParser(n.detail.copyWith(failedSelector: v)),
        ),
      ],
    );
  }
}
