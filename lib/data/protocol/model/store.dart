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
        galleryParsers = lobs(
            pb?.galleryParsers, (GalleryParser e) => GalleryParserModel(e)),
        listViewParsers = lobs(
          pb?.listViewParsers,
          (ListViewParser e) => ListViewParserModel(e),
        ),
        imageParsers = lobs(
          pb?.imageParsers,
          (ImageReaderParser e) => ImageReaderParserModel(e),
        ),
        autoCompleteParsers = lobs(
          pb?.autoCompleteParsers,
          (AutoCompleteParser e) => AutoCompleteParserModel(e),
        ),
        actionList = lobs(
          pb?.actions,
          (ActionCombine e) => ActionCombineModel(e),
        ),
        pageList = lobs(pb?.pages, (SitePage e) => PageBlueprintModel(e)),
        readme = sobs(pb?.readme);

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
  final RxList<GalleryParserModel> galleryParsers;
  final RxList<ListViewParserModel> listViewParsers;
  final RxList<ImageReaderParserModel> imageParsers;
  final RxList<AutoCompleteParserModel> autoCompleteParsers;
  final RxList<ActionCombineModel> actionList;
  final RxList<PageBlueprintModel> pageList;

  RxList<ParserBaseModel> _selectParser(ParserBaseModel model) {
    switch (model.type) {
      case ParserType.PARSER_TYPE_LIST_VIEW:
        return listViewParsers;
      case ParserType.PARSER_TYPE_GALLERY:
        return galleryParsers;
      case ParserType.PARSER_TYPE_IMAGE:
        return imageParsers;
      case ParserType.PARSER_TYPE_AUTO_COMPLETE:
        return autoCompleteParsers;
    }
    throw UnimplementedError('Unknown parser $model');
  }

  void removeParser(ParserBaseModel model) {
    _selectParser(model).remove(model);
  }

  void addParser(ParserBaseModel model) {
    _selectParser(model).add(model);
  }

  RxList<ParserBaseModel> get parsers => RxList.from([
        ...listViewParsers,
        ...galleryParsers,
        ...imageParsers,
        ...autoCompleteParsers,
      ]);

  String getParserName(String uuid) => uuid.isEmpty
      ? ''
      : parsers.get((p0) => p0.uuid == uuid)?.name.value ?? 'No parser';

  String getPageName(String uuid) => uuid.isEmpty
      ? ''
      : pageList.get((p0) => p0.uuid == uuid)?.name.value ?? 'No page';

  PageBlueprintModel? getPage(String uuid) =>
      uuid.isEmpty ? null : pageList.get((p0) => p0.uuid == uuid);

  ListViewParserModel getListParser(String uuid) {
    final result = listViewParsers.get((e) => e.uuid == uuid);
    if (result == null) throw Exception('Parser $uuid not exist');
    return result;
  }

  GalleryParserModel getGalleryParser(String uuid) {
    final result = galleryParsers.get((e) => e.uuid == uuid);
    if (result == null) throw Exception('Parser $uuid not exist');
    return result;
  }

  AutoCompleteParserModel getAutoCompleteParser(String uuid) {
    final result = autoCompleteParsers.get((e) => e.uuid == uuid);
    if (result == null) throw Exception('Parser $uuid not exist');
    return result;
  }

  ImageReaderParserModel getImageParser(String uuid) {
    final result = imageParsers.get((e) => e.uuid == uuid);
    if (result == null) throw Exception('Parser $uuid not exist');
    return result;
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
        galleryParsers: galleryParsers.map((e) => e.toPb()),
        listViewParsers: listViewParsers.map((e) => e.toPb()),
        actions: actionList.map((e) => e.toPb()),
        pages: pageList.map((e) => e.toPb()),
        autoCompleteParsers: autoCompleteParsers.map((e) => e.toPb()),
        imageParsers: imageParsers.map((e) => e.toPb()),
        readme: readme.value,
      );
}
