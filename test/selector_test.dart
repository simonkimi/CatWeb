import 'dart:io';

import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/data/protocol/model/store.dart';
import 'package:catweb/network/parser_exec/parser_exec.dart';
import 'package:catweb/test/test_model/eh_rules.dart';
import 'package:catweb/ui/pages/view_page/viewer_list/viewer_list_model.dart';
import 'package:catweb/utils/utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:html/dom.dart';
import 'package:xpath_selector/xpath_selector.dart';

void main() {
  test('Children selector test', () async {
    final root = XPath.html(File('test/html/minimal.htm').readAsStringSync());

    final site = SiteConfigModel(ehTestSite);

    final parser =
        site.listViewParser.get((e) => e.name.value == 'commonList')!;

    final domSelector = DomParserExec<Node>(dio: Dio(), env: SiteEnvModel({}));
    final itemList = domSelector.nodes(parser.itemSelector, root.root);

    final e = itemList[4];

    final model = ViewerListModel(
      title: await domSelector.singleString(parser.title, e),
      subtitle: await domSelector.singleString(parser.subtitle, e),
      page: await domSelector.singleInt(parser.imgCount, e),
      paper: await domSelector.singleString(parser.paper, e),
      star: await domSelector.singleDouble(parser.star, e),
      uploadTime: await domSelector.singleString(parser.uploadTime, e),
      tag: await domSelector.singleString(parser.tag, e),
      tagColor: await domSelector.singleColor(parser.tagColor, e),
      badgeList: await Future.wait(
          domSelector.nodes(parser.badgeSelector, e).map((e) async {
        return BadgeList(
          text: await domSelector.singleString(parser.badgeText, e),
          color: await domSelector.singleColor(parser.badgeColor, e),
        );
      })),
    );

    print(model);
  });
}
