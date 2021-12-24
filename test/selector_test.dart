import 'dart:io';

import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/data/protocol/model/store.dart';
import 'package:catweb/network/parser_exec/html_xpath_model.dart';
import 'package:catweb/network/parser_exec/parser_exec.dart';
import 'package:catweb/test/test_model/eh_rules.dart';
import 'package:catweb/utils/utils.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:universal_html/html.dart' hide File;

void main() {
  test('Children selector test', () async {
    final root = UniversalHtmlTree.parse(
        File('test/html/watched.htm').readAsStringSync());

    final site = SiteConfigModel(ehTestSite);

    final parser =
        site.listViewParser.get((e) => e.name.value == 'commonList')!;

    final domSelector = DomParserExec<Node>(env: SiteEnvModel({}));
    final itemList = domSelector.nodes(parser.itemSelector, root.root);

    print(itemList);
  });
}
