import 'package:catweb/data/protocol/model/parser.dart';
import 'package:catweb/ui/components/cupertino_input.dart';
import 'package:catweb/ui/components/form.dart';
import 'package:catweb/ui/components/rules_card.dart';
import 'package:flutter/cupertino.dart';

class GalleryParserFragment extends StatelessWidget {
  const GalleryParserFragment({
    Key? key,
    required this.model,
  }) : super(key: key);

  final DetailParserModel model;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        _buildBaseList(context),
        _buildInfoList(),
        _buildCoverList(),
        _buildTagList(),
        _buildThumbnailList(),
        _buildBadgeList(),
        _buildCommentList(),
        _buildChapterList(),
        _buildIndexList(),
      ],
    );
  }

  SliverList _buildBaseList(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        RulesCard(title: '基础信息', children: [
          CupertinoFormInput(
            label: '名称',
            value: model.name,
          )
        ]),
      ]),
    );
  }

  StickyClassifyList _buildIndexList() {
    return StickyClassifyList(
      title: '索引',
      children: [
        RulesForm(
          title: '下一面',
          selectorModel: model.nextPage,
        ),
      ],
    );
  }

  StickyClassifyList _buildBadgeList() {
    return StickyClassifyList(
      title: '徽章',
      children: [
        RulesForm(
          title: '徽章项目',
          selectorModel: model.badgeSelector,
        ),
        RulesForm(
          title: '徽章内容',
          selectorModel: model.badgeText,
        ),
        RulesForm(
          title: '徽章类型',
          selectorModel: model.badgeCategory,
        ),
      ],
    );
  }

  StickyClassifyList _buildCommentList() {
    return StickyClassifyList(title: '评论', children: [
      RulesForm(
        title: '评论项目',
        selectorModel: model.commentSelector,
      ),
      RulesForm(
        title: '评论内容',
        selectorModel: model.comments.content,
      ),
      RulesForm(
        title: '用户名',
        selectorModel: model.comments.username,
      ),
      RulesForm(
        title: '评论时间',
        selectorModel: model.comments.time,
      ),
      RulesForm(
        title: '评论评分',
        selectorModel: model.comments.score,
      ),
    ]);
  }

  StickyClassifyList _buildTagList() {
    return StickyClassifyList(title: '分类', children: [
      RulesForm(
        title: '分类',
        selectorModel: model.tag,
      ),
      RulesForm(
        title: '分类颜色',
        selectorModel: model.tagColor,
      ),
    ]);
  }

  StickyClassifyList _buildChapterList() {
    return StickyClassifyList(title: '章节', children: [
      RulesForm(
        title: '章节选择器',
        selectorModel: model.tag,
      ),
      RulesForm(
        title: '章节标题',
        selectorModel: model.tagColor,
      ),
      RulesForm(
        title: '章节副标题',
        selectorModel: model.tagColor,
      ),
      RulesForm(
        title: '章节封面',
        selectorModel: model.thumbnail.imgUrl,
      ),
      RulesForm(
        title: '章节图宽度',
        selectorModel: model.thumbnail.imgWidth,
      ),
      RulesForm(
        title: '章节图高度',
        selectorModel: model.thumbnail.imgHeight,
      ),
      RulesForm(
        title: '章节图X偏移',
        selectorModel: model.thumbnail.imgX,
      ),
      RulesForm(
        title: '章节图Y偏移',
        selectorModel: model.thumbnail.imgY,
      ),
    ]);
  }

  StickyClassifyList _buildThumbnailList() {
    return StickyClassifyList(title: '缩略图', children: [
      RulesForm(
        title: '缩略图项目',
        selectorModel: model.thumbnailSelector,
      ),
      RulesForm(
        title: '缩略图地址',
        selectorModel: model.thumbnail.imgUrl,
      ),
      RulesForm(
        title: '缩略图宽度',
        selectorModel: model.thumbnail.imgWidth,
      ),
      RulesForm(
        title: '缩略图高度',
        selectorModel: model.thumbnail.imgHeight,
      ),
      RulesForm(
        title: '缩略图X偏移',
        selectorModel: model.thumbnail.imgX,
      ),
      RulesForm(
        title: '缩略图Y偏移',
        selectorModel: model.thumbnail.imgY,
      ),
      RulesForm(
        title: '缩略图目标',
        selectorModel: model.thumbnail.target,
      ),
    ]);
  }

  StickyClassifyList _buildCoverList() {
    return StickyClassifyList(
      title: '封面',
      children: [
        RulesForm(
          title: '封面地址',
          selectorModel: model.coverImg.imgUrl,
        ),
        RulesForm(
          title: '封面宽度',
          selectorModel: model.coverImg.imgWidth,
        ),
        RulesForm(
          title: '封面高度',
          selectorModel: model.coverImg.imgHeight,
        ),
        RulesForm(
          title: '封面X偏移',
          selectorModel: model.coverImg.imgX,
        ),
        RulesForm(
          title: '封面Y偏移',
          selectorModel: model.coverImg.imgY,
        ),
      ],
    );
  }

  StickyClassifyList _buildInfoList() {
    return StickyClassifyList(title: '基础信息', children: [
      RulesForm(
        title: '标题',
        selectorModel: model.title,
      ),
      RulesForm(
        title: '副标题',
        selectorModel: model.subtitle,
      ),
      RulesForm(
        title: '上传时间',
        selectorModel: model.uploadTime,
      ),
      RulesForm(
        title: '评分',
        selectorModel: model.star,
      ),
      RulesForm(
        title: '语言',
        selectorModel: model.language,
      ),
      RulesForm(
        title: '描述',
        selectorModel: model.description,
      ),
      RulesForm(
        title: '总图片数',
        selectorModel: model.imgCount,
      ),
      RulesForm(
        title: '总页数',
        selectorModel: model.pageCount,
      ),
      RulesForm(
        title: '每页图片数',
        selectorModel: model.countPrePage,
      ),
    ]);
  }
}
