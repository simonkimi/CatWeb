import 'package:catweb/gen/protobuf/page.pbserver.dart';
import 'package:catweb/gen/protobuf/store.pbserver.dart';
import 'package:catweb/test/test_model/cookies.dart';
import 'package:catweb/test/test_model/parser/list_parser.dart';

import 'parser/gallery_parser.dart';

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
      url: r'favorites.php?{page:0}${favcat:&favcat={favcat}}',
      parser: 'commonList',
      display: SiteDisplayType.show,
      template: PageTemplate.imageList,
      icon: 'home',
      subPage: [
        SiteSubPage(name: '全部'),
        SiteSubPage(name: r'${fav2Tag:{fav0Tag}:Favourite 0}', key: 'favcat', value: '0'),
        SiteSubPage(name: r'${fav1Tag:{fav1Tag}:Favourite 1}', key: 'favcat', value: '1'),
        SiteSubPage(name: r'${fav2Tag:{fav2Tag}:Favourite 2}', key: 'favcat', value: '2'),
        SiteSubPage(name: r'${fav2Tag:{fav3Tag}:Favourite 3}', key: 'favcat', value: '3'),
        SiteSubPage(name: r'${fav2Tag:{fav4Tag}:Favourite 4}', key: 'favcat', value: '4'),
        SiteSubPage(name: r'${fav2Tag:{fav5Tag}:Favourite 5}', key: 'favcat', value: '5'),
        SiteSubPage(name: r'${fav2Tag:{fav6Tag}:Favourite 6}', key: 'favcat', value: '6'),
        SiteSubPage(name: r'${fav2Tag:{fav7Tag}:Favourite 7}', key: 'favcat', value: '7'),
        SiteSubPage(name: r'${fav2Tag:{fav8Tag}:Favourite 8}', key: 'favcat', value: '8'),
        SiteSubPage(name: r'${fav2Tag:{fav9Tag}:Favourite 9}', key: 'favcat', value: '9'),
      ],
    ),
  ],
);
