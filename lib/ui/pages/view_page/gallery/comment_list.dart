import 'package:catweb/data/constant.dart';
import 'package:catweb/data/models/ffi/result/base.dart';
import 'package:catweb/i18n.dart';
import 'package:catweb/ui/widgets/comment_item.dart';
import 'package:catweb/ui/widgets/cupertino_app_bar.dart';
import 'package:flutter/cupertino.dart';

class CommentListPage extends StatelessWidget {
  const CommentListPage({super.key, required this.comments});

  final List<CommentResult> comments;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CupertinoAppBar(
        title: I.of(context).comment,
        leading: const CupertinoBackLeading(),
        child: SafeArea(
          child: ListView.builder(
            physics: const ClampingScrollPhysics(),
            itemCount: comments.length,
            padding: const EdgeInsets.only(
              left: 5,
              right: 5,
              top: kCupertinoNavigatorBar + 5,
            ),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: CommentItem(
                  model: comments[index],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
