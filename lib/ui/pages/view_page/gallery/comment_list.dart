import 'package:catweb/data/constant.dart';
import 'package:catweb/i18n.dart';
import 'package:catweb/ui/widgets/cupertino_app_bar.dart';
import 'package:flutter/cupertino.dart';

import 'comment_item.dart';
import 'controller/gallery_controller.dart';

class CommentListPage extends StatelessWidget {
  const CommentListPage({super.key, required this.previewController});

  final GalleryPreviewController previewController;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CupertinoAppBar(
        title: I.of(context).comment,
        leading: const CupertinoBackLeading(),
        child: SafeArea(
          child: ListView.builder(
            physics: const ClampingScrollPhysics(),
            itemCount: previewController.detailModel!.comments?.length ?? 0,
            padding: const EdgeInsets.only(
              left: 5,
              right: 5,
              top: kCupertinoNavigatorBar + 5,
            ),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: CommentItem(
                    model: previewController.detailModel!.comments![index]),
              );
            },
          ),
        ),
      ),
    );
  }
}
