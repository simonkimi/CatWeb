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
    SitePage(name: '主页'),
  ],
);
