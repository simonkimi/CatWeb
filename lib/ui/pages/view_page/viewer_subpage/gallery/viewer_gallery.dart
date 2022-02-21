import 'dart:math';

import 'package:catweb/data/constant.dart';
import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/network/client/image_loader.dart';
import 'package:catweb/ui/components/badge.dart';
import 'package:catweb/ui/components/cupertino_app_bar.dart';
import 'package:catweb/ui/components/cupertino_divider.dart';
import 'package:catweb/ui/components/description.dart';
import 'package:catweb/ui/components/icon_text.dart';
import 'package:catweb/ui/components/image_loader.dart';
import 'package:catweb/ui/theme/colors.dart';
import 'package:catweb/ui/theme/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:catweb/data/protocol/model/model.dart';

import 'package:catweb/data/protocol/model/page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'comment_item.dart';
import 'gallery_controller.dart';
import 'package:get/get.dart';

class ViewerGalleryFragment extends StatelessWidget {
  ViewerGalleryFragment({
    Key? key,
    required SitePageModel target,
    required Object? model,
    required SiteEnvModel env,
  })  : c = GalleryPreviewController(
          target: target,
          base: model,
          outerEnv: env,
        ),
        super(key: key);

  final GalleryPreviewController c;

  @override
  Widget build(BuildContext context) {
    return CupertinoAppBar(
      title: '',
      child: _buildBody(context),
      leading: _buildLeading(context),
    );
  }

