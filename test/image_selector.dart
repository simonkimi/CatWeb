import 'dart:io';
import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/data/protocol/model/store.dart';
import 'package:catweb/network/parser_exec/html_xpath_model.dart';
import 'package:catweb/network/parser_exec/parser_exec.dart';
import 'package:catweb/test/test_model.dart';
import 'package:catweb/utils/utils.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:universal_html/html.dart' show Node;

void main() {
  test('Test image parser', () async {
    final root = UniversalHtmlTree.parse(
        File('test/html/compact.htm').readAsStringSync());

    final domSelector = DomParserExec<Node>(env: SiteEnvModel({}));

    final site = SiteConfigModel(ehTestSite);

    final parser =
        site.listViewParser.get((e) => e.name.value == 'commonList')!;

    final itemList = domSelector.nodes(parser.itemSelector, root.root);

    final item = itemList[7];
    final bg = domSelector.nodes(parser.badgeSelector, item).first;

    final cl = domSelector.singleColor(parser.badgeColor, bg);
    print(cl);
  });
}
