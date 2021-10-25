import 'package:cat_web/data/protocol/model/parser.dart';
import 'package:cat_web/gen/protobuf/actions.pbserver.dart';
import 'package:cat_web/gen/protobuf/parser.pbserver.dart';
import 'package:cat_web/gen/protobuf/store.pbserver.dart';
import 'package:cat_web/utils/utils.dart';
import 'package:get/get.dart';

import 'actions.dart';

class RulesProtocolModel {
  RulesProtocolModel([RulesProtocol? pb])
      : name = sobs(pb?.name),
        baseUrl = sobs(pb?.baseUrl),
        cookies = sobs(pb?.cookies),
        extraCookies = sobs(pb?.extraCookies),
        headers = sobs(pb?.headers),
        loginUrl = sobs(pb?.loginUrl),
        galleryParsers = lobs(
            pb?.galleryParsers, (GalleryParser e) => GalleryParserModel(e)),
        listViewParser = lobs(
          pb?.listViewParser,
          (ListViewParser e) => ListViewParserModel(e),
        ),
        actionList = lobs(pb?.actionList, (Action e) => ActionModel(e));

  final RxString name;
  final RxString baseUrl;
  final RxString cookies;
  final RxString extraCookies;
  final RxString headers;
  final RxString loginUrl;

  final RxList<GalleryParserModel> galleryParsers;
  final RxList<ListViewParserModel> listViewParser;
  final RxList<ActionModel> actionList;
}
