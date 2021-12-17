import 'package:catweb/data/execute/js_runtime.dart';
import 'package:catweb/data/execute/selector_exec.dart';
import 'package:catweb/data/protocol/model/selector.dart';
import 'package:catweb/gen/protobuf/selector.pbserver.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:html/dom.dart';
import 'package:xpath_selector/xpath_selector.dart';

import 'eh_sample.dart';

void main() {
  test('parser', () async {
    final jsRuntime = JsRuntime(dio: Dio());
    final root = XPath.html(sampleHtml);

    final title = SelectorModel(Selector(
      selector: '#gn',
      function: SelectorFunction.text,
    ));

    final subtitle = SelectorModel(Selector(
      selector: "//div[@id='gdn']/a/text()",
    ));

    final exec = DomSelectorExec<Node>(jsRuntime: jsRuntime, selector: subtitle);

    final result = await exec.find(root.root);

    print(result);
  });
}
