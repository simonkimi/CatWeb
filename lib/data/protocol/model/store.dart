import 'package:catweb/data/protocol/model/parser.dart';
import 'package:catweb/gen/protobuf/actions.pbserver.dart';
import 'package:catweb/gen/protobuf/parser.pbserver.dart';
import 'package:catweb/gen/protobuf/store.pbserver.dart';
import 'package:catweb/utils/utils.dart';
import 'package:get/get.dart';

import 'actions.dart';
import 'interface.dart';

class RegFieldModel implements PbAble {
  RegFieldModel([RegField? pb])
      : reg = sobs(pb?.reg),
        value = sobs(pb?.value);

  final RxString reg;
  final RxString value;

  @override
  RegField toPb() => RegField(
        value: value.value,
        reg: reg.value,
      );
}

class RulesProtocolModel implements PbAble {
  RulesProtocolModel([RulesProtocol? pb])
      : name = sobs(pb?.name),
        baseUrl = sobs(pb?.baseUrl),
        cookies = lobs(pb?.cookies, (RegField e) => RegFieldModel(e)),
        extraCookies = sobs(pb?.extraCookies),
        headers = lobs(pb?.headers, (RegField e) => RegFieldModel(e)),
        loginUrl = sobs(pb?.loginUrl),
        loginCookieReg = sobs(pb?.loginCookieReg),
        version = sobs(pb?.version),
        galleryParsers = lobs(
            pb?.galleryParsers, (GalleryParser e) => GalleryParserModel(e)),
        listViewParser = lobs(
          pb?.listViewParser,
          (ListViewParser e) => ListViewParserModel(e),
        ),
        actionList =
            lobs(pb?.actionList, (ActionCombine e) => ActionCombineModel(e));

  final RxString name;
  final RxString baseUrl;
  final RxString extraCookies;
  final RxString loginUrl;
  final RxString loginCookieReg;
  final RxString version;

  final RxList<RegFieldModel> cookies;
  final RxList<RegFieldModel> headers;
  final RxList<GalleryParserModel> galleryParsers;
  final RxList<ListViewParserModel> listViewParser;
  final RxList<ActionCombineModel> actionList;

  @override
  RulesProtocol toPb() => RulesProtocol(
        name: name.value,
        baseUrl: baseUrl.value,
        cookies: cookies.map((e) => e.toPb()),
        extraCookies: extraCookies.value,
        headers: headers.map((e) => e.toPb()),
        loginUrl: loginUrl.value,
        loginCookieReg: loginCookieReg.value,
        version: version.value,
        galleryParsers: galleryParsers.map((e) => e.toPb()),
        listViewParser: listViewParser.map((e) => e.toPb()),
        actionList: actionList.map((e) => e.toPb()),
      );
}
