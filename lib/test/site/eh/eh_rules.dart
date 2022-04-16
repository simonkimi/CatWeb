import 'dart:ui';

import 'package:catweb/data/protocol/model/page.dart';
import 'package:catweb/gen/protobuf/actions.pbserver.dart';
import 'package:catweb/gen/protobuf/page.pbserver.dart';
import 'package:catweb/gen/protobuf/store.pbserver.dart';
import 'package:catweb/gen/protobuf/template.pb.dart';
import 'package:catweb/gen/protobuf/template.pbserver.dart';
import 'package:catweb/test/site/eh/parser/auto_complete_parser.dart';
import 'package:catweb/test/site/eh/parser/image_parser.dart';
import 'package:catweb/ui/theme/colors.dart';

import 'parser/gallery_parser.dart';
import 'parser/list_parser.dart';

final _detailUuid = genUuid();

final _autoCompleteUuid = genUuid();
final _readerUuid = genUuid();

final ehTestSite = SiteBlueprint(
  name: 'E-Hentai',
  baseUrl: 'https://104.20.134.21/',
  listViewParsers: [ehListParser],
  galleryParsers: [ehGalleryParser],
  autoCompleteParsers: [ehAutoCompleteParser],
  imageParsers: [ehImageParser],
  flag: 'ignoreCertificate',
  loginUrl: 'https://forums.e-hentai.org/index.php?act=Login&CODE=00',
  loginCookieReg: '104.20.134.21',
  loginCookieDescription: '因为登录没法直连, 导致域名不一样',
  headers: [
    RegField(reg: r'104.20.134.21', value: 'host=e-hentai.org'),
    RegField(reg: r'178.162.147.246', value: 'host=api.e-hentai.org'),
  ],
  cookies: [
    RegField(reg: '104.20.134.21', value: 'nw=1'),
  ],
  pages: [
    SitePage(
      name: '搜索补全',
      uuid: _autoCompleteUuid,
      url: 'https://178.162.147.246/api.php',
      netAction: NetActionType.NET_ACTION_TYPE_POST,
      formData: r'{"method":"tagsuggest","text":"{search}"}',
      template: Template.TEMPLATE_AUTO_COMPLETE,
      baseParser: ehAutoCompleteParser.uuid,
      templateData: TemplateAutoComplete(
        splitChar: ' ',
        timeout: 2,
      ).writeToBuffer(),
    ),
    SitePage(
      name: '图片显示器',
      url: 's/{idCode}',
      uuid: _readerUuid,
      template: Template.TEMPLATE_IMAGE_VIEWER,
      baseParser: ehImageParser.uuid,
    ),
    SitePage(
      name: '画廊',
      uuid: _detailUuid,
      template: Template.TEMPLATE_GALLERY,
      baseParser: ehGalleryParser.uuid,
      url: 'g/{idCode}/?p={page:0}',
      templateData: TemplateGalleryData(
        targetReader: _readerUuid,
      ).writeToBuffer(),
    ),
    SitePage(
      name: '主页',
      url: r'?page={page:0}${search:&f_search={search}}${filter:&{filter}}',
      baseParser: ehListParser.uuid,
      display: SiteDisplayType.show,
      template: Template.TEMPLATE_IMAGE_LIST,
      icon: 'home',
      templateData: TemplateListData(
        targetItem: _detailUuid,
        targetAutoComplete: _autoCompleteUuid,
        disableUnchanged: true,
        filterItem: [
          TemplateListData_FilterItem(
            name: '同人志',
            key: 'b_doujinshi',
            type: TemplateListData_FilterType.FILTER_TYPE_BOOL_CARD,
            value: 'true',
            color: const Color(0xfff76057).rpc,
          ),
          TemplateListData_FilterItem(
            name: '漫画',
            key: 'b_manga',
            type: TemplateListData_FilterType.FILTER_TYPE_BOOL_CARD,
            value: 'true',
            color: const Color(0xfff09c19).rpc,
          ),
          TemplateListData_FilterItem(
            name: '游戏CG',
            key: 'b_gamecg',
            type: TemplateListData_FilterType.FILTER_TYPE_BOOL_CARD,
            value: 'true',
            color: const Color(0xff0faa11).rpc,
          ),
          TemplateListData_FilterItem(
            name: '图片集',
            key: 'b_imageset',
            type: TemplateListData_FilterType.FILTER_TYPE_BOOL_CARD,
            value: 'true',
            color: const Color(0xff455bd6).rpc,
          ),
          TemplateListData_FilterItem(
            name: '画师CG',
            key: 'b_artistcg',
            type: TemplateListData_FilterType.FILTER_TYPE_BOOL_CARD,
            value: 'true',
            color: const Color(0xffd5d703).rpc,
          ),
          TemplateListData_FilterItem(
            name: 'Cosplay',
            key: 'b_cosplay',
            type: TemplateListData_FilterType.FILTER_TYPE_BOOL_CARD,
            value: 'true',
            color: const Color(0xff9133e1).rpc,
          ),
          TemplateListData_FilterItem(
            name: '西方',
            key: 'b_western',
            type: TemplateListData_FilterType.FILTER_TYPE_BOOL_CARD,
            value: 'true',
            color: const Color(0xff38d42f).rpc,
          ),
          TemplateListData_FilterItem(
            name: '亚洲色情',
            key: 'b_asianporn',
            type: TemplateListData_FilterType.FILTER_TYPE_BOOL_CARD,
            value: 'true',
            color: const Color(0xffe77fe3).rpc,
          ),
          TemplateListData_FilterItem(
            name: '无H',
            key: 'b_nonh',
            type: TemplateListData_FilterType.FILTER_TYPE_BOOL_CARD,
            value: 'true',
            color: const Color(0xff0cb9cf).rpc,
          ),
          TemplateListData_FilterItem(
            name: '杂项',
            key: 'b_misc',
            type: TemplateListData_FilterType.FILTER_TYPE_BOOL_CARD,
            value: 'true',
            color: const Color(0xff858585).rpc,
          ),
          TemplateListData_FilterItem(
            name: '搜索画廊名称',
            key: 'f_sname',
            type: TemplateListData_FilterType.FILTER_TYPE_BOOL,
            value: 'true',
          ),
          TemplateListData_FilterItem(
            name: '搜索画廊标签',
            key: 'f_stags',
            type: TemplateListData_FilterType.FILTER_TYPE_BOOL,
            value: 'true',
          ),
          TemplateListData_FilterItem(
            name: '搜索画廊种子',
            key: 'f_storr',
            type: TemplateListData_FilterType.FILTER_TYPE_BOOL,
            value: 'false',
          ),
          TemplateListData_FilterItem(
            name: '搜索低愿力标签',
            key: 'f_sdt1',
            type: TemplateListData_FilterType.FILTER_TYPE_BOOL,
            value: 'false',
          ),
          TemplateListData_FilterItem(
            name: '搜索画廊描述',
            key: 'f_sdesc',
            type: TemplateListData_FilterType.FILTER_TYPE_BOOL,
            value: 'false',
          ),
          TemplateListData_FilterItem(
            name: '显示删除的画廊',
            key: 'f_sh',
            type: TemplateListData_FilterType.FILTER_TYPE_BOOL,
            value: 'false',
          ),
        ],
        script:
            'function hook(n){var a=JSON.parse(n),r=0,i=0,o=["misc","doujinshi","manga","artistcg","gamecg","imageset","cosplay","asianporn","nonh","western"];for(var s in o)r+=a["b_"+o[s]]?0:1<<i,i+=1;var e=["advsearch=1"];for(var s in 0!=r&&e.push("f_cats="+r),a)-1!=s.indexOf("f")&&a[s]&&e.push(s+"=on");return e.join("&")}',
      ).writeToBuffer(),
    ),
    SitePage(
      name: '热门',
      url: 'popular?page={page:0}',
      baseParser: ehListParser.uuid,
      display: SiteDisplayType.show,
      template: Template.TEMPLATE_IMAGE_LIST,
      icon: 'whatshot',
      templateData: TemplateListData(
        targetItem: _detailUuid,
      ).writeToBuffer(),
    ),
    SitePage(
      name: '关注',
      url: 'watched?page={page:0}',
      baseParser: ehListParser.uuid,
      display: SiteDisplayType.show,
      template: Template.TEMPLATE_IMAGE_LIST,
      icon: 'eye',
      templateData: TemplateListData(
        targetItem: _detailUuid,
      ).writeToBuffer(),
    ),
    SitePage(
      name: '收藏',
      url: r'favorites.php?page={page:0}${favcat:&favcat={favcat}}',
      baseParser: ehListParser.uuid,
      display: SiteDisplayType.show,
      template: Template.TEMPLATE_IMAGE_LIST,
      icon: 'heart',
      templateData: TemplateListData(
        targetItem: _detailUuid,
        subPages: [
          TemplateListData_SubPage(name: '全部'),
          TemplateListData_SubPage(
            name: r'${fav0Tag:{fav0Tag}:Favourite 0}',
            key: 'favcat',
            value: '0',
          ),
          TemplateListData_SubPage(
            name: r'${fav1Tag:{fav1Tag}:Favourite 1}',
            key: 'favcat',
            value: '1',
          ),
          TemplateListData_SubPage(
            name: r'${fav2Tag:{fav2Tag}:Favourite 2}',
            key: 'favcat',
            value: '2',
          ),
          TemplateListData_SubPage(
            name: r'${fav3Tag:{fav3Tag}:Favourite 3}',
            key: 'favcat',
            value: '3',
          ),
          TemplateListData_SubPage(
            name: r'${fav4Tag:{fav4Tag}:Favourite 4}',
            key: 'favcat',
            value: '4',
          ),
          TemplateListData_SubPage(
            name: r'${fav5Tag:{fav5Tag}:Favourite 5}',
            key: 'favcat',
            value: '5',
          ),
          TemplateListData_SubPage(
            name: r'${fav6Tag:{fav6Tag}:Favourite 6}',
            key: 'favcat',
            value: '6',
          ),
          TemplateListData_SubPage(
            name: r'${fav7Tag:{fav7Tag}:Favourite 7}',
            key: 'favcat',
            value: '7',
          ),
          TemplateListData_SubPage(
            name: r'${fav8Tag:{fav8Tag}:Favourite 8}',
            key: 'favcat',
            value: '8',
          ),
          TemplateListData_SubPage(
            name: r'${fav9Tag:{fav9Tag}:Favourite 9}',
            key: 'favcat',
            value: '9',
          ),
        ],
      ).writeToBuffer(),
    ),
  ],
);
