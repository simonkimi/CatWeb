import 'package:catweb/ui/components/comment_item.dart';
import 'package:catweb/ui/fragments/gallery_detail/cupertino_gallery.dart';
import 'package:flutter/material.dart';

class GalleryPreview extends StatelessWidget {
  const GalleryPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = GalleryDetailModel(
        title: '(C97) [Circle-FIORE (Ekakibit)] Kaki Oroshi (Ryuuou no Matome Bon) (Ryuuou no Oshigoto!) [Chinese] [转尾巴猫汉化]',
        subtitle: 'qq3870990',
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
        description: '''RAW：https://e-hentai.org/s/9acab29be6/1870894-153

感谢金主 匿名绅士 出资汉化，喜欢该作的绅士们请购买原版来支持作者

其他已汉化的章节
[oo君個人漢化](C93) [サークルフィオレ (えかきびと)] おつかれさまですししょー (りゅうおうのおしごと!)
https://e-hentai.org/g/1166395/b70765ec75/
[靴下汉化组](C93) [サークルフィオレ (えかきびと)] おつかれさまですししょー (りゅうおうのおしごと!)
https://e-hentai.org/g/1165459/22b2d20e19/
[無邪気漢化組](COMIC1☆13) [サークルフィオレ (えかきびと)] 姉弟子の一番長い日 (りゅうおうのおしごと!)
https://e-hentai.org/g/1228259/4190225563/
[oo君x赤蜘蛛聯合漢化](C94) [サークルフィオレ (えかきびと)] りゅうおうのきゅうじつ・表 (りゅうおうのおしごと!)
https://e-hentai.org/g/1275854/ba1ce82ecb/
[脸肿汉化组](C94) [サークルフィオレ (えかきびと)] りゅうおうのきゅうじつ・裏 (りゅうおうのおしごと!)
https://e-hentai.org/g/1274243/d634efbccd/
[oo君x赤蜘蛛聯合漢化](C94) [サークルフィオレ (えかきびと)] りゅうおうのきゅうじつ・裏 (りゅうおうのおしごと!)
https://e-hentai.org/g/1275855/d8c63069e4/''',
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
    return CupertinoGallery(model: model);
  }
}
