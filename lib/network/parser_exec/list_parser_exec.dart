import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/data/protocol/model/parser.dart';
import 'package:catweb/network/parser_exec/parser_exec.dart';
import 'package:catweb/ui/pages/view_page/viewer_list/viewer_list_model.dart';
import 'package:dio/dio.dart';
import 'package:xml/xml.dart';
import 'package:xpath_selector/xpath_selector.dart';
import 'package:html/dom.dart';

class ListParserExec {
  ListParserExec({
    required this.parser,
    required this.source,
    required this.env,
    required this.dio,
  });

  final ListViewParserModel parser;
  final String source;
  final SiteEnvModel env;
  final Dio dio;

  Future<List<ViewerListModel>> exec() async {
    // TODO Json parser
    return await _xmlHtml(parser);
  }

  Future<List<ViewerListModel>> _xmlHtml(ListViewParserModel parser) async {
    late List<XPathNode> itemList;
    late DomParserExec domSelector;

    if (source.substring(10).contains('xml')) {
      final root = XPath.html(source);
      domSelector = DomParserExec<Node>(dio: dio, env: env);
      itemList = domSelector.nodes(parser.itemSelector, root.root);
    } else {
      final root = XPath.xml(source);
      domSelector = DomParserExec<XmlNode>(dio: dio, env: env);
      itemList = domSelector.nodes(parser.itemSelector, root.root);
    }

    return Future.wait(itemList.map((e) async {
      return ViewerListModel(
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
    }));
  }
}
