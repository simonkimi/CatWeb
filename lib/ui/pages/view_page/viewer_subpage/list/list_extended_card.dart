import 'package:catweb/ui/components/badge.dart';
import 'package:catweb/ui/model/viewer_list_model.dart';
import 'package:catweb/ui/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ListExtendedCard extends StatelessWidget {
  const ListExtendedCard({
    Key? key,
    required this.model,
  }) : super(key: key);

  final ViewerListModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0.5, 0.5),
              blurRadius: 1,
            ),
          ],
        ),
        child: Container(
          color: isDarkMode(context)
              ? CupertinoColors.systemGrey6.darkColor
              : CupertinoColors.systemBackground,
          child: IntrinsicHeight(
            child: Row(
              children: [
                _buildLeftImage(),
                _buildRightInfo(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Expanded _buildRightInfo(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildRightHeader(context),
            const Expanded(child: SizedBox()),
            _buildTile(context),
          ],
        ),
      ),
    );
  }

  Column _buildRightHeader(BuildContext context) {
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

  SizedBox _buildLeftImage() {
    return SizedBox(
      width: 110,
      child: Image.asset('assets/images/sample2.jpg'),
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
}
