import 'package:catweb/data/protocol/model/parser.dart';
import 'package:catweb/network/parser_exec/parser_exec.dart';
import 'package:catweb/ui/model/image_model.dart';
import 'package:catweb/ui/model/viewer_list_model.dart';
import 'package:xml/xml.dart';
import 'package:universal_html/html.dart';
import 'package:xpath_selector/xpath_selector.dart';

import 'extra_parser.dart';
import 'html_xpath_model.dart';

ParserResult<List<ViewerListModel>> listParserExec(
    ParserParam<ListViewParserModel> param) {
  ParserResult<List<ViewerListModel>> _xmlHtml() {
    final parser = param.parser;
    late List<XPathNode> itemList;
    late DomParserExec dom;
    late XPath root;
    if (param.source.substring(0, 20).contains('xml')) {
      root = XPath.xml(param.source);
      dom = DomParserExec<XmlNode>(env: param.globalEnv);
      itemList = dom.nodes(parser.itemSelector, root.root);
    } else {
      root = UniversalHtmlTree.parse(param.source);
      dom = DomParserExec<Node>(env: param.globalEnv);
      itemList = dom.nodes(parser.itemSelector, root.root);
    }

    final global = <String, String>{};
    final local = <String, String>{};

    xmlHtmlExtra(
      domSelector: dom,
      extras: parser.extraSelectorModel,
      root: root,
      onGlobalEnv: (key, value) => global[key] = value,
      onLocalEnv: (key, value) => local[key] = value,
    );

    final result = itemList.map((e) {
      return ViewerListModel(
        idCode: dom.string(parser.idCode, e),
        title: dom.string(parser.title, e),
        subtitle: dom.string(parser.subtitle, e),
        page: dom.int(parser.imgCount, e),
        paper: dom.string(parser.paper, e),
        star: dom.double(parser.star, e),
        uploadTime: dom.string(parser.uploadTime, e),
        tag: dom.string(parser.tag, e),
        tagColor: dom.color(parser.tagColor, e),
        badgeList: dom.nodes(parser.badgeSelector, e).map((e) {
          return BadgeList(
            text: dom.string(parser.badgeText, e),
            color: dom.color(parser.badgeColor, e),
          );
        }).toList(),
        previewImage: ImageModel(
          url: dom.string(parser.previewImg.imgUrl, e),
          width: dom.double(parser.previewImg.imgHeight, e),
          height: dom.double(parser.previewImg.imgHeight, e),
          imgX: dom.int(parser.previewImg.imgX, e),
          imgY: dom.int(parser.previewImg.imgY, e),
        ),
      );
    }).toList();

    return ParserResult<List<ViewerListModel>>(
      result: result,
      globalEnv: global,
      localEnv: local,
    );
  }

  return _xmlHtml();
}
