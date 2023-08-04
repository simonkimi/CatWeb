import 'package:catweb/data/models/ffi/result/result.dart';
import 'package:catweb/network/client/image_concurrency.dart';
import 'package:catweb/ui/widgets/badge.dart';
import 'package:catweb/ui/widgets/image_loader.dart';
import 'package:catweb/ui/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ListExtendedCard extends StatelessWidget {
  const ListExtendedCard({
    super.key,
    required this.model,
    required this.onTap,
    required this.concurrency,
  });

  final ListParserResultItem model;
  final VoidCallback onTap;
  final ImageListConcurrency concurrency;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: IntrinsicHeight(
        child: Row(
          children: [
            _buildLeftImage(),
            const SizedBox(width: 3),
            _buildRightInfo(context),
          ],
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
            style: TextStyle(
                color: FixColor.title.resolveFrom(context), fontSize: 15),
          ),
        if (model.subtitle != null)
          Text(
            model.subtitle!,
            style: TextStyle(
              color: CupertinoColors.secondaryLabel.resolveFrom(context),
              fontSize: 13,
            ),
          ),
        const SizedBox(height: 3),
        if (model.badges?.isNotEmpty ?? false) _buildBadgesWrap(context),
      ],
    );
  }

  Widget _buildLeftImage() {
    final child = ImageLoader(
      model: model.previewImage!,
      concurrency: concurrency,
      innerImageBuilder: (context, child) {
        return Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: isDarkMode(context)
                    ? CupertinoColors.white.withOpacity(0.2)
                    : CupertinoColors.black.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 1,
                offset: const Offset(1, 1),
              ),
            ],
          ),
          child: child,
        );
      },
    );

    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 160, minHeight: 140),
      child: SizedBox(
        width: 110,
        child: model.previewImage!.width != null &&
                model.previewImage!.height != null
            ? AspectRatio(
                aspectRatio:
                    model.previewImage!.width! / model.previewImage!.height!,
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
      children: model.badges!.where((e) => e.text != null).map((e) {
        return SlimBadge(
          color: parseColorString(e.color),
          text: e.text!,
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
              if (model.star != null) _buildStar(context),
              if (model.tags != null) _buildTag(context),
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
                  if (model.language != null)
                    Text(
                      model.language!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12.5,
                        height: 1.1,
                        color:
                            CupertinoColors.secondaryLabel.resolveFrom(context),
                      ),
                    ),
                  if (model.imageCount != null)
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        '${model.imageCount}P',
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
              if (model.uploadTime != null)
                Text(
                  model.uploadTime!,
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
    final tag = model.tags!.first;
    return Padding(
      padding: const EdgeInsets.only(top: 2),
      child: SlimBadge(
        color: parseColorString(tag.color),
        text: tag.text!,
        fontSize: 11,
        padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 2),
        borderRadius: 5,
      ),
    );
  }
}
