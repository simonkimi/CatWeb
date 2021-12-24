import 'dart:io';

import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/data/protocol/model/store.dart';
import 'package:catweb/network/parser_exec/html_xpath_model.dart';
import 'package:catweb/network/parser_exec/parser_exec.dart';
import 'package:catweb/test/test_model/eh_rules.dart';
import 'package:catweb/ui/model/viewer_list_model.dart';
import 'package:catweb/utils/utils.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:universal_html/html.dart' hide File;

void main() {
  test('Children selector test', () async {
    final root = UniversalHtmlTree.parse(File('test/html/minimal.htm').readAsStringSync());

    final site = SiteConfigModel(ehTestSite);

    final parser =
        site.listViewParser.get((e) => e.name.value == 'commonList')!;

    final domSelector = DomParserExec<Node>(env: SiteEnvModel({}));
    final itemList = domSelector.nodes(parser.itemSelector, root.root);

    final e = itemList[4];

    final model = ViewerListModel(
      title: domSelector.singleString(parser.title, e),
      subtitle: domSelector.singleString(parser.subtitle, e),
      page: domSelector.singleInt(parser.imgCount, e),
      paper: domSelector.singleString(parser.paper, e),
      star: domSelector.singleDouble(parser.star, e),
      uploadTime: domSelector.singleString(parser.uploadTime, e),
      tag: domSelector.singleString(parser.tag, e),
      tagColor: domSelector.singleColor(parser.tagColor, e),
      badgeList: domSelector.nodes(parser.badgeSelector, e).map((e) {
        return BadgeList(
          text: domSelector.singleString(parser.badgeText, e),
          color: domSelector.singleColor(parser.badgeColor, e),
        );
      }).toList(),
    );

    print(model);
  });
}
