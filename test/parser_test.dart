import 'package:catweb/data/execute/js_runtime.dart';
import 'package:catweb/data/execute/selector_exec.dart';
import 'package:catweb/data/protocol/model/selector.dart';
import 'package:catweb/gen/protobuf/selector.pbserver.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:html/dom.dart';
import 'package:xpath_selector/xpath_selector.dart';

import 'list_sample.dart';

void main() {
  test('parser', () async {
    final jsRuntime = JsRuntime(dio: Dio());
    final root = XPath.html(sampleHtml);

    final star = SelectorModel(Selector(
      selector: 'div .ir',
      function: SelectorFunction.attr,
      param: 'style',
      regex: r'background-position:-?(\d+)px -?(\d+)px',
      replace: r'5-$1/16-($2-1)/40',
      computed: true,
    ));

    final exec = DomSelectorExec<Node>(jsRuntime: jsRuntime, selector: star);

    final result = await exec.find(root.root);

    print(result);
  });
}
