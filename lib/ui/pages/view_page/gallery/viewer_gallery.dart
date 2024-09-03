import 'dart:math' as math;

import 'package:catweb/data/models/page_loader_state.dart';
import 'package:catweb/data/models/site/page.dart';
import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/ui/widgets/badge.dart';
import 'package:catweb/ui/widgets/comment_item.dart';
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
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'comment_list.dart';
import 'viewer_gallery_notifier.dart';

class ViewerGalleryFragment extends StatelessWidget {
  const ViewerGalleryFragment({
    super.key,
    required this.sitePageRule,
    required this.env,
  });

  final SitePageRule sitePageRule;
  final SiteEnvStore env;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ViewerGalleryNotifier(
        siteRule: sitePageRule,
        localEnv: env,
      ),
      builder: (context, _) {
        return CupertinoPageScaffold(
          child: CupertinoAppBar(
            title: '',
            leading: const CupertinoBackLeading(),
            child: _buildBody(context),
          ),
        );
      },
    );
  }

  Widget _buildBody(BuildContext context) {
    ViewerGalleryNotifier notifier = context.read();
    final firstPage = context.select((ViewerGalleryNotifier n) => n.firstPage);
    final fillRemaining =
        context.select((ViewerGalleryNotifier n) => n.fillRemaining);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: CustomScrollView(
        physics:
            firstPage == null ? const NeverScrollableScrollPhysics() : null,
        slivers: [
          // 上方内容
          SliverPullToRefresh(onRefresh: notifier.refresh),
          _buildHeader(context),
          // 下方内容, 有信息才会展现
          if (firstPage != null) ...[
            // 描述
            SliverToBoxAdapter(
              child: _buildDescription(context),
            ),
            SliverToBoxAdapter(
              child: _buildPreviewList(context),
            ),
            SliverToBoxAdapter(
              child: _buildTagList(context),
            ),
            SliverToBoxAdapter(
              child: _buildCommentList(context),
            ),
            const SliverPadding(padding: EdgeInsets.only(bottom: 20)),
          ],

          // 加载内容, 不一定会展现
          if (fillRemaining) _buildRemaining(context),
        ],
      ),
    );
  }

  Widget _buildPreviewList(BuildContext context) {
    ViewerGalleryNotifier notifier = context.read();
    final successiveItems =
        context.select((ViewerGalleryNotifier n) => n.successiveItems).toList();
    final imageCount = context
        .select((ViewerGalleryNotifier n) => n.firstPage?.pageData.imageCount);

    return Column(
      children: [
        const SizedBox(height: 5),
        SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: math.min(successiveItems.length, 60),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => _openReadPage(index),
                child: Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: AspectRatio(
                    aspectRatio: 200 / 282,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: successiveItems.index(index) != null
                          ? ImageLoader(
                              queue: notifier.imageQueue,
                              model: successiveItems[index].previewImage,
                              innerImageBuilder: (context, child) {
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: child,
                                );
                              },
                            )
                          : Builder(builder: (context) {
                              notifier.loadIndex(index);
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
            if (imageCount != null)
              IconText(
                icon: Icons.image_outlined,
                text: '$imageCount',
                iconColor: CupertinoColors.secondaryLabel.resolveFrom(context),
                style: TextStyle(
                  fontSize: 13,
                  color: CupertinoColors.secondaryLabel.resolveFrom(context),
                ),
              ),
            const Expanded(child: SizedBox()),
            _buildShowMore(context, () {
              Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
                return ChangeNotifierProvider.value(
                  value: notifier,
                  child: ViewerGalleryImages(
                    onOpenPage: _openReadPage,
                  ),
                );
              }));
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
                  _buildLeftImage(context),
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

  Widget _buildTagList(BuildContext context) {
    final badges = context
        .select((ViewerGalleryNotifier n) => n.firstPage?.pageData.badges);
    if (badges == null || badges.isEmpty) {
      return const SizedBox();
    }

    final tagMaps = <String, List<String>>{'_': []};

    for (final tag in badges) {
      tagMaps[tag.category?.isEmpty == true ? '_' : tag.category!] ??= [];
      tagMaps[tag.category?.isEmpty == true ? '_' : tag.category]!
          .add(tag.text ?? '');
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

  Widget _buildLeftImage(BuildContext context) {
    final coverImage = context.select(
      (ViewerGalleryNotifier n) => n.firstPage?.pageData.coverImage,
    );
    final notifier = context.read<ViewerGalleryNotifier>();

    if (coverImage == null) {
      return const SizedBox();
    }
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: SizedBox(
        width: 140,
        child: ImageLoader(
          queue: notifier.imageQueue,
          model: coverImage,
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
    final comments = context.select(
      (ViewerGalleryNotifier n) => n.firstPage?.pageData.comments,
    );

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
              if (comments?.isEmpty ?? true) ...[
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
    final errMsg =
        context.select((ViewerGalleryNotifier n) => switch (n.state) {
              PageLoaderStateError(:final error) => error.toString(),
              _ => null,
            });

    return SliverFillRemaining(
      child: Center(
        child: errMsg != null
            ? Text(
                errMsg,
                style: TextStyle(
                  color: FixColor.title.resolveFrom(context),
                ),
              )
            : const CupertinoActivityIndicator(),
      ),
    );
  }

  Widget _buildLanguage(BuildContext context) {
    final language = context
        .select((ViewerGalleryNotifier n) => n.firstPage?.pageData.language);

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
    final star =
        context.select((ViewerGalleryNotifier n) => n.firstPage?.pageData.star);

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
      onPressed: () async {
        await _openReadPage();
      },
      borderRadius: BorderRadius.circular(20),
      child: const Text(
        '阅读',
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          color: Color(0xFFF0F0F0),
        ),
      ),
    );
  }

  Future<void> _openReadPage([int? startPage]) async {
    // if (startPage != null) {
    //   previewController.lastReadIndex.value = startPage;
    // }
    // await NavigatorNotifier.push(
    //   targetName: previewController.extra.targetReader.value,
    //   envModel: previewController.localEnv.clone(),
    //   model: previewController,
    // );
  }

  Widget _buildTitle(BuildContext context) {
    final title = context.select(
      (ViewerGalleryNotifier n) => n.firstPage?.pageData.title,
    );
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
    final subtitle = context.select(
      (ViewerGalleryNotifier n) => n.firstPage?.pageData.subtitle,
    );
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
    final description = context.select(
      (ViewerGalleryNotifier n) => n.firstPage?.pageData.description,
    );
    final subtitle = context.select(
      (ViewerGalleryNotifier n) => n.firstPage?.pageData.subtitle,
    );
    final uploadTime = context.select(
      (ViewerGalleryNotifier n) => n.firstPage?.pageData.uploadTime,
    );

    if (description == null) {
      return const SizedBox();
    }

    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DescriptionWidget(text: description),
          const SizedBox(height: 15),
          Text(
            subtitle ?? '',
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
              if (uploadTime != null)
                Text(
                  uploadTime,
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
    final comments = context.select(
      (ViewerGalleryNotifier n) => n.firstPage?.pageData.comments,
    );
    if (comments == null || comments.isEmpty) {
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
              text: '${comments.length}',
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
          children: comments.take(2).map((e) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: CommentItem(model: e),
            );
          }).toList(),
        ),
        if (comments.length > 2)
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _buildShowMore(context, () {
                showCupertinoModalSheet(
                  context: context,
                  builder: (context) {
                    return CommentListPage(
                      comments: comments,
                    );
                  },
                );
              }),
            ],
          ),
      ],
    );
  }
}
