import 'package:catweb/data/protocol/model/parser.dart';
import 'package:catweb/ui/components/form.dart';
import 'package:flutter/material.dart';

class GalleryParser extends StatelessWidget {
  const GalleryParser({
    Key? key,
    required this.model,
  }) : super(key: key);

  final GalleryParserModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildCardList([
          buildInputForm(labelText: '名称', value: model.name),
        ], padding: const EdgeInsets.symmetric(vertical: 10)),
        const SizedBox(height: 5),
        const Divider(),
        buildCardList([
          RulesForm(
            title: '标题',
            selectorModel: model.title,
          ),
          RulesForm(
            title: '上传者',
            selectorModel: model.subTitle,
          ),
          RulesForm(
            title: '上传时间',
            selectorModel: model.uploadTIme,
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
            title: '收藏次数',
            selectorModel: model.favoriteCount,
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
            title: '每面图片数',
            selectorModel: model.prePageImg,
          ),
        ]),
        const SizedBox(height: 5),
        const Divider(),
        buildCardList([
          RulesForm(
            title: '封面地址',
            selectorModel: model.coverImg.imgUrl,
          ),
          const Divider(),
          RulesForm(
            title: '封面宽度',
            selectorModel: model.coverImg.imgWidth,
          ),
          const Divider(),
          RulesForm(
            title: '封面高度',
            selectorModel: model.coverImg.imgHeight,
          ),
          const Divider(),
          RulesForm(
            title: '封面X偏移',
            selectorModel: model.coverImg.imgX,
          ),
          const Divider(),
          RulesForm(
            title: '封面Y偏移',
            selectorModel: model.coverImg.imgY,
          ),
        ]),
        const SizedBox(height: 5),
        buildCardList([
          buildInputForm(labelText: '缩略图选择器', value: model.thumbnailSelector),
          RulesForm(
            title: '缩略图地址',
            selectorModel: model.thumbnail.imgUrl,
          ),
          const Divider(),
          RulesForm(
            title: '缩略图宽度',
            selectorModel: model.thumbnail.imgWidth,
          ),
          const Divider(),
          RulesForm(
            title: '缩略图高度',
            selectorModel: model.thumbnail.imgHeight,
          ),
          const Divider(),
          RulesForm(
            title: '缩略图X偏移',
            selectorModel: model.thumbnail.imgX,
          ),
          const Divider(),
          RulesForm(
            title: '缩略图Y偏移',
            selectorModel: model.thumbnail.imgY,
          ),
          const Divider(),
          RulesForm(
            title: '缩略图目标',
            selectorModel: model.thumbnailUrl,
          ),
        ]),
        const SizedBox(height: 5),
        buildCardList([
          RulesForm(
            title: '分类',
            selectorModel: model.tag,
          ),
          const Divider(),
          RulesForm(
            title: '分类颜色',
            selectorModel: model.tagColor,
          ),
        ]),
        const SizedBox(height: 5),
        buildCardList([
          buildInputForm(labelText: '评论选择器', value: model.commentSelector),
          RulesForm(
            title: '评论内容',
            selectorModel: model.comments.content,
          ),
          const Divider(),
          RulesForm(
            title: '用户名',
            selectorModel: model.comments.username,
          ),
          const Divider(),
          RulesForm(
            title: '评论时间',
            selectorModel: model.comments.postTime,
          ),
          const Divider(),
          RulesForm(
            title: '评论评分',
            selectorModel: model.comments.vote,
          ),
        ]),
        const SizedBox(height: 5),
        buildCardList([
          buildInputForm(labelText: '徽章选择器', value: model.badgeSelector),
          RulesForm(
            title: '徽章内容',
            selectorModel: model.badgeText,
          ),
          const Divider(),
          RulesForm(
            title: '徽章颜色',
            selectorModel: model.badgeColor,
          ),
          const Divider(),
          RulesForm(
            title: '徽章类型',
            selectorModel: model.badgeType,
          ),
        ]),
        const SizedBox(height: 5),
        buildCardList([
          RulesForm(
            title: '下一面地址',
            selectorModel: model.nextPage,
          ),
        ]),
      ],
    );
  }
}
