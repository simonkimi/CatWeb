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

class SiteProtobufModel implements PbAble {
  SiteProtobufModel([SiteProtobuf? pb])
      : name = sobs(pb?.name),
        baseUrl = sobs(pb?.baseUrl),
        cookies = lobs(pb?.cookies, (RegField e) => RegFieldModel(e)),
        headers = lobs(pb?.headers, (RegField e) => RegFieldModel(e)),
        loginUrl = sobs(pb?.loginUrl),
        loginCookie = RegFieldModel(pb?.loginCookie),
        version = sobs(pb?.version),
        galleryParsers = lobs(
            pb?.galleryParsers, (GalleryParser e) => GalleryParserModel(e)),
        listViewParser = lobs(
          pb?.listViewParser,
          (ListViewParser e) => ListViewParserModel(e),
        ),
        imageParser = lobs(
          pb?.imageParsers,
          (ImageParser e) => ImageParserModel(e),
        ),
        actionList = lobs(
          pb?.actionList,
          (ActionCombine e) => ActionCombineModel(e),
        ),
        pageList = lobs(pb?.pageList, (SitePage e) => SitePageModel(e));

  final RxString name;
  final RxString baseUrl;
  final RxString loginUrl;
  final RegFieldModel loginCookie;
  final RxString version;

  final RxList<RegFieldModel> cookies;
  final RxList<RegFieldModel> headers;
  final RxList<GalleryParserModel> galleryParsers;
  final RxList<ListViewParserModel> listViewParser;
  final RxList<ImageParserModel> imageParser;
  final RxList<ActionCombineModel> actionList;
  final RxList<SitePageModel> pageList;

  RxList<ParserBaseModel> _selectParser(ParserBaseModel model) {
    switch (model.type) {
      case ParserType.listParser:
        return listViewParser;
      case ParserType.galleryParser:
        return galleryParsers;
      case ParserType.imageParser:
        return imageParser;
    }
  }

  void removeParser(ParserBaseModel model) {
    _selectParser(model).remove(model);
  }

  void addParser(ParserBaseModel model) {
    _selectParser(model).add(model);
  }

  RxList<ParserBaseModel> get parsers => RxList.from([
        ...listViewParser,
        ...galleryParsers,
        ...imageParser,
      ]);

  @override
  SiteProtobuf toPb() => SiteProtobuf(
        name: name.value,
        baseUrl: baseUrl.value,
        cookies: cookies.map((e) => e.toPb()),
        headers: headers.map((e) => e.toPb()),
        loginUrl: loginUrl.value,
        loginCookie: loginCookie.toPb(),
        version: version.value,
        galleryParsers: galleryParsers.map((e) => e.toPb()),
        listViewParser: listViewParser.map((e) => e.toPb()),
        actionList: actionList.map((e) => e.toPb()),
        pageList: pageList.map((e) => e.toPb()),
      );
}
