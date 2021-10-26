import 'package:cat_web/data/protocol/model/parser.dart';
import 'package:cat_web/gen/protobuf/actions.pbserver.dart';
import 'package:cat_web/gen/protobuf/parser.pbserver.dart';
import 'package:cat_web/gen/protobuf/store.pbserver.dart';
import 'package:cat_web/utils/utils.dart';
import 'package:get/get.dart';

import 'actions.dart';
import 'interface.dart';

class HeaderModel implements PbAble {
  HeaderModel([Header? pb])
      : reg = sobs(pb?.reg),
        header = sobs(pb?.headers);

  final RxString reg;
  final RxString header;

  @override
  Header toPb() => Header(
        headers: header.value,
        reg: reg.value,
      );
}

class RulesProtocolModel implements PbAble {
  RulesProtocolModel([RulesProtocol? pb])
      : name = sobs(pb?.name),
        baseUrl = sobs(pb?.baseUrl),
        cookies = sobs(pb?.cookies),
        extraCookies = sobs(pb?.extraCookies),
        headers = lobs(pb?.headers, (Header e) => HeaderModel(e)),
        loginUrl = sobs(pb?.loginUrl),
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
  final RxString cookies;
  final RxString extraCookies;
  final RxString loginUrl;

  final RxList<HeaderModel> headers;
  final RxList<GalleryParserModel> galleryParsers;
  final RxList<ListViewParserModel> listViewParser;
  final RxList<ActionCombineModel> actionList;

  @override
  RulesProtocol toPb() => RulesProtocol(
        name: name.value,
        baseUrl: baseUrl.value,
        cookies: cookies.value,
        extraCookies: extraCookies.value,
        headers: headers.map((e) => e.toPb()),
        loginUrl: loginUrl.value,
        galleryParsers: galleryParsers.map((e) => e.toPb()),
        listViewParser: listViewParser.map((e) => e.toPb()),
        actionList: actionList.map((e) => e.toPb()),
      );
}
