import 'package:catweb/gen/protobuf/model.pbserver.dart';
import 'package:catweb/network/client/image_concurrency.dart';
import 'package:catweb/ui/components/badge.dart';
import 'package:catweb/ui/components/image_loader.dart';
import 'package:catweb/ui/theme/colors.dart';
import 'package:catweb/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ListExtendedCard extends StatelessWidget {
  const ListExtendedCard({
    Key? key,
    required this.model,
    required this.onTap,
    required this.concurrency,
  }) : super(key: key);

  final ListRpcModel_Item model;
  final VoidCallback onTap;
  final ImageConcurrency concurrency;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(1, 1),
              blurRadius: 2,
            ),
          ],
        ),
        child: Container(
          color: isDarkMode(context)
              ? FixColor.groupedColor.resolveFrom(context)
              : CupertinoColors.systemBackground,
          child: IntrinsicHeight(
            child: Row(
              children: [
                if (model.hasPreviewImg()) _buildLeftImage(),
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
        if (model.hasTitle())
          Text(
            model.title,
            maxLines: 2,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: FixColor.title.resolveFrom(context), fontSize: 15),
          ),
        if (model.hasSubtitle())
          Text(
            model.subtitle,
            style: TextStyle(
              color: CupertinoColors.secondaryLabel.resolveFrom(context),
              fontSize: 13,
            ),
          ),
        const SizedBox(height: 3),
        if (model.badges.isNotEmpty) _buildBadgesWrap(context),
      ],
    );
  }

  Widget _buildLeftImage() {
    final child = ImageLoader(
      model: model.previewImg,
      concurrency: concurrency,
    );

    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 160, minHeight: 140),
      child: SizedBox(
        width: 110,
        child: model.previewImg.hasWidth() && model.previewImg.hasHeight()
            ? AspectRatio(
                aspectRatio: model.previewImg.width / model.previewImg.height,
                child: child,
              )
            : child,
      ),
    );
  }

  Wrap _buildBadgesWrap(BuildContext context) {
    return Wrap(
      spacing: 2,
      runSpacing: 2,
      children: model.badges.where((e) => e.hasText()).map((e) {
        return Badge(
          color: e.color.color,
          text: e.text,
          fontSize: 11,
          padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 2),
          borderRadius: 5,
        );
      }).toList(),
    );
  }

  Widget _buildTile(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (model.hasStar()) _buildStar(context),
              if (model.hasTag()) _buildTag(context),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (model.hasLanguage())
                    Text(
                      model.language,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12.5,
                        height: 1.1,
                        color:
                            CupertinoColors.secondaryLabel.resolveFrom(context),
                      ),
                    ),
                  if (model.hasImgCount())
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        '${model.imgCount}P',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12.5,
                          color: CupertinoColors.secondaryLabel
                              .resolveFrom(context),
                          height: 1.1,
                        ),
                      ),
                    ),
                ],
              ),
              if (model.hasUploadTime())
                Text(
                  model.uploadTime,
                  style: TextStyle(
                    fontSize: 12.5,
                    color: CupertinoColors.secondaryLabel.resolveFrom(context),
                  ),
                ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildStar(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RatingBar.builder(
          itemSize: 16,
          ignoreGestures: true,
          initialRating: model.star,
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
          model.star.toString(),
          style: TextStyle(
            fontSize: 12,
            color: FixColor.title.resolveFrom(context),
          ),
        ),
      ],
    );
  }

  Widget _buildTag(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2),
      child: Badge(
        color: model.tag.color.color,
        text: model.tag.text,
        fontSize: 11,
        padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 2),
        borderRadius: 5,
      ),
    );
  }
}
