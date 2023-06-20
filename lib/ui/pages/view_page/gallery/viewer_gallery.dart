import 'dart:math' as math;

import 'package:catweb/data/controller/navigator_service.dart';
import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/ui/widgets/badge.dart';
import 'package:catweb/ui/widgets/cupertino_app_bar.dart';
import 'package:catweb/ui/widgets/cupertino_divider.dart';
import 'package:catweb/ui/widgets/description.dart';
import 'package:catweb/ui/widgets/icon_text.dart';
import 'package:catweb/ui/widgets/image_loader.dart';
import 'package:catweb/ui/widgets/simple_sliver.dart';
import 'package:catweb/ui/pages/view_page/gallery/viewer_gallery_images.dart';
import 'package:catweb/ui/theme/colors.dart';
import 'package:catweb/ui/theme/themes.dart';
import 'package:catweb/utils/helper.dart';
import 'package:cupertino_modal_sheet/cupertino_modal_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:catweb/data/protocol/model/model.dart';

import 'package:catweb/data/protocol/model/page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'comment_item.dart';
import 'comment_list.dart';
import 'controller/gallery_controller.dart';
import 'package:get/get.dart';

class ViewerGalleryFragment extends StatelessWidget {
  ViewerGalleryFragment({
    super.key,
    required PageBlueprintModel target,
    required Object? model,
    required SiteEnvModel env,
  }) {
    previewController = Get.put(
      GalleryPreviewController(
        blueprint: target,
        base: model,
        outerEnv: env,
      ),
      tag: NavigatorService.depth,
    );
  }

  late final GalleryPreviewController previewController;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CupertinoAppBar(
        title: '',
        leading: const CupertinoBackLeading(),
        child: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Obx(() => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: CustomScrollView(
            physics: previewController.detailModel == null
                ? const NeverScrollableScrollPhysics()
                : null,
            slivers: [
              // 上方内容
              SliverPullToRefresh(onRefresh: previewController.refresh),
              _buildHeader(context),
              // 下方内容, 有信息才会展现
              if (previewController.detailModel != null) ...[
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
              if (previewController.fillRemaining) _buildRemaining(context),
            ],
          ),
        ));
  }

