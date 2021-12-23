import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/data/protocol/model/parser.dart';
import 'package:catweb/network/parser_exec/parser_exec.dart';
import 'package:catweb/ui/model/image_model.dart';
import 'package:catweb/ui/model/viewer_list_model.dart';
import 'package:html/dom.dart';
import 'package:xml/xml.dart';
import 'package:xpath_selector/xpath_selector.dart';

import 'extra_parser.dart';

class ListParserResult {
  ListParserResult({
    required this.result,
    required this.globalEnv,
    required this.localEnv,
  });

  final List<ViewerListModel> result;
  final Map<String, String> globalEnv;
  final Map<String, String> localEnv;
}

class ListParserParam {
  ListParserParam({
    required this.parser,
    required this.source,
    required this.globalEnv,
  });

  final ListViewParserModel parser;
  final String source;
  final SiteEnvModel globalEnv;
}

ListParserResult listParserExec(ListParserParam param) {
  ListParserResult _xmlHtml() {
    final parser = param.parser;
    late List<XPathNode> itemList;
    late DomParserExec domSelector;

    late XPath root;
    if (param.source.substring(10).contains('xml')) {
      root = XPath.html(param.source);
      domSelector = DomParserExec<Node>(env: param.globalEnv);
      itemList = domSelector.nodes(parser.itemSelector, root.root);
    } else {
      root = XPath.xml(param.source);
      domSelector = DomParserExec<XmlNode>(env: param.globalEnv);
      itemList = domSelector.nodes(parser.itemSelector, root.root);
    }

    final global = <String, String>{};
    final local = <String, String>{};

    xmlHtmlExtra(
      domSelector: domSelector,
      extras: parser.extraSelectorModel,
      root: root,
      onGlobalEnv: (key, value) => global[key] = value,
      onLocalEnv: (key, value) => local[key] = value,
    );

    final result = itemList.map((e) {
      return ViewerListModel(
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
        previewImage: ImageModel(
          url: domSelector.singleString(parser.previewImg.imgUrl, e),
          width: domSelector.singleDouble(parser.previewImg.imgHeight, e),
          height: domSelector.singleDouble(parser.previewImg.imgHeight, e),
          imgX: domSelector.singleInt(parser.previewImg.imgX, e),
          imgY: domSelector.singleInt(parser.previewImg.imgY, e),
        ),
      );
    }).toList();

    return ListParserResult(
      result: result,
      globalEnv: global,
      localEnv: local,
    );
  }

  return _xmlHtml();
}
