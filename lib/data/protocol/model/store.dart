import 'package:cat_web/data/protocol/model/parser.dart';
import 'package:cat_web/gen/protobuf/store.pbserver.dart';
import 'package:cat_web/utils/utils.dart';
import 'package:get/get.dart';

class RulesProtocolModel {
  RulesProtocolModel([RulesProtocol? pb])
      : name = sobs(pb?.name),
        baseUrl = sobs(pb?.baseUrl),
        cookies = sobs(pb?.cookies),
        extraCookies = sobs(pb?.extraCookies),
        headers = sobs(pb?.headers),
        loginUrl = sobs(pb?.loginUrl),
        galleryParsers =
            pb?.galleryParsers.map((e) => GalleryParserModel(e)).toList().obs ??
                <GalleryParserModel>[].obs,
        listViewParser = pb?.listViewParser
                .map((e) => ListViewParserModel(e))
                .toList()
                .obs ??
            <ListViewParserModel>[].obs;

  final RxString name;
  final RxString baseUrl;
  final RxString cookies;
  final RxString extraCookies;
  final RxString headers;
  final RxString loginUrl;

  final RxList<GalleryParserModel> galleryParsers;
  final RxList<ListViewParserModel> listViewParser;
}
