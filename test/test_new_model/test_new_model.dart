import 'dart:convert';

import 'package:catweb/data/models/site_model/fields/field.dart';
import 'package:catweb/data/models/site_model/pages/site_page.dart';
import 'package:catweb/data/models/site_model/pages/template.dart';
import 'package:catweb/data/models/site_model/site_blue_map.dart';
import 'package:catweb/data/protocol/model/page.dart';

import 'auto_complete.dart';
import 'gallery_parser.dart';

final ehTestSite = SiteBlueMap(
  name: 'E-Hentai',
  baseUrl: 'https://e-hentai.org/',
  loginUrl: 'https://e-hentai.org/bounce_login.php',
  loginCookieReg: 'e-hentai.org',
  loginCookieDescription: '因为登录没法直连, 导致域名不一样',
  version: '0.1',
  upgradeUrl: '',
  flag: 'ignoreCertificate',
  readme: '',
  headers: const [
    RegField(reg: r'104.20.134.21', value: 'host=e-hentai.org'),
    RegField(reg: r'178.162.147.246', value: 'host=api.e-hentai.org'),
  ],
  cookies: const [
    RegField(reg: '104.20.134.21', value: 'nw=1'),
  ],
  parserList: [autoCompleteParser, galleryParser],
  pageList: [
    SitePage(
        name: '搜索补全',
        uuid: genUuid(),
        url: 'https://api.e-hentai.org/api.php',
        action: SiteActionType.post,
        formData: r'{"method":"tagsuggest","text":"{search}"}',
        template: const TemplateAutoComplete(
          splitChar: ' ',
          timeout: 2000,
        ),
        icon: ''
        ),
  ],
);

void main() {
  var json = ehTestSite.toJson();
  // 转json字符串
  var jsonStr = jsonEncode(json);
  print(jsonStr);
}