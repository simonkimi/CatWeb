import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/data/protocol/model/parser.dart';
import 'package:catweb/gen/protobuf/parser.pbserver.dart';
import 'package:catweb/gen/protobuf/selector.pbserver.dart';
import 'package:catweb/network/parser_exec/parser_exec.dart';
import 'package:catweb/ui/pages/view_page/viewer_list/viewer_list_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:html/dom.dart';
import 'package:xpath_selector/xpath_selector.dart';

import 'sample/list_sample.dart';

void main() {
  test('Children selector test', () async {
    final root = XPath.html(listHtml);

    final domSelector = DomParserExec<Node>(dio: Dio(), env: SiteEnvModel({}));
    final itemList = domSelector.nodes(parser.itemSelector, root.root);

    final e = itemList.first;

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

final parser = ListViewParserModel(ListViewParser(
  name: '主页',
  itemSelector: Selector(
      selector: "//table[starts-with(@class,'itg')]/tbody/tr[position()>1]"),
  title: Selector(
    selector: '.glink',
    function: SelectorFunction.text,
  ),
  subtitle: Selector(
    selector: '.gl5m a, .gl4c a, .gl3e a',
    function: SelectorFunction.text,
  ),
  imgCount: Selector(
    selector:
        "//div[@class='glthumb']/*[2]/*[2]|//div[@class='gl3e']/*[5]|//div[@class='gl5t']/*[2]/*[2]",
    function: SelectorFunction.text,
    regex: r'\d+',
  ),
  badgeSelector: Selector(
    selector: '.gt',
  ),
  badgeText: Selector(
    function: SelectorFunction.text,
  ),
  badgeColor: Selector(
    function: SelectorFunction.attr,
    param: 'style',
    regex: r'#[0-9a-fA-F]{6}',
  ),
  tag: Selector(
    selector: '.cn',
    function: SelectorFunction.text,
  ),
  tagColor: Selector(
    selector: '.cn',
    function: SelectorFunction.attr,
    param: 'class',
    regex: 'ct.',
    js: r"function hook(t){return{ct2:'#f66158',ct3:'#f09e19',ct4:'#d2d303',ct5:'#0fa911',cta:'#2fd92c',ct9:'#0bbfd3',ct6:'#4f5ce6',ct7:'#9030df',ct8:'#f38af2',ct1:'#8a8a8a'}[t]}",
  ),
  star: Selector(
    selector: '.ir',
    function: SelectorFunction.attr,
    param: 'style',
    regex: r'background-position:-?(\d+)px -?(\d+)px',
    replace: r'5-$1/16-($2-1)/40',
    computed: true,
  ),
  uploadTime: Selector(
    selector: '.glnew,.glfc',
    function: SelectorFunction.text,
  ),
));
