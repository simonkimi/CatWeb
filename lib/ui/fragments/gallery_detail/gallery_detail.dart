import 'dart:math';

import 'package:catweb/ui/components/comment_item.dart';
import 'package:catweb/ui/components/icon_text.dart';
import 'package:catweb/ui/components/info_column.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../data/store/setting_store.dart';
import '../../../main.dart';
import '../../../themes.dart';
import '../../components/post_preview_card.dart';

class GalleryDetailModel {
  GalleryDetailModel({
    this.title,
    this.subtitle,
    this.category,
    this.categoryColor,
    this.language,
    this.imageCount,
    this.size,
    this.favoriteCount,
    this.uploadTime,
    this.tagList,
    this.commentList,
    this.prePageImageCount,
  });

  final String? title;
  final String? subtitle;
  final String? category;
  final Color? categoryColor;
  final String? language;
  final int? imageCount;
  final String? size;
  final int? favoriteCount;
  final String? uploadTime;
  final List<TagModel>? tagList;
  final int? prePageImageCount;

  final List<CommentItemModel>? commentList;
}

class TagModel {
  TagModel({required this.text, required this.category});

  final String text;
  final String category;
}

class GalleryDetail extends StatelessWidget {
  const GalleryDetail({Key? key, required this.model}) : super(key: key);

  final GalleryDetailModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildPreviewTitle(context),
        const Divider(),
        buildNeedLoading(context),
      ],
    );
  }

  Widget buildNeedLoading(BuildContext context) {
    return Column(
      children: [
        buildInfoBarRow(context),
        const Divider(),
        buildTagTitle(context),
        buildTagList(context),
        const Divider(),
        buildCommentTitle(context),
        buildCommentList(context),
        const Divider(),
        buildPreviewList(context),
      ],
    );
  }

  Widget buildCommentTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          const Text(
            '评分与评论',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          ),
          const Expanded(child: SizedBox()),
          Row(
            children: [
              RatingBar.builder(
                itemSize: 14,
                ignoreGestures: true,
                initialRating: 4.5,
                onRatingUpdate: (value) {},
                itemBuilder: (BuildContext context, int index) {
                  return const Icon(
                    Icons.star,
                    color: Colors.amber,
                  );
                },
              ),
              const SizedBox(width: 5),
              Text(
                '4.5',
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).textTheme.subtitle2!.color,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget buildTagList(BuildContext context) {
    final tagMap = <String, List<String>>{};

    for (final tag in model.tagList ?? <TagModel>[]) {
      if (!tagMap.containsKey(tag.category)) {
        tagMap[tag.category] = [];
      }
      tagMap[tag.category]!.add(tag.text);
    }

    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
      child: Column(
        children: tagMap.entries.map((e) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: Text(
                      e.key,
                      style: const TextStyle(
                        height: 1,
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Wrap(
                    spacing: 3,
                    runSpacing: 3,
                    children: e.value.map((e) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: isDarkMode(context)
                              ? const Color(0xFF494949)
                              : const Color(0xFFEFEEF1),
                        ),
                        child: InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(6),
                            child: Text(
                              e,
                              style: const TextStyle(
                                fontSize: 14,
                                height: 1,
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                )
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget buildPreviewTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 150),
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  buildLeftImage(),
                  const SizedBox(width: 8),
                  buildRightInfo(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLeftImage() {
    return SizedBox(
      width: 140,
      child: AspectRatio(
        aspectRatio: 0.75,
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(5),
          ),
          clipBehavior: Clip.antiAlias,
          child: ColoredBox(
            color: Colors.grey[50]!,
          ),
        ),
      ),
    );
  }

  Widget buildRightInfo(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTitle(context),
              const SizedBox(height: 5),
              buildUploader(context),
              const SizedBox(height: 5),
              buildTypeTag(context),
              const SizedBox(height: 5),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildTitle(BuildContext context) {
    if (model.title == null) return const SizedBox();
    return Text(
      model.title!,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: Theme.of(context).textTheme.subtitle1!.color),
    );
  }

  Widget buildUploader(BuildContext context) {
    if (model.subtitle == null) return const SizedBox();
    return Text(
      model.subtitle!,
      style: TextStyle(
        fontSize: 16,
        color: Theme.of(context).textTheme.subtitle2!.color,
      ),
    );
  }

  Widget buildTypeTag(BuildContext context) {
    if (model.category == null) return const SizedBox();
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 50),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 1),
        decoration: BoxDecoration(
          color: model.categoryColor ?? Colors.red,
          borderRadius: BorderRadius.circular(3),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              '分类',
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildInfoBarRow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: InfoColumn(
        children: [
          if (model.language != null)
            IconText(
              icon: Icons.translate,
              text: model.language!,
              style: const TextStyle(fontSize: 15),
            ),
          if (model.imageCount != null)
            IconText(
              text: model.imageCount.toString(),
              icon: Icons.image_outlined,
              style: const TextStyle(fontSize: 15),
            ),
          if (model.size != null)
            IconText(
              text: model.size!,
              icon: Icons.file_copy_outlined,
              style: const TextStyle(fontSize: 15),
            ),
          if (model.favoriteCount != null)
            IconText(
              icon: Icons.favorite,
              iconColor: Colors.red,
              style: const TextStyle(fontSize: 15),
              text: model.favoriteCount!.toString(),
            ),
        ],
      ),
    );
  }

  Widget buildTagTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: const [
          Text(
            '标签',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget buildCommentList(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: model.commentList?.isNotEmpty ?? false
            ? Column(
                children: [
                  ...model.commentList!.take(2).map((e) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: CommentItem(
                        model: e,
                        maxLine: 10,
                        onTap: () {},
                      ),
                    );
                  }).toList(),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      model.commentList!.length <= 2
                          ? '没有其他评论了'
                          : '还有${model.commentList!.length - 2}条评论',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '没有其他评论了',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
      ),
    );
  }

  Widget buildPreviewList(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          GridView.builder(
            padding: const EdgeInsets.only(
              right: 15,
              left: 15,
              top: 10,
              bottom: 5,
            ),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: CardSize.of(settingStore.cardSize).toDouble(),
              childAspectRatio: 100 / 142,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
            ),
            // TODO 改为真实长度
            itemCount: min(model.imageCount!, 60),
            itemBuilder: (context, index) {
              return PostPreviewCard(
                  title: '#${index + 1}',
                  body: ColoredBox(
                    color: Colors.grey[200]!,
                  ));
            },
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              model.imageCount! <= min(80, model.prePageImageCount ?? 0)
                  ? '没有其他预览了'
                  : '展示更多预览',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