  Widget _buildPreviewList(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5),
        SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: math.min(previewController.successiveItems.length, 60),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => _openReadPage(index),
                child: Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: AspectRatio(
                    aspectRatio: 200 / 282,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: previewController.successiveItems
                                  .toList()
                                  .index(index) !=
                              null
                          ? ImageLoader(
                              concurrency: previewController.previewConcurrency,
                              model: previewController.successiveItems
                                  .toList()[index]
                                  .value
                                  .previewImg,
                              innerImageBuilder: (context, child) {
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: child,
                                );
                              },
                            )
                          : Builder(builder: (context) {
                              previewController.loadIndexModel(index);
                              return const CupertinoActivityIndicator();
                            }),
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
            if ((previewController.baseData?.imageCount ??
                    previewController.detailModel?.imageCount) !=
                null)
              IconText(
                icon: Icons.image_outlined,
                text:
                    '${previewController.baseData?.imageCount ?? previewController.detailModel?.imageCount}',
                iconColor: CupertinoColors.secondaryLabel.resolveFrom(context),
                style: TextStyle(
                  fontSize: 13,
                  color: CupertinoColors.secondaryLabel.resolveFrom(context),
                ),
              ),
            const Expanded(child: SizedBox()),
            _buildShowMore(context, () {
              Get.to(() => ViewerGalleryImages(
                    previewController: previewController,
                    onOpenPage: _openReadPage,
                  ));
            }),
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
    if (previewController.baseData != null ||
        previewController.detailModel != null) {
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
    if (previewController.detailModel?.badges.isEmpty ?? true) {
      return const SizedBox();
    }
    final tagMaps = <String, List<String>>{'_': []};

    for (final tag in previewController.detailModel!.badges) {
      tagMaps[tag.category.isEmpty ? '_' : tag.category] ??= [];
      tagMaps[tag.category.isEmpty ? '_' : tag.category]!.add(tag.text);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final e in tagMaps.entries)
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (e.key != '_') ...[
                  SlimBadge(
                    text: e.key,
                    color: cupertinoLightColors(
                      context,
                      tagMaps.keys.toList().indexOf(e.key),
                    ).withOpacity(0.5),
                  ),
                  const SizedBox(width: 10),
                ],
                Expanded(
                  child: Wrap(
                    spacing: 5,
                    runSpacing: 5,
                    children: e.value.map((e) {
                      return SlimBadge(
                        text: e,
                        color: FixColor.groupedColor.resolveFrom(context),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        const CupertinoDivider(),
      ],
    );
  }

  Widget _buildLeftImage() {
    if (previewController.baseData?.image == null &&
        previewController.detailModel?.coverImg == null) {
      return const SizedBox();
    }
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: SizedBox(
        width: 140,
        child: ImageLoader(
          concurrency: previewController.previewConcurrency,
          model: (previewController.baseData?.image ??
              previewController.detailModel?.coverImg)!,
          innerImageBuilder: (context, child) {
            return Container(
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
              child: child,
            );
          },
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
              if (previewController.detailModel?.comments.isEmpty ?? true) ...[
                const SizedBox(height: 5),
                _buildStarBar(context),
              ]
            ],
          ),
          Row(
            children: [
              _buildReadButton(context),
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
        child: previewController.errorMessage != null
            ? Text(
                previewController.errorMessage!,
                style: TextStyle(
                  color: FixColor.title.resolveFrom(context),
                ),
              )
            : const CupertinoActivityIndicator(),
      ),
    );
  }

  Widget _buildLanguage(BuildContext context) {
    final language = previewController.baseData?.language ??
        previewController.detailModel?.getLanguage();
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
    final star = previewController.baseData?.star ??
        previewController.detailModel?.getStar();
    if (star == null) return const SizedBox();
    return Row(
      children: [
        RatingBar.builder(
          initialRating: star,
          itemSize: 14,
          maxRating: 5,
          allowHalfRating: true,
          itemBuilder: (context, _) => Icon(
            CupertinoIcons.star_fill,
            color: CupertinoColors.systemYellow.resolveFrom(context),
          ),
          unratedColor: CupertinoColors.systemGrey5.resolveFrom(context),
          onRatingUpdate: (value) {},
        ),
        const SizedBox(width: 8),
        Text(
          star.toString(),
          style: TextStyle(
            fontSize: 13,
            color: FixColor.text.resolveFrom(context),
          ),
        ),
      ],
    );
  }

  CupertinoButton _buildReadButton(BuildContext context) {
    return CupertinoButton(
      color: CupertinoColors.systemBlue.resolveFrom(context),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
      minSize: 0,
      onPressed: previewController.detailModel != null
          ? () async {
              await _openReadPage();
              await previewController.loadLastRead();
            }
          : null,
      borderRadius: BorderRadius.circular(20),
      child: previewController.detailModel != null
          ? Obx(() => Text(
                previewController.lastReadIndex.value == 0
                    ? '阅读'
                    : '阅读(${previewController.lastReadIndex.value + 1})',
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFF0F0F0),
                ),
              ))
          : Transform.scale(
              scale: 0.8,
              child: const CupertinoActivityIndicator(),
            ),
    );
  }

  Future<void> _openReadPage([int? startPage]) async {
    if (startPage != null) {
      previewController.lastReadIndex.value = startPage;
    }
    await NavigatorService.push(
      targetName: previewController.extra.targetReader.value,
      envModel: previewController.localEnv.clone(),
      model: previewController,
    );
  }

  Widget _buildTitle(BuildContext context) {
    final title = previewController.detailModel?.getTitle() ??
        previewController.baseData?.title;
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
    final subtitle = previewController.detailModel?.getSubTitle() ??
        previewController.baseData?.subtitle;
    if (subtitle == null) return const SizedBox();
    return Text(
      subtitle,
      style: TextStyle(
        fontSize: 13,
        color: CupertinoColors.secondaryLabel.resolveFrom(context),
      ),
    );
  }

  Widget _buildDescription(BuildContext context) {
    if (!(previewController.detailModel?.hasDescription() ?? false)) {
      return const SizedBox();
    }

    final description = previewController.detailModel!.description;

    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DescriptionWidget(text: description),
          const SizedBox(height: 15),
          Text(
            previewController.detailModel?.subtitle ??
                previewController.baseData?.subtitle ??
                '',
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
              if (previewController.detailModel?.uploadTime != null)
                Text(
                  previewController.detailModel!.uploadTime,
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
    if (!(previewController.detailModel?.comments.isNotEmpty ?? false)) {
      return const SizedBox();
    }
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildStarBar(context),
            const Expanded(child: SizedBox()),
            IconText(
              icon: Icons.message_outlined,
              text: '${previewController.detailModel!.comments.length}',
              iconColor: CupertinoColors.secondaryLabel.resolveFrom(context),
              style: TextStyle(
                fontSize: 13,
                color: CupertinoColors.secondaryLabel.resolveFrom(context),
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Column(
          children: previewController.detailModel!.comments.take(2).map((e) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: CommentItem(model: e),
            );
          }).toList(),
        ),
        if ((previewController.detailModel?.comments.length ?? 0) > 2)
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _buildShowMore(context, () {
                showCupertinoModalSheet(
                    context: context,
                    builder: (context) {
                      return CommentListPage(
                          previewController: previewController);
                    });
              }),
            ],
          ),
      ],
    );
  }
}
