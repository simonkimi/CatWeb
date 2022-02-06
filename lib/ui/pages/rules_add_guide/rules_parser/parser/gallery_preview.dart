import 'package:catweb/gen/protobuf/model.pbserver.dart';
import 'package:catweb/ui/pages/view_page/viewer_subpage/detail/detail.dart';
import 'package:flutter/material.dart';

class GalleryPreview extends StatelessWidget {
  const GalleryPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = DetailRpcModel(
      title:
          '(C97) [Circle-FIORE (Ekakibit)] Kaki Oroshi (Ryuuou no Matome Bon) (Ryuuou no Oshigoto!) [Chinese] [转尾巴猫汉化]',
      subtitle: 'qq3870990',
      tag: TagRpcModel(text: 'Doujinshi', color: ColorRpcModel()),
      countPrePage: 100,
      language: '中文',
      uploadTime: DateTime.now().toString().split('.').first,
      star: 4,
      badges: <DetailRpcModel_Badge>[
        DetailRpcModel_Badge(category: 'parody', text: 'azur lane'),
        DetailRpcModel_Badge(category: 'character', text: 'laffey'),
        DetailRpcModel_Badge(category: 'group', text: 'suwateria'),
        DetailRpcModel_Badge(category: 'artist', text: 'ooba nii'),
        DetailRpcModel_Badge(category: 'male', text: 'sole male'),
        DetailRpcModel_Badge(category: 'female', text: 'big breasts'),
        DetailRpcModel_Badge(category: 'female', text: 'lactation'),
        DetailRpcModel_Badge(category: 'female', text: 'paizuri'),
        DetailRpcModel_Badge(category: 'female', text: 'shimapan'),
        DetailRpcModel_Badge(category: 'female', text: 'stockings'),
        DetailRpcModel_Badge(category: 'female', text: 'twintails'),
        DetailRpcModel_Badge(category: 'misc', text: 'mosaic censorship'),
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
      comments: <DetailRpcModel_Comment>[
        DetailRpcModel_Comment(
          username: 'user1',
          content: '爽啊',
          score: '4',
          time: DateTime.now().toString().split('.').first,
        ),
        DetailRpcModel_Comment(
          username: 'simonkimi',
          content: '大就是好',
          score: '114514',
          time: DateTime.now().toString().split('.').first,
        ),
        DetailRpcModel_Comment(
          username: 'user2',
          content: 'awsl',
          score: '4',
          time: DateTime.now().toString().split('.').first,
        ),
        DetailRpcModel_Comment(
          username: 'user1',
          content: '建议百度https://www.baidu.com',
          score: '-9',
          time: DateTime.now().toString().split('.').first,
        ),
      ],
    );
    return ViewerDetail(model: model);
  }
}
