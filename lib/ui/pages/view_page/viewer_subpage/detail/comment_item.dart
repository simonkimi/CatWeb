import 'package:catweb/gen/protobuf/model.pb.dart';
import 'package:catweb/ui/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_linkify/flutter_linkify.dart';

class CommentItem extends StatelessWidget {
  const CommentItem({Key? key, required this.model}) : super(key: key);

  final DetailRpcModel_Comment model;

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
              Text(
                model.username,
                style: const TextStyle(
                    color: CupertinoColors.activeBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              const Expanded(child: SizedBox()),
              Text(
                model.score,
                style: TextStyle(
                  fontSize: 12,
                  color: CupertinoColors.secondaryLabel.resolveFrom(context),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Linkify(
            text: model.content,
            options: const LinkifyOptions(looseUrl: true),
            style: TextStyle(
              fontSize: 15,
              color: FixColor.title.resolveFrom(context),
            ),
            onOpen: (value) {},
          ),
          const SizedBox(height: 5),
          Text(
            model.time,
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
