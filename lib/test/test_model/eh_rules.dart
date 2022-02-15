import 'package:catweb/data/protocol/model/page.dart';
import 'package:catweb/gen/protobuf/page.pbserver.dart';
import 'package:catweb/gen/protobuf/store.pbserver.dart';
import 'package:catweb/test/test_model/cookies.dart';
import 'package:catweb/test/test_model/parser/list_parser.dart';

import 'parser/gallery_parser.dart';

final detailUuid = genUuid();

final ehTestSite = SiteConfig(
  name: 'E-Hentai',
  baseUrl: 'https://e-hentai.org/',
  listViewParsers: [ehListParser],
  detailParsers: [ehGalleryParser],
  cookies: [
    RegField(reg: r'e[-x]hentai', value: 'ipb_member_id=$ipbMemberId'),
    RegField(reg: r'e[-x]hentai', value: 'ipb_pass_hash=$ipbPassHash'),
    RegField(reg: r'e[-x]hentai', value: 'igneous=$igneous'),
    RegField(reg: r'e[-x]hentai', value: 'sk=$sk'),
    RegField(reg: r'e[-x]hentai', value: 'star=$star'),
  ],
  pages: [
    SitePage(
      name: '详情',
      uuid: detailUuid,
      template: Template.TEMPLATE_DETAIL,
      parser: galleryUuid,
      url: 'g/{idCode}/?p={page:0}',
    ),
    SitePage(
        name: '主页',
        url: '?page={page:0}',
        parser: commonListUuid,
        display: SiteDisplayType.show,
        template: Template.TEMPLATE_IMAGE_LIST,
        icon: 'home',
        openPage: [detailUuid]),
    SitePage(
      name: '热门',
      url: 'popular?page={page:0}',
      parser: commonListUuid,
      display: SiteDisplayType.show,
      template: Template.TEMPLATE_IMAGE_LIST,
      icon: 'whatshot',
      openPage: [detailUuid],
    ),
    SitePage(
      name: '关注',
      url: 'watched?page={page:0}',
      parser: commonListUuid,
      display: SiteDisplayType.show,
      template: Template.TEMPLATE_IMAGE_LIST,
      icon: 'eye',
      openPage: [detailUuid],
    ),
    SitePage(
      name: '收藏',
      url: r'favorites.php?page={page:0}${favcat:&favcat={favcat}}',
      parser: commonListUuid,
      display: SiteDisplayType.show,
      template: Template.TEMPLATE_IMAGE_LIST,
      icon: 'heart',
      openPage: [detailUuid],
      subPage: [
        SiteSubPage(name: '全部'),
        SiteSubPage(
          name: r'${fav0Tag:{fav0Tag}:Favourite 0}',
          key: 'favcat',
          value: '0',
        ),
        SiteSubPage(
          name: r'${fav1Tag:{fav1Tag}:Favourite 1}',
          key: 'favcat',
          value: '1',
        ),
        SiteSubPage(
          name: r'${fav2Tag:{fav2Tag}:Favourite 2}',
          key: 'favcat',
          value: '2',
        ),
        SiteSubPage(
          name: r'${fav3Tag:{fav3Tag}:Favourite 3}',
          key: 'favcat',
          value: '3',
        ),
        SiteSubPage(
          name: r'${fav4Tag:{fav4Tag}:Favourite 4}',
          key: 'favcat',
          value: '4',
        ),
        SiteSubPage(
          name: r'${fav5Tag:{fav5Tag}:Favourite 5}',
          key: 'favcat',
          value: '5',
        ),
        SiteSubPage(
          name: r'${fav6Tag:{fav6Tag}:Favourite 6}',
          key: 'favcat',
          value: '6',
        ),
        SiteSubPage(
          name: r'${fav7Tag:{fav7Tag}:Favourite 7}',
          key: 'favcat',
          value: '7',
        ),
        SiteSubPage(
          name: r'${fav8Tag:{fav8Tag}:Favourite 8}',
          key: 'favcat',
          value: '8',
        ),
        SiteSubPage(
          name: r'${fav9Tag:{fav9Tag}:Favourite 9}',
          key: 'favcat',
          value: '9',
        ),
      ],
    ),
  ],
);
