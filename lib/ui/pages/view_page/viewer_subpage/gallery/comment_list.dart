import 'package:catweb/data/constant.dart';
import 'package:catweb/ui/widgets/cupertino_app_bar.dart';
import 'package:flutter/cupertino.dart';

import 'comment_item.dart';
import 'gallery_controller.dart';

class CommentListPage extends StatelessWidget {
  const CommentListPage({super.key, required this.c});

  final GalleryPreviewController c;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CupertinoAppBar(
        title: '评论',
        leading: const CupertinoBackLeading(),
        child: SafeArea(
          child: ListView.builder(
            physics: const ClampingScrollPhysics(),
            itemCount: c.detailModel!.comments.length,
            padding: const EdgeInsets.only(
              left: 5,
              right: 5,
              top: kCupertinoNavigatorBar + 5,
            ),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: CommentItem(model: c.detailModel!.comments[index]),
              );
            },
          ),
        ),
      ),
    );
  }
}
