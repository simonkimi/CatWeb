import 'package:catweb/gen/protobuf/page.pbserver.dart';
import 'package:catweb/gen/protobuf/store.pbserver.dart';

import 'gallery_parser.dart';
import 'list_parser.dart';

final ehTestSite = SiteConfig(
  name: 'EHentai',
  baseUrl: 'https://e-hentai.org/',
  listViewParser: [ehListParser],
  galleryParsers: [ehGalleryParser],
  pageList: [
    SitePage(
      name: '主页',
      url: 'https://e-hentai.org/',
      parser: 'commonList',
      display: SiteDisplayType.show,
      template: PageTemplate.imageList,
      icon: 'home',
    ),
    SitePage(
      name: '收藏',
      url: 'https://e-hentai.org/favorites.php',
      parser: 'commonList',
      display: SiteDisplayType.show,
      template: PageTemplate.imageList,
      icon: 'home',
      subPage: [
        SiteSubPage(
          name: '全部',
        ),
        SiteSubPage(
          name: 'Favourite 0',
          key: 'favcat',
          value: '0',
        ),
      ],
    ),
  ],
);
