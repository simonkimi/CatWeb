import 'package:catweb/theme/colors.dart';
import 'package:catweb/theme/themes.dart';
import 'package:catweb/ui/components/badge.dart';
import 'package:catweb/ui/components/cupertino_divider.dart';
import 'package:catweb/ui/components/icon_text.dart';
import 'package:catweb/ui/model/detail_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class GalleryDetail extends StatelessWidget {
  const GalleryDetail({
    Key? key,
    required this.model,
  }) : super(key: key);

  final GalleryDetailModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10, top: 10),
      child: ListView(
        children: [
          _buildHeader(context),
          _buildDescription(context),
          _buildTagList(context),
          _buildCommentList(context),
          // TODO 预览图
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 150),
          child: IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildLeftImage(),
                const SizedBox(width: 15),
                _buildRightInfo(context),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        const CupertinoDivider(),
      ],
    );
  }

  Widget _buildCommentList(BuildContext context) {
    if (model.commentList == null) return const SizedBox();

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              model.star != null ? '评论和评分' : '评论',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: FixColor.title.resolveFrom(context),
              ),
            ),
            _buildStarBar(context)
          ],
        ),
        const SizedBox(height: 5),
        Column(
          children: model.commentList!.take(2).map((e) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Container(
                decoration: BoxDecoration(
                  color: CupertinoColors.systemGrey6.resolveFrom(context),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          e.username!,
                          style: const TextStyle(
                              color: CupertinoColors.activeBlue,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        const Expanded(child: SizedBox()),
                        Text(
                          '${e.score! >= 0 ? '+' : '-'}${e.score!.abs()}',
                          style: TextStyle(
                            fontSize: 12,
                            color: CupertinoColors.secondaryLabel
                                .resolveFrom(context),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Linkify(
                      text: e.comment!,
                      style: TextStyle(
                        fontSize: 15,
                        color: FixColor.title.resolveFrom(context),
                      ),
                      onOpen: (value) {},
                    ),
                    const SizedBox(height: 5),
                    Text(
                      e.commentTime!,
                      style: TextStyle(
                        fontSize: 12,
                        color:
                            CupertinoColors.secondaryLabel.resolveFrom(context),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        )
      ],
    );
  }

  Widget _buildTagList(BuildContext context) {
    if (model.tagList == null) return const SizedBox();
    final tagMaps = <String, List<String>>{'_': []};

    for (final tag in model.tagList ?? <TagModel>[]) {
      if (tag.category != null && !tagMaps.containsKey(tag.category)) {
        tagMaps[tag.category!] = [];
      }
      tagMaps[tag.category ?? '_']!.add(tag.text);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Tag',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: FixColor.title.resolveFrom(context),
              ),
            ),
            _buildCategory(context),
          ],
        ),
        const SizedBox(height: 10),
        ...tagMaps.entries.map((e) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (e.key != '_')
                  Badge(
                    text: e.key,
                    color: cupertinoLightColors(
                            context, tagMaps.keys.toList().indexOf(e.key))
                        .withOpacity(0.5),
                  ),
                if (e.key != '_') const SizedBox(width: 10),
                Expanded(
                  child: Wrap(
                    spacing: 5,
                    runSpacing: 5,
                    children: e.value.map((e) {
                      return Badge(text: e);
                    }).toList(),
                  ),
                ),
              ],
            ),
          );
        }),
        const CupertinoDivider(),
      ],
    );
  }

  Widget _buildDescription(BuildContext context) {
    if (model.description == null) return const SizedBox();
    final text = model.description!.replaceAll(RegExp(r'\n{2,}'), '\n');
    final textStyle = TextStyle(
      fontSize: 14,
      color: FixColor.text.resolveFrom(context),
    );

    final overflow = (TextPainter(
      maxLines: 5,
      textDirection: TextDirection.ltr,
      text: TextSpan(
        text: text,
        style: textStyle,
      ),
    )..layout(maxWidth: MediaQuery.of(context).size.width - 20))
        .didExceedMaxLines;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '描述',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: FixColor.title.resolveFrom(context),
          ),
        ),
        const SizedBox(height: 5),
        Stack(
          children: [
            Linkify(
              text: text,
              overflow: TextOverflow.ellipsis,
              maxLines: 5,
              style: TextStyle(
                fontSize: 14,
                color: FixColor.title.resolveFrom(context),
              ),
            ),
            if (overflow)
              Positioned(
                right: 1,
                bottom: 1,
                child: Stack(
                  children: [
                    ShaderMask(
                      shaderCallback: (bounds) {
                        return LinearGradient(colors: [
                          CupertinoColors.systemBackground
                              .resolveFrom(context)
                              .withOpacity(0),
                          CupertinoColors.systemBackground.resolveFrom(context),
                          CupertinoColors.systemBackground.resolveFrom(context),
                        ], stops: const [
                          0,
                          0.65,
                          1
                        ]).createShader(bounds);
                      },
                      child: Container(
                        width: 100,
                        height: 20,
                        color: CupertinoColors.systemBackground
                            .resolveFrom(context),
                      ),
                    ),
                    const Positioned(
                      right: 1,
                      child: Text(
                        '更多',
                        style: TextStyle(
                          color: CupertinoColors.activeBlue,
                          fontSize: 14,
                        ),
                      ),
                    )
                  ],
                ),
              )
          ],
        ),
        const SizedBox(height: 10),
        Text(
          model.subtitle!,
          style: const TextStyle(
            color: CupertinoColors.activeBlue,
            fontSize: 15,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '上传者',
              style: TextStyle(
                  color: CupertinoColors.secondaryLabel.resolveFrom(context),
                  fontSize: 12),
            ),
            Text(
              model.uploadTime!,
              style: TextStyle(
                color: CupertinoColors.secondaryLabel.resolveFrom(context),
                fontSize: 12,
              ),
            )
          ],
        ),
        const SizedBox(height: 5),
        const CupertinoDivider(),
      ],
    );
  }

  Widget _buildLeftImage() {
    return Container(
      width: 140,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: CupertinoColors.opaqueSeparator.withOpacity(0.2),
            offset: const Offset(2, 2),
            blurRadius: 2,
            spreadRadius: 0,
          )
        ],
      ),
      child: Stack(
        children: [
          Image.asset('assets/images/simple2.jpg'),
          Positioned(
            right: 1,
            bottom: 1,
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(3)),
                child: Padding(
                  padding: const EdgeInsets.all(1),
                  child: IconText(
                    icon: Icons.image_outlined,
                    iconColor: Colors.white,
                    space: 0,
                    text: '${model.imageCount!}',
                    style: const TextStyle(fontSize: 9, color: Colors.white),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildRightInfo(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitle(context),
              const SizedBox(height: 5),
              _buildUploader(context),
              const SizedBox(height: 5),
              if (model.star != null && model.commentList == null)
                _buildStarBar(context),
              if (model.star != null && model.commentList == null)
                const SizedBox(height: 5),
              if (model.category != null && model.tagList == null)
                _buildCategory(context),
              if (model.category != null && model.tagList == null)
                const SizedBox(height: 5),
            ],
          ),
          Row(
            children: [
              buildReadButton(),
              const SizedBox(width: 10),
              if (model.language != null) _buildLanguage(context)
            ],
          ),
        ],
      ),
    );
  }

  Text _buildLanguage(BuildContext context) {
    return Text(
      model.language!,
      style: TextStyle(
        fontSize: 10,
        color: CupertinoColors.secondaryLabel.resolveFrom(context),
      ),
    );
  }

  Row _buildStarBar(BuildContext context) {
    return Row(
      children: [
        RatingBar.builder(
          initialRating: model.star!,
          itemSize: 13,
          maxRating: 5,
          allowHalfRating: true,
          itemBuilder: (context, _) => Icon(
            CupertinoIcons.star_fill,
            color: CupertinoColors.systemYellow.resolveFrom(context),
          ),
          unratedColor: CupertinoColors.systemGrey5.resolveFrom(context),
          onRatingUpdate: (value) {},
        ),
        const SizedBox(width: 5),
        Text(
          model.star!.toString(),
          style: TextStyle(
              fontSize: 12, color: FixColor.text.resolveFrom(context)),
        ),
      ],
    );
  }

  CupertinoButton buildReadButton() {
    return CupertinoButton(
      child: const Text(
        '阅读',
        style: TextStyle(fontSize: 13),
      ),
      color: CupertinoColors.systemBlue,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
      minSize: 0,
      onPressed: () {},
      borderRadius: BorderRadius.circular(20),
    );
  }

  Widget _buildTitle(BuildContext context) {
    if (model.title == null) return const SizedBox();
    return Text(
      model.title!,
      style: TextStyle(
        fontWeight: FontWeight.w600,
        color: FixColor.title.resolveFrom(context),
      ),
    );
  }

  Widget _buildUploader(BuildContext context) {
    if (model.subtitle == null) return const SizedBox();
    return Text(
      model.subtitle!,
      style: TextStyle(
        fontSize: 13,
        color: CupertinoColors.secondaryLabel.resolveFrom(context),
      ),
    );
  }

  // Widget _buildUploadTime(BuildContext context) {
  //   if (model.uploadTime == null) return const SizedBox();
  //   return Text(
  //     model.uploadTime!,
  //     style: TextStyle(
  //       fontSize: 12,
  //       color: CupertinoColors.secondaryLabel.resolveFrom(context),
  //     ),
  //   );
  // }

  Widget _buildCategory(BuildContext context) {
    if (model.category == null) return const SizedBox();
    return Badge(
      text: model.category!,
      color: model.categoryColor,
    );
  }
}
