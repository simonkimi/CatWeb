import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../themes.dart';
import 'dark_image.dart';

class CardTag {
  CardTag({
    this.color,
    required this.text,
  });

  final Color? color;
  final String text;
}

class CardModel {
  CardModel({
    this.title,
    this.subtitle,
    this.tagList,
    this.star,
    this.category,
    this.categoryColor,
    this.page,
    this.uploadTime,
    this.badge,
  });

  final String? title;
  final String? subtitle;
  final List<CardTag>? tagList;
  final double? star;
  final String? category;
  final Color? categoryColor;
  final int? page;
  final String? uploadTime;
  final String? badge;
}

class SimpleCard extends StatelessWidget {
  const SimpleCard({
    Key? key,
    required this.model,
    this.useCard = true,
  }) : super(key: key);

  final CardModel model;
  final bool useCard;

  @override
  Widget build(BuildContext context) {
    final child = Column(
      children: [
        buildImage(context),
        if (model.title != null)
          Text(
            model.title!,
            style: TextStyle(
              color: CupertinoColors.label.resolveFrom(context),
            ),
          ),
        if (model.subtitle != null)
          Text(
            model.subtitle!,
            style: TextStyle(
              fontSize: 12.5,
              color: CupertinoColors.label.resolveFrom(context),
            ),
          ),
        if (model.tagList != null) buildTagList()
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

  SizedBox buildTagList() {
    return SizedBox(
      height: 20,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: 2,
          itemBuilder: (context, index) {
            final e = model.tagList![index];
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
                    e.text,
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

  Widget buildCategory(BuildContext context) {
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

  Widget buildImage(BuildContext context) {
    return Stack(
      children: [
        DarkWidget(
          child: Image.asset(
            'assets/images/simple2.jpg',
            fit: BoxFit.fill,
          ),
        ),
        if (model.badge != null)
          Positioned(
            left: 0,
            bottom: 0,
            child: buildBadge(context),
          ),
        if (model.category != null)
          Positioned(
            right: 0,
            child: buildCategory(context),
          ),
      ],
    );
  }

  Padding buildBadge(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3),
      child: Container(
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          color: isDarkMode(context) ? Colors.black38 : Colors.black38,
          borderRadius: BorderRadius.circular(2),
        ),
        child: Text(
          model.badge!,
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

  final CardModel model;
  final bool useCard;

  @override
  Widget build(BuildContext context) {
    final child = InkWell(
      onTap: () {},
      child: IntrinsicHeight(
        child: buildBody(context),
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

  Row buildBody(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        buildImage(context),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildHeader(context),
                const Expanded(child: SizedBox()),
                buildTile(context),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Row buildTile(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (model.star != null) buildStar(context),
            if (model.category != null) buildCategory(context),
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
                    fontSize: 12.5, color: CupertinoColors.secondaryLabel.resolveFrom(context)),
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

  Widget buildCategory(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 50),
      child: Container(
          padding: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(3),
          ),
          child: Center(
            child: Text(
              model.category!,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 11,
              ),
            ),
          )),
    );
  }

  Widget buildStar(BuildContext context) {
    return Row(
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
            color: CupertinoColors.label.resolveFrom(context),
          ),
        ),
      ],
    );
  }

  Column buildHeader(BuildContext context) {
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
            style: TextStyle(color: CupertinoColors.label.resolveFrom(context)),
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
        if (model.tagList != null) buildTagWrap(context),
      ],
    );
  }

  Widget buildImage(BuildContext context) {
    return SizedBox(
      width: 90,
      height: 135,
      child: Stack(
        children: [
          DarkWidget(
            child: Image.asset(
              'assets/images/simple2.jpg',
              fit: BoxFit.fitHeight,
              height: 135,
            ),
          ),
          if (model.badge != null)
            Positioned(
              right: 0,
              child: buildBadge(),
            ),
        ],
      ),
    );
  }

  Padding buildBadge() {
    return Padding(
      padding: const EdgeInsets.all(3),
      child: Container(
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
            color: Colors.black38, borderRadius: BorderRadius.circular(2)),
        child: Text(
          model.badge!,
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),
      ),
    );
  }

  Wrap buildTagWrap(BuildContext context) {
    return Wrap(
      spacing: 2,
      runSpacing: 2,
      children: model.tagList!.map((e) {
        return Container(
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
              e.text,
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
