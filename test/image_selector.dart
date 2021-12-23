import 'dart:io';

import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/data/protocol/model/store.dart';
import 'package:catweb/network/parser_exec/parser_exec.dart';
import 'package:catweb/test/test_model.dart';
import 'package:catweb/utils/utils.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:html/dom.dart';
import 'package:xpath_selector/xpath_selector.dart';

void main() {
  test('Test image parser', () async {
    final root = XPath.html(File('test/html/thumbnail.htm').readAsStringSync());

    final domSelector = DomParserExec<Node>(env: SiteEnvModel({}));

    final site = SiteConfigModel(ehTestSite);

    final parser =
        site.listViewParser.get((e) => e.name.value == 'commonList')!;

    final itemList = domSelector.nodes(parser.itemSelector, root.root);

    final item = itemList[0];
    print(domSelector.singleString(parser.previewImg.imgUrl, item));
    print(domSelector.singleInt(parser.previewImg.imgWidth, item));
    print(domSelector.singleInt(parser.previewImg.imgHeight, item));
  });
}
