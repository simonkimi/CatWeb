import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/ui/components/badge.dart';
import 'package:catweb/ui/components/cupertino_divider.dart';
import 'package:catweb/ui/components/icon_text.dart';
import 'package:catweb/ui/theme/colors.dart';
import 'package:catweb/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:catweb/data/protocol/model/model.dart';

import 'package:catweb/data/protocol/model/page.dart';
import 'package:flutter/material.dart';
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
    return Obx(() {
      if (c.isInitialling) {
        return const Center(
          child: CupertinoActivityIndicator(),
        );
      }
      return _buildBody(context);
    });
  }

  Widget _buildBody(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: _buildHeader(context),
        ),
        if (c.isLoadingDetail) _buildLoading(context),
        if (c.detailModel != null) _buildRightInfo(context),
      ],
    );
  }

  Widget _buildError(BuildContext context) {
    if (c.errorMessage != null) {
      return const SliverFillRemaining(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return SliverToBoxAdapter(child: const SizedBox());
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
          Image.asset('assets/images/sample2.jpg'),
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
                    text: '${c.detailModel!.imageCount}',
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
        child: CircularProgressIndicator(),
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
    final title = c.baseData?.title ?? c.detailModel?.getTitle();
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
    final subtitle = c.baseData?.subtitle ?? c.detailModel?.getSubTitle();
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
        text: c.baseData?.tag?.text ?? c.model.tag.text,
        color: c.baseData?.tag?.color.color ?? c.model.tag.color.color,
      );
    }
    return const SizedBox();
  }
}
