import 'dart:io';

import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/data/protocol/model/parser.dart';
import 'package:catweb/gen/protobuf/parser.pbserver.dart';
import 'package:catweb/gen/protobuf/selector.pbserver.dart';
import 'package:catweb/network/parser_exec/parser_exec.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:html/dom.dart';
import 'package:xpath_selector/xpath_selector.dart';

void main() {
  test('Test image parser', () async {
    final root = XPath.html(File('test/html/thumbnail.htm').readAsStringSync());

    final domSelector = DomParserExec<Node>(dio: Dio(), env: SiteEnvModel({}));
    final itemList = domSelector.nodes(parser.itemSelector, root.root);

    final item = itemList[0];
    print(await domSelector.singleString(parser.previewImg.imgUrl, item));
    print(await domSelector.singleInt(parser.previewImg.imgWidth, item));
    print(await domSelector.singleInt(parser.previewImg.imgHeight, item));
  });
}

final parser = ListViewParserModel(ListViewParser(
  name: '主页',
  itemSelector: Selector(
    selector:
        "//table[starts-with(@class,'itg')]/tbody/tr[position()>1]|//div[@class='gl1t']",
  ),
  previewImg: ImageSelector(
    imgUrl: Selector(
      selector: '.gl2c img,.glthumb img,.gl1e img,.gl3t img',
      function: SelectorFunction.attr,
      param: 'data-src,src',
    ),
    imgWidth: Selector(
      selector: '.gl2c img,.glthumb img,.gl1e img,.gl3t img',
      function: SelectorFunction.attr,
      param: 'style',
      regex: r'width:(\d+)',
    ),
    imgHeight: Selector(
      selector: '.gl2c img,.glthumb img,.gl1e img,.gl3t img',
      function: SelectorFunction.attr,
      param: 'style',
      regex: r'height:(\d+)',
    ),
  ),
));
