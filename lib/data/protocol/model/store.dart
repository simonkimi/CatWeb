import 'package:catweb/data/protocol/model/page.dart';
import 'package:catweb/data/protocol/model/parser.dart';
import 'package:catweb/gen/protobuf/actions.pbserver.dart';
import 'package:catweb/gen/protobuf/page.pbserver.dart';
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

class SiteBlueprintModel implements PbAble {
  SiteBlueprintModel([SiteBlueprint? pb])
      : name = sobs(pb?.name),
        baseUrl = sobs(pb?.baseUrl),
        cookies = lobs(pb?.cookies, (RegField e) => RegFieldModel(e)),
        headers = lobs(pb?.headers, (RegField e) => RegFieldModel(e)),
        loginUrl = sobs(pb?.loginUrl),
        loginCookieReg = sobs(pb?.loginCookieReg),
        loginCookieDescription = sobs(pb?.loginCookieDescription),
        version = sobs(pb?.version),
        upgradeUrl = sobs(pb?.upgradeUrl),
        flag = sobs(pb?.flag),
        actionList = lobs(
          pb?.actions,
          (ActionCombine e) => ActionCombineModel(e),
        ),
        pageList = lobs(pb?.pages, (SitePage e) => PageBlueprintModel(e)),
        readme = sobs(pb?.readme),
        parsers = lobs(pb?.parsers, (ParserStore e) {
          switch (e.type) {
            case ParserType.PARSER_TYPE_AUTO_COMPLETE:
              return AutoCompleteParserModel(
                  AutoCompleteParser.fromBuffer(e.parser));
            case ParserType.PARSER_TYPE_GALLERY:
              return GalleryParserModel(GalleryParser.fromBuffer(e.parser));
            case ParserType.PARSER_TYPE_IMAGE:
              return ImageReaderParserModel(
                  ImageReaderParser.fromBuffer(e.parser));
            case ParserType.PARSER_TYPE_LIST_VIEW:
              return ListViewParserModel(ListViewParser.fromBuffer(e.parser));
          }
          throw Exception('Unknown parser type: ${e.type}');
        });

  factory SiteBlueprintModel.fromBuffer(List<int> buffer) =>
      SiteBlueprintModel(SiteBlueprint.fromBuffer(buffer));

  final RxString name;
  final RxString baseUrl;
  final RxString loginUrl;
  final RxString loginCookieReg;
  final RxString loginCookieDescription;
  final RxString version;
  final RxString upgradeUrl;
  final RxString flag;
  final RxString readme;

  final RxList<RegFieldModel> cookies;
  final RxList<RegFieldModel> headers;
  final RxList<ParserBaseModel> parsers;
  final RxList<ActionCombineModel> actionList;
  final RxList<PageBlueprintModel> pageList;

  Iterable<ParserBaseModel> _selectParser(ParserType type) {
    switch (type) {
      case ParserType.PARSER_TYPE_LIST_VIEW:
        return parsers.whereType<ListViewParserModel>();
      case ParserType.PARSER_TYPE_GALLERY:
        return parsers.whereType<GalleryParserModel>();
      case ParserType.PARSER_TYPE_IMAGE:
        return parsers.whereType<ImageReaderParserModel>();
      case ParserType.PARSER_TYPE_AUTO_COMPLETE:
        return parsers.whereType<AutoCompleteParserModel>();
    }
    throw UnimplementedError('Unknown parser $type');
  }

  void removeParser(ParserBaseModel model) {
    parsers.remove(model);
  }

  void addParser(ParserBaseModel model) {
    parsers.add(model);
  }

  String getParserName(String uuid) => uuid.isEmpty
      ? ''
      : parsers.get((p0) => p0.uuid == uuid)?.name.value ?? 'No parser';

  String getPageName(String uuid) => uuid.isEmpty
      ? ''
      : pageList.get((p0) => p0.uuid == uuid)?.name.value ?? 'No page';

  PageBlueprintModel? getPage(String uuid) =>
      uuid.isEmpty ? null : pageList.get((p0) => p0.uuid == uuid);

  ListViewParserModel getListParser(String uuid) {
    final result = _selectParser(ParserType.PARSER_TYPE_LIST_VIEW)
        .get((e) => e.uuid == uuid);
    if (result == null) throw Exception('Parser $uuid not exist');
    return result as ListViewParserModel;
  }

  GalleryParserModel getGalleryParser(String uuid) {
    final result = _selectParser(ParserType.PARSER_TYPE_GALLERY)
        .get((e) => e.uuid == uuid);
    if (result == null) throw Exception('Parser $uuid not exist');
    return result as GalleryParserModel;
  }

  AutoCompleteParserModel getAutoCompleteParser(String uuid) {
    final result = _selectParser(ParserType.PARSER_TYPE_GALLERY)
        .get((e) => e.uuid == uuid);
    if (result == null) throw Exception('Parser $uuid not exist');
    return result as AutoCompleteParserModel;
  }

  ImageReaderParserModel getImageParser(String uuid) {
    final result =
        _selectParser(ParserType.PARSER_TYPE_IMAGE).get((e) => e.uuid == uuid);
    if (result == null) throw Exception('Parser $uuid not exist');
    return result as ImageReaderParserModel;
  }

  bool containsFlag(String flag) => this
      .flag
      .value
      .toLowerCase()
      .split('|')
      .map((e) => e.trim())
      .contains(flag.toLowerCase().trim());

  @override
  SiteBlueprint toPb() => SiteBlueprint(
        name: name.value,
        baseUrl: baseUrl.value,
        cookies: cookies.map((e) => e.toPb()),
        headers: headers.map((e) => e.toPb()),
        loginUrl: loginUrl.value,
        loginCookieReg: loginCookieReg.value,
        loginCookieDescription: loginCookieDescription.value,
        version: version.value,
        upgradeUrl: upgradeUrl.value,
        flag: flag.value,
        actions: actionList.map((e) => e.toPb()),
        pages: pageList.map((e) => e.toPb()),
        readme: readme.value,
        parsers: parsers.map(
            (e) => ParserStore(parser: e.toPb().writeToBuffer(), type: e.type)),
      );
}