  Widget _buildLeading(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      minSize: 0,
      child: const Icon(CupertinoIcons.back),
      onPressed: () => Get.back(),
    );
  }

  Widget _buildSafeArea(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + kCupertinoNavigatorBar + 5),
      sliver: const SliverToBoxAdapter(child: SizedBox()),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Obx(() => CustomScrollView(
            slivers: [
              // 上方内容
              _buildSafeArea(context),
              _buildHeader(context),

              // 下方内容, 有信息才会展现
              if (c.detailModel != null) ...[
                // 描述
                SliverToBoxAdapter(
                  child: Obx(() => _buildDescription(context)),
                ),
                SliverToBoxAdapter(
                  child: _buildPreviewList(context),
                ),
                SliverToBoxAdapter(
                  child: Obx(() => _buildTagList(context)),
                ),
                SliverToBoxAdapter(
                  child: Obx(() => _buildCommentList(context)),
                ),
                const SliverPadding(padding: EdgeInsets.only(bottom: 20)),
              ],

              // 加载内容, 不一定会展现
              if (c.fillRemaining) _buildRemaining(context),
            ],
          )),
    );
  }

  Widget _buildPreviewList(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5),
        SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: min(c.items.length, 40),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 5),
                child: AspectRatio(
                  aspectRatio: 200 / 282,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: ImageLoader(
                      concurrency: c.concurrency,
                      model: c.items[index],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            if ((c.baseData?.imageCount ?? c.detailModel?.imageCount) != null)
              IconText(
                icon: Icons.image_outlined,
                text: '${c.baseData?.imageCount ?? c.detailModel?.imageCount}',
                iconColor: CupertinoColors.secondaryLabel.resolveFrom(context),
                style: const TextStyle(fontSize: 13),
              ),
            const Expanded(child: SizedBox()),
            _buildShowMore(context, () {}),
          ],
        ),
        const SizedBox(height: 3),
        const CupertinoDivider(),
      ],
    );
  }

  Widget _buildShowMore(BuildContext context, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: const Text(
        '显示全部',
        style: TextStyle(
          color: CupertinoColors.activeBlue,
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    if (c.baseData != null || c.detailModel != null) {
      return SliverToBoxAdapter(
        child: Column(
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 150),
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Obx(() => _buildLeftImage()),
                    _buildRightInfo(context),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            const CupertinoDivider(),
          ],
        ),
      );
    }
    return const SliverToBoxAdapter(child: SizedBox());
  }

  Widget _buildTagList(BuildContext context) {
    if (c.detailModel?.badges.isEmpty ?? true) return const SizedBox();
    final tagMaps = <String, List<String>>{'_': []};

    for (final tag in c.detailModel!.badges) {
      tagMaps[tag.category.isEmpty ? '_' : tag.category] ??= [];
      tagMaps[tag.category.isEmpty ? '_' : tag.category]!.add(tag.text);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...tagMaps.entries.map((e) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (e.key != '_') ...[
                  Badge(
                    text: e.key,
                    color: cupertinoLightColors(
                            context, tagMaps.keys.toList().indexOf(e.key))
                        .withOpacity(0.5),
                  ),
                  const SizedBox(width: 10),
                ],
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

  Widget _buildLeftImage() {
    if (c.baseData?.image == null && c.detailModel?.coverImg == null) {
      return const SizedBox();
    }

    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Container(
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
            ImageLoader(
              concurrency: ImageConcurrency(
                dio: c.global.website.client.imageDio,
              ),
              model: (c.baseData?.image ?? c.detailModel?.coverImg)!,
            ),
          ],
        ),
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
              _buildSubtitle(context),
              if (c.detailModel?.comments.isEmpty ?? true) ...[
                const SizedBox(height: 5),
                _buildStarBar(context),
              ]
            ],
          ),
          Row(
            children: [
              _buildReadButton(),
              const SizedBox(width: 10),
              _buildLanguage(context)
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRemaining(BuildContext context) {
    return SliverFillRemaining(
      child: Center(
        child: c.errorMessage != null
            ? Text(c.errorMessage!)
            : const CupertinoActivityIndicator(),
      ),
    );
  }

  Widget _buildLanguage(BuildContext context) {
    final language = c.baseData?.language ?? c.detailModel?.getLanguage();
    if (language == null) return const SizedBox();
    return Text(
      language,
      style: TextStyle(
        fontSize: 10,
        color: CupertinoColors.secondaryLabel.resolveFrom(context),
      ),
    );
  }

  Widget _buildStarBar(BuildContext context) {
    final star = c.baseData?.star ?? c.detailModel?.getStar();
    if (star == null) return const SizedBox();
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Row(
        children: [
          RatingBar.builder(
            initialRating: star,
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
            star.toString(),
            style: TextStyle(
                fontSize: 12, color: FixColor.text.resolveFrom(context)),
          ),
        ],
      ),
    );
  }

  CupertinoButton _buildReadButton() {
    return CupertinoButton(
      child: const Text(
        '阅读',
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
        ),
      ),
      color: CupertinoColors.systemBlue,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
      minSize: 0,
      onPressed: () {},
      borderRadius: BorderRadius.circular(20),
    );
  }

  Widget _buildTitle(BuildContext context) {
    final title = c.detailModel?.getTitle() ?? c.baseData?.title;
    if (title == null) return const SizedBox();
    return Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.w600,
        color: FixColor.title.resolveFrom(context),
      ),
    );
  }

  Widget _buildSubtitle(BuildContext context) {
    final subtitle = c.detailModel?.getSubTitle() ?? c.baseData?.subtitle;
    if (subtitle == null) return const SizedBox();
    return Text(
      subtitle,
      style: TextStyle(
        fontSize: 13,
        color: CupertinoColors.secondaryLabel.resolveFrom(context),
      ),
    );
  }

  // Widget _buildCategory(BuildContext context) {
  //   if (c.baseData?.tag != null || c.detailModel?.getTag() != null) {
  //     return Badge(
  //       text: (c.baseData?.tag?.text ?? c.detailModel?.tag.text)!,
  //       color: c.baseData?.tag?.color.color ?? c.detailModel?.tag.color.color,
  //     );
  //   }
  //   return const SizedBox();
  // }

  Widget _buildDescription(BuildContext context) {
    if (!(c.detailModel?.hasDescription() ?? false)) return const SizedBox();

    final description = c.detailModel!.description;

    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DescriptionWidget(text: description),
          const SizedBox(height: 15),
          Text(
            c.detailModel?.subtitle ?? c.baseData?.subtitle ?? '',
            style: const TextStyle(
              color: CupertinoColors.activeBlue,
              fontSize: 13,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '上传者',
                style: TextStyle(
                  color: CupertinoColors.secondaryLabel.resolveFrom(context),
                  fontSize: 12,
                ),
              ),
              if (c.detailModel?.uploadTime != null)
                Text(
                  c.detailModel!.uploadTime,
                  style: TextStyle(
                    color: CupertinoColors.secondaryLabel.resolveFrom(context),
                    fontSize: 12,
                  ),
                )
            ],
          ),
          const SizedBox(height: 10),
          const CupertinoDivider(),
        ],
      ),
    );
  }

  Widget _buildCommentList(BuildContext context) {
    if (!(c.detailModel?.comments.isNotEmpty ?? false)) return const SizedBox();
    return Column(
      children: [
        Column(
          children: c.detailModel!.comments.take(2).map((e) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: CommentItem(model: e),
            );
          }).toList(),
        ),
        Row(
          children: [
            IconText(
              icon: Icons.message_outlined,
              text: '${c.detailModel!.comments.length}',
              iconColor: CupertinoColors.secondaryLabel.resolveFrom(context),
              style: const TextStyle(fontSize: 13),
            ),
            const Expanded(child: SizedBox()),
            _buildStarBar(context),
          ],
        )
      ],
    );
  }
}
