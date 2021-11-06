import 'package:catweb/ui/components/comment_item.dart';
import 'package:catweb/ui/fragments/gallery_detail/gallery_detail.dart';
import 'package:flutter/material.dart';

class GalleryPreview extends StatelessWidget {
  const GalleryPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = GalleryDetailModel(
        title: '标题',
        subtitle: '副标题',
        category: '分类',
        categoryColor: Colors.blue,
        favoriteCount: 100,
        imageCount: 100,
        language: '中文',
        uploadTime: DateTime.now().toString().split('.').first,
        size: '11.4MB',
        tagList: <TagModel>[
          TagModel(category: 'p1', text: '123'),
          TagModel(category: 'p2', text: '456'),
          TagModel(category: 'p3', text: 'asdf'),
          TagModel(category: 'p3', text: 'bsdf'),
          TagModel(category: 'p3', text: 'asdf'),
          TagModel(category: 'p3', text: 'abre'),
          TagModel(category: 'p3', text: 'srgth'),
          TagModel(category: 'p3', text: 'hm'),
          TagModel(category: 'p2', text: '789'),
        ],
        commentList: <CommentItemModel>[
          CommentItemModel(username: 'user1', comment: '爽啊', score: 4),
          CommentItemModel(
              username: 'simonkimi', comment: '大就是好', score: 114514),
          CommentItemModel(username: 'user2', comment: 'awsl', score: 4),
          CommentItemModel(
            username: 'user1',
            comment: '建议百度https://www.baidu.com',
            score: -9,
          ),
        ]);
    return GalleryDetail(model: model);
  }
}
