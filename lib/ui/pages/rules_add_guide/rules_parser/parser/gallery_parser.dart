import 'package:catweb/data/protocol/model/parser.dart';
import 'package:catweb/i18n.dart';
import 'package:catweb/ui/widgets/cupertino_input.dart';
import 'package:catweb/ui/widgets/form.dart';
import 'package:catweb/ui/widgets/rules_card.dart';
import 'package:flutter/cupertino.dart';

class GalleryParserFragment extends StatelessWidget {
  const GalleryParserFragment({
    super.key,
    required this.model,
  });

  final GalleryParserModel model;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        _buildBaseList(context),
        _buildInfoList(context),
        _buildCoverList(context),
        _buildTagList(context),
        _buildThumbnailList(context),
        _buildBadgeList(context),
        _buildCommentList(context),
        _buildChapterList(context),
        _buildIndexList(context),
      ],
    );
  }

  SliverList _buildBaseList(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        RulesCard(title: I.of(context).basic_setting, children: [
          CupertinoFormInput(
            label: I.of(context).name,
            value: model.name,
          )
        ]),
      ]),
    );
  }

  StickyClassifyList _buildIndexList(BuildContext context) {
    return StickyClassifyList(
      title: I.of(context).index,
      children: [
        RulesForm(
          title: I.of(context).next_page,
          selectorModel: model.nextPage,
        ),
      ],
    );
  }

  StickyClassifyList _buildBadgeList(BuildContext context) {
    return StickyClassifyList(
      title: I.of(context).badge,
      children: [
        RulesForm(
          title: I.of(context).badge_item,
          selectorModel: model.badgeSelector,
        ),
        RulesForm(
          title: I.of(context).badge_content,
          selectorModel: model.badgeText,
        ),
        RulesForm(
          title: I.of(context).badge_type,
          selectorModel: model.badgeCategory,
        ),
      ],
    );
  }

  StickyClassifyList _buildCommentList(BuildContext context) {
    return StickyClassifyList(title: I.of(context).comment, children: [
      RulesForm(
        title: I.of(context).comment_item,
        selectorModel: model.commentSelector,
      ),
      RulesForm(
        title: I.of(context).comment_content,
        selectorModel: model.comments.content,
      ),
      RulesForm(
        title: I.of(context).username,
        selectorModel: model.comments.username,
      ),
      RulesForm(
        title: I.of(context).comment_time,
        selectorModel: model.comments.time,
      ),
      RulesForm(
        title: I.of(context).comment_score,
        selectorModel: model.comments.score,
      ),
    ]);
  }

  StickyClassifyList _buildTagList(BuildContext context) {
    return StickyClassifyList(title: I.of(context).tag, children: [
      RulesForm(
        title: I.of(context).tag,
        selectorModel: model.tag,
      ),
      RulesForm(
        title: I.of(context).tag_color,
        selectorModel: model.tagColor,
      ),
    ]);
  }

  StickyClassifyList _buildChapterList(BuildContext context) {
    return StickyClassifyList(title: '章节', children: [
      RulesForm(
        title: '章节选择器',
        selectorModel: model.chapterSelector,
      ),
      RulesForm(
        title: '章节标题',
        selectorModel: model.chapterTitle,
      ),
      RulesForm(
        title: '章节副标题',
        selectorModel: model.chapterSubtitle,
      ),
      RulesForm(
        title: '章节封面',
        selectorModel: model.chapterCover.imgUrl,
      ),
      RulesForm(
        title: '章节图宽度',
        selectorModel: model.chapterCover.imgWidth,
      ),
      RulesForm(
        title: '章节图高度',
        selectorModel: model.chapterCover.imgHeight,
      ),
      RulesForm(
        title: '章节图X偏移',
        selectorModel: model.chapterCover.imgX,
      ),
      RulesForm(
        title: '章节图Y偏移',
        selectorModel: model.chapterCover.imgY,
      ),
    ]);
  }

  StickyClassifyList _buildThumbnailList(BuildContext context) {
    return StickyClassifyList(title: I.of(context).thumbnail, children: [
      RulesForm(
        title: I.of(context).thumbnail_target,
        selectorModel: model.target,
      ),
      RulesForm(
        title: I.of(context).thumbnail_selector,
        selectorModel: model.thumbnailSelector,
      ),
      RulesForm(
        title: I.of(context).thumbnail_img,
        selectorModel: model.thumbnail.imgUrl,
      ),
      RulesForm(
        title: I.of(context).thumbnail_width,
        selectorModel: model.thumbnail.imgWidth,
      ),
      RulesForm(
        title: I.of(context).thumbnail_height,
        selectorModel: model.thumbnail.imgHeight,
      ),
      RulesForm(
        title: I.of(context).thumbnail_x,
        selectorModel: model.thumbnail.imgX,
      ),
      RulesForm(
        title: I.of(context).thumbnail_y,
        selectorModel: model.thumbnail.imgY,
      ),
    ]);
  }

  StickyClassifyList _buildCoverList(BuildContext context) {
    return StickyClassifyList(
      title: I.of(context).cover,
      children: [
        RulesForm(
          title: I.of(context).cover_img,
          selectorModel: model.coverImg.imgUrl,
        ),
        RulesForm(
          title: I.of(context).cover_width,
          selectorModel: model.coverImg.imgWidth,
        ),
        RulesForm(
          title: I.of(context).cover_height,
          selectorModel: model.coverImg.imgHeight,
        ),
        RulesForm(
          title: I.of(context).cover_x,
          selectorModel: model.coverImg.imgX,
        ),
        RulesForm(
          title: I.of(context).cover_y,
          selectorModel: model.coverImg.imgY,
        ),
      ],
    );
  }

  StickyClassifyList _buildInfoList(BuildContext context) {
    return StickyClassifyList(title: I.of(context).basic_setting, children: [
      RulesForm(
        title: I.of(context).title,
        selectorModel: model.title,
      ),
      RulesForm(
        title: I.of(context).subtitle,
        selectorModel: model.subtitle,
      ),
      RulesForm(
        title: I.of(context).upload_time,
        selectorModel: model.uploadTime,
      ),
      RulesForm(
        title: I.of(context).star,
        selectorModel: model.star,
      ),
      RulesForm(
        title: I.of(context).language,
        selectorModel: model.language,
      ),
      RulesForm(
        title: I.of(context).description,
        selectorModel: model.description,
      ),
      RulesForm(
        title: I.of(context).image_count,
        selectorModel: model.imgCount,
      ),
      RulesForm(
        title: I.of(context).page_count,
        selectorModel: model.pageCount,
      ),
      RulesForm(
        title: I.of(context).image_pre_page,
        selectorModel: model.countPrePage,
      ),
    ]);
  }
}
