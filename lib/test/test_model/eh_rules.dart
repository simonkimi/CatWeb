import 'package:catweb/gen/protobuf/page.pbserver.dart';
import 'package:catweb/gen/protobuf/store.pbserver.dart';
import 'package:catweb/test/test_model/cookies.dart';

import 'gallery_parser.dart';
import 'list_parser.dart';

final ehTestSite = SiteConfig(
  name: 'E-Hentai',
  baseUrl: 'https://e-hentai.org/',
  listViewParser: [ehListParser],
  galleryParsers: [ehGalleryParser],
  cookies: [
    RegField(value: 'ipb_member_id=$ipbMemberId'),
    RegField(value: 'ipb_pass_hash=$ipbPassHash'),
    RegField(value: 'igneous=$igneous'),
  ],
  pageList: [
    SitePage(
      name: '主页',
      url: '',
      parser: 'commonList',
      display: SiteDisplayType.show,
      template: PageTemplate.imageList,
      icon: 'home',
    ),
    SitePage(
      name: '收藏',
      url: r'favorites.php?${favcat:favcat={favcat}}',
      parser: 'commonList',
      display: SiteDisplayType.show,
      template: PageTemplate.imageList,
      icon: 'home',
      subPage: [
        SiteSubPage(name: '全部'),
        SiteSubPage(name: r'${fav1Tag:{fav1Tag}:Favourite 1}', key: 'favcat', value: '0'),
        SiteSubPage(name: r'${fav2Tag:{fav2Tag}:Favourite 2}', key: 'favcat', value: '1'),
      ],
    ),
  ],
);
