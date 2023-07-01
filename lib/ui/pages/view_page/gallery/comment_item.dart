import 'package:catweb/data/models/ffi/parser_result.dart';
import 'package:catweb/ui/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_linkify/flutter_linkify.dart';

class CommentItem extends StatelessWidget {
  const CommentItem({super.key, required this.model});

  final GalleryParserResultComment model;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FixColor.groupedColor.resolveFrom(context),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (model.username != null)
                Text(
                  model.username!,
                  style: const TextStyle(
                      color: CupertinoColors.activeBlue,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              const Expanded(child: SizedBox()),
              if (model.score != null)
                Text(
                  model.score!,
                  style: TextStyle(
                    fontSize: 12,
                    color: CupertinoColors.secondaryLabel.resolveFrom(context),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 5),
          if (model.content != null)
            Linkify(
              text: model.content!,
              options: const LinkifyOptions(looseUrl: true),
              style: TextStyle(
                fontSize: 15,
                color: FixColor.title.resolveFrom(context),
              ),
              onOpen: (value) {},
            ),
          const SizedBox(height: 5),
          if (model.time != null)
            Text(
              model.time!,
              style: TextStyle(
                fontSize: 12,
                color: CupertinoColors.secondaryLabel.resolveFrom(context),
              ),
            ),
        ],
      ),
    );
  }
}
