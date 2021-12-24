import 'package:catweb/data/controller/site_controller.dart';
import 'package:catweb/ui/components/badge.dart';
import 'package:catweb/ui/model/viewer_list_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import 'package:catweb/theme/colors.dart';
import 'dark_image.dart';
import 'dio_image.dart';

class SimpleCard extends StatelessWidget {
  const SimpleCard({
    Key? key,
    required this.model,
    this.useCard = true,
  }) : super(key: key);

  final ViewerListModel model;
  final bool useCard;

  @override
  Widget build(BuildContext context) {
    final child = Column(
      children: [
        _buildImage(context),
        if (model.title != null)
          Text(
            model.title!,
            style: TextStyle(
              color: FixColor.title.resolveFrom(context),
            ),
          ),
        if (model.subtitle != null)
          Text(
            model.subtitle!,
            style: TextStyle(
              fontSize: 12.5,
              color: FixColor.title.resolveFrom(context),
            ),
          ),
        if (model.badgeList != null) _buildTagList()
      ],
    );

    return useCard
        ? Card(
            clipBehavior: Clip.antiAlias,
            color: isDarkMode(context)
                ? CupertinoColors.systemGrey6.darkColor
                : CupertinoColors.systemBackground,
            child: child,
          )
        : Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Material(
              color: CupertinoColors.systemBackground.resolveFrom(context),
              child: child,
            ),
          );
  }

  SizedBox _buildTagList() {
    final tags = model.badgeList!.where((e) => e.text != null).toList();
    return SizedBox(
      height: 20,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: tags.length,
          itemBuilder: (context, index) {
            final e = tags[index];
            return Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: e.color ??
                      (isDarkMode(context)
                          ? const Color(0xFF312F32)
                          : const Color(0xFFEFEEF1)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(3),
                  child: Text(
                    e.text!,
                    style: TextStyle(
                      height: 1,
                      fontSize: 11,
                      color: e.color == null
                          ? isDarkMode(context)
                              ? Colors.white
                              : Colors.black
                          : e.color!.isDark
                              ? Colors.white
                              : Colors.black,
                    ),
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(width: 2),
        ),
      ),
    );
  }

  Widget _buildCategory(BuildContext context) {
    return ClipPath(
      clipper: _RightAngledTriangleClipper(),
      child: const SizedBox(
        width: 11,
        height: 11,
        child: ColoredBox(
          color: Colors.red,
        ),
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    return Stack(
      children: [
        DarkWidget(
          child: Image.asset(
            'assets/images/simple2.jpg',
            fit: BoxFit.fill,
          ),
        ),
        if (model.paper != null)
          Positioned(
            left: 0,
            bottom: 0,
            child: _buildPaper(context),
          ),
        if (model.tag != null)
          Positioned(
            right: 0,
            child: _buildCategory(context),
          ),
      ],
    );
  }

  Padding _buildPaper(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3),
      child: Container(
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          color: isDarkMode(context) ? Colors.black38 : Colors.black38,
          borderRadius: BorderRadius.circular(2),
        ),
        child: Text(
          model.paper!,
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),
      ),
    );
  }
}

class ExtendedCard extends StatelessWidget {
  const ExtendedCard({
    Key? key,
    required this.model,
    this.useCard = true,
  }) : super(key: key);

  final ViewerListModel model;
  final bool useCard;

  @override
  Widget build(BuildContext context) {
    final child = InkWell(
      onTap: () {},
      child: IntrinsicHeight(
        child: _buildBody(context),
      ),
    );

    return useCard
        ? Card(
            clipBehavior: Clip.antiAlias,
            color: isDarkMode(context)
                ? CupertinoColors.systemGrey6.darkColor
                : CupertinoColors.systemBackground,
            child: child,
          )
        : Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Material(
              color: CupertinoColors.systemBackground.resolveFrom(context),
              child: child,
            ),
          );
  }

  Row _buildBody(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (model.previewImage?.url != null) _buildImage(context),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(context),
                const Expanded(child: SizedBox()),
                _buildTile(context),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Row _buildTile(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (model.star != null) _buildStar(context),
            if (model.tag != null) _buildCategory(context),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (model.page != null)
              Text(
                '${model.page}P',
                style: TextStyle(
                    fontSize: 12.5,
                    color: CupertinoColors.secondaryLabel.resolveFrom(context)),
              ),
            if (model.uploadTime != null)
              Text(
                '${model.uploadTime}',
                style: TextStyle(
                  fontSize: 12.5,
                  color: CupertinoColors.secondaryLabel.resolveFrom(context),
                ),
              ),
          ],
        )
      ],
    );
  }

  Widget _buildCategory(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 50),
        child: Container(
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              color: model.tagColor ??
                  CupertinoColors.systemRed.resolveFrom(context),
              borderRadius: BorderRadius.circular(3),
            ),
            child: Center(
              child: Text(
                model.tag!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                ),
              ),
            )),
      ),
    );
  }

  Widget _buildStar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RatingBar.builder(
            itemSize: 16,
            ignoreGestures: true,
            initialRating: model.star!,
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
            model.star!.toString(),
            style: TextStyle(
              fontSize: 12,
              color: FixColor.title.resolveFrom(context),
            ),
          ),
        ],
      ),
    );
  }

  Column _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (model.title != null)
          Text(
            model.title!,
            maxLines: 2,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: FixColor.title.resolveFrom(context)),
          ),
        if (model.subtitle != null)
          Text(
            model.subtitle!,
            style: TextStyle(
              color: CupertinoColors.secondaryLabel.resolveFrom(context),
              fontSize: 14,
            ),
          ),
        const SizedBox(height: 3),
        if (model.badgeList != null) _buildTagWrap(context),
      ],
    );
  }

  Widget _buildImage(BuildContext context) {
    return SizedBox(
      width: 90,
      height: 135,
      child: Stack(
        children: [
          DioImage(
            dio: Get.find<SiteController>().website.client.dio,
            url: model.previewImage?.url,
            imageBuilder: (context, bytes) {
              return DarkWidget(
                child: Hero(
                  tag: model.previewImage!.url!,
                  child: Image.memory(
                    bytes,
                    width: 90,
                    height: 135,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              );
            },
          ),
          if (model.paper != null)
            Positioned(
              right: 0,
              child: buildPaper(),
            ),
        ],
      ),
    );
  }

  Padding buildPaper() {
    return Padding(
      padding: const EdgeInsets.all(3),
      child: Container(
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
            color: Colors.black38, borderRadius: BorderRadius.circular(2)),
        child: Text(
          model.paper!,
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),
      ),
    );
  }

  Wrap _buildTagWrap(BuildContext context) {
    return Wrap(
      spacing: 2,
      runSpacing: 2,
      children: model.badgeList!.where((e) => e.text != null).map((e) {
        return Badge(
          color: e.color,
          text: e.text!,
          fontSize: 11,
          padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 2),
          borderRadius: 5,
        );
      }).toList(),
    );
  }
}

class _RightAngledTriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
