import 'package:catweb/data/execute/js_runtime.dart';
import 'package:catweb/data/execute/selector_exec.dart';
import 'package:catweb/data/protocol/model/selector.dart';
import 'package:catweb/gen/protobuf/selector.pbserver.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:html/dom.dart';
import 'package:xpath_selector/xpath_selector.dart';

import 'sample/eh_sample.dart';



void main() {
  test('Js runtime test', () async {

    final jsRuntime = JsRuntime(dio: Dio());
    final root = XPath.html(sampleHtml);
    final star = SelectorModel(Selector(
      selector: '.cs',
      function: SelectorFunction.attr,
      param: 'class',
      regex: r'ct\d',
      js: r"function hook(t){return{ct2:'#f66158',ct3:'#f09e19',ct4:'#d2d303',ct5:'#0fa911',cta:'#2fd92c',ct9:'#0bbfd3',ct6:'#4f5ce6',ct7:'#9030df',ct8:'#f38af2',ct1:'#8a8a8a'}[t]}",
    ));

    final exec = DomSelectorExec<Node>(jsRuntime: jsRuntime, selector: star);

    final result = await exec.find(root.root);

    print(result);
  });
}
