import 'package:catweb/ui/model/detail_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';

class CommentItem extends StatelessWidget {
  const CommentItem({
    Key? key,
    required this.model,
    this.maxLine,
    this.onTap,
    this.onOpen,
  }) : super(key: key);

  final CommentItemModel model;
  final int? maxLine;
  final VoidCallback? onTap;
  final LinkCallback? onOpen;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (model.username != null)
                Expanded(
                  child: Text(
                    model.username!,
                    style: TextStyle(
                      color: Theme.of(context).textTheme.subtitle2!.color,
                    ),
                  ),
                ),
              if (model.score != null)
                Expanded(
                  child: Row(
                    mainAxisAlignment: model.commentTime != null
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.end,
                    children: [
                      Text(
                        (model.score! >= 0 ? '   +' : '   ') +
                            model.score.toString(),
                        style: TextStyle(
                          fontSize: 13,
                          color: Theme.of(context).textTheme.subtitle2!.color,
                        ),
                      )
                    ],
                  ),
                ),
              if (model.commentTime != null)
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        model.commentTime!,
                        style: TextStyle(
                          fontSize: 13,
                          color: Theme.of(context).textTheme.subtitle2!.color,
                        ),
                      )
                    ],
                  ),
                ),
            ],
          ),
          const SizedBox(height: 5),
          if (model.comment != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SelectableLinkify(
                  text: model.comment!,
                  scrollPhysics: const NeverScrollableScrollPhysics(),
                  options: const LinkifyOptions(humanize: false),
                  maxLines: maxLine,
                  minLines: 1,
                  onTap: onTap,
                  onOpen: onOpen,
                  linkStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            )
        ],
      ),
    );
  }
}
