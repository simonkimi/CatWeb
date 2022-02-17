import 'package:catweb/data/constant.dart';
import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/network/client/image_loader.dart';
import 'package:catweb/ui/components/badge.dart';
import 'package:catweb/ui/components/cupertino_app_bar.dart';
import 'package:catweb/ui/components/cupertino_divider.dart';
import 'package:catweb/ui/components/icon_text.dart';
import 'package:catweb/ui/components/image_loader.dart';
import 'package:catweb/ui/theme/colors.dart';
import 'package:catweb/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:catweb/data/protocol/model/model.dart';

import 'package:catweb/data/protocol/model/page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'detail_controller.dart';
import 'package:get/get.dart';

class ViewerDetailFragment extends StatelessWidget {
  ViewerDetailFragment({
    Key? key,
    required SitePageModel target,
    required Object? model,
    required SiteEnvModel env,
  })  : c = DetailPreviewController(
          target: target,
          base: model,
          outerEnv: env,
        ),
        super(key: key);

  final DetailPreviewController c;

  @override
  Widget build(BuildContext context) {
    return CupertinoAppBar(
      title: 'Test',
      child: _buildBody(context),
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
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: CustomScrollView(
        slivers: [
          // 上方内容
          _buildSafeArea(context),
          _buildHeader(context),

          // 加载内容, 不一定会展现
          if (c.errorMessage != null) _buildError(context),
          if (c.isLoadingDetail) _buildLoading(context),

          // 下方内容, 有信息才会展现
          // 描述
          SliverToBoxAdapter(
            child: Obx(() => _buildDescription(context)),
          )
        ],
      ),
    );
  }

  Widget _buildError(BuildContext context) {
    return SliverFillRemaining(
      child: Center(
        child: Text(c.errorMessage!),
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
                      text:
                          '${c.baseData?.imageCount ?? c.detailModel?.imageCount}',
                      style: const TextStyle(fontSize: 9, color: Colors.white),
                    ),
                  ),
                ),
              ),
            )
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
              const SizedBox(height: 5),
              if ((c.detailModel?.hasStar() ?? false) &&
                  (c.detailModel?.comments.isEmpty ?? true))
                _buildStarBar(context),
              if ((c.detailModel?.hasStar() ?? false) &&
                  (c.detailModel?.badges.isEmpty ?? true))
                _buildCategory(context),
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

  Widget _buildLoading(BuildContext context) {
    return const SliverFillRemaining(
      child: Center(
        child: CupertinoActivityIndicator(),
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

  Widget _buildCategory(BuildContext context) {
    if (c.baseData?.tag != null || c.detailModel?.getTag() != null) {
      return Badge(
        text: (c.baseData?.tag?.text ?? c.detailModel?.tag.text)!,
        color: c.baseData?.tag?.color.color ?? c.detailModel?.tag.color.color,
      );
    }
    return const SizedBox();
  }

  Widget _buildDescription(BuildContext context) {
    if (!(c.detailModel?.hasDescription() ?? false)) return const SizedBox();

    final description = c.detailModel!.description;
    final text = description.replaceAll(RegExp(r'\n{2,}'), '\n');
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
        // Text(
        //   model.subtitle,
        //   style: const TextStyle(
        //     color: CupertinoColors.activeBlue,
        //     fontSize: 15,
        //   ),
        // ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Text(
        //       '上传者',
        //       style: TextStyle(
        //           color: CupertinoColors.secondaryLabel.resolveFrom(context),
        //           fontSize: 12),
        //     ),
        //     Text(
        //       model.uploadTime,
        //       style: TextStyle(
        //         color: CupertinoColors.secondaryLabel.resolveFrom(context),
        //         fontSize: 12,
        //       ),
        //     )
        //   ],
        // ),
        const SizedBox(height: 5),
        const CupertinoDivider(),
      ],
    );
  }
}
