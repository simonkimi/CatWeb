import 'package:catweb/ui/components/comment_item.dart';
import 'package:catweb/ui/fragments/gallery_detail/cupertino_gallery.dart';
import 'package:flutter/material.dart';

class GalleryPreview extends StatelessWidget {
  const GalleryPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = GalleryDetailModel(
      title:
          '(C97) [Circle-FIORE (Ekakibit)] Kaki Oroshi (Ryuuou no Matome Bon) (Ryuuou no Oshigoto!) [Chinese] [转尾巴猫汉化]',
      subtitle: 'qq3870990',
      category: 'Doujinshi',
      categoryColor: Colors.red,
      favoriteCount: 100,
      imageCount: 100,
      language: '中文',
      uploadTime: DateTime.now().toString().split('.').first,
      size: '11.4MB',
      star: 4,
      tagList: <TagModel>[
        TagModel(category: 'parody', text: 'azur lane'),
        TagModel(category: 'character', text: 'laffey'),
        TagModel(category: 'group', text: 'suwateria'),
        TagModel(category: 'artist', text: 'ooba nii'),
        TagModel(category: 'male', text: 'sole male'),
        TagModel(category: 'female', text: 'big breasts'),
        TagModel(category: 'female', text: 'lactation'),
        TagModel(category: 'female', text: 'paizuri'),
        TagModel(category: 'female', text: 'shimapan'),
        TagModel(category: 'female', text: 'stockings'),
        TagModel(category: 'female', text: 'twintails'),
        TagModel(category: 'misc', text: 'mosaic censorship'),
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
        CommentItemModel(
          username: 'user1',
          comment: '爽啊',
          score: 4,
          commentTime: DateTime.now().toString().split('.').first,
        ),
        CommentItemModel(
          username: 'simonkimi',
          comment: '大就是好',
          score: 114514,
          commentTime: DateTime.now().toString().split('.').first,
        ),
        CommentItemModel(
          username: 'user2',
          comment: 'awsl',
          score: 4,
          commentTime: DateTime.now().toString().split('.').first,
        ),
        CommentItemModel(
          username: 'user1',
          comment: '建议百度https://www.baidu.com',
          score: -9,
          commentTime: DateTime.now().toString().split('.').first,
        ),
      ],
    );
    return CupertinoGallery(model: model);
  }
}
