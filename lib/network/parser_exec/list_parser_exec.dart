import 'package:catweb/data/controller/site_controller.dart';
import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/data/protocol/model/page.dart';
import 'package:catweb/data/protocol/model/parser.dart';
import 'package:catweb/network/parser_exec/parser_exec.dart';
import 'package:catweb/ui/pages/view_page/viewer_list/viewer_list_model.dart';
import 'package:catweb/utils/utils.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Node;
import 'package:xml/xml.dart';
import 'package:xpath_selector/xpath_selector.dart';
import 'package:html/dom.dart';

class ListParserExec {
  ListParserExec({
    required this.model,
    required this.source,
    required this.env,
    required this.dio,
  });

  final SitePageModel model;
  final String source;
  final SiteEnvModel env;
  final Dio dio;

  Future<List<ViewerListModel>> exec() async {
    final global = Get.find<SiteController>();
    final ListViewParserModel? parser = global.site.value!.config.listViewParser
        .get((e) => e.name.value == model.parser.value);

    if (parser == null) throw Exception('Parser not found');

    return await _xmlHtml(parser);
  }

  Future<List<ViewerListModel>> _xmlHtml(ListViewParserModel parser) async {
    late XPathResult itemList;
    late DomParserExec domSelector;

    if (source.substring(10).contains('xml')) {
      final root = XPath.html(source);
      domSelector = DomParserExec<Node>(dio: dio, env: env);
      itemList = root.query(parser.itemSelector.value);
    } else {
      final root = XPath.xml(source);
      domSelector = DomParserExec<XmlNode>(dio: dio, env: env);
      itemList = root.query(parser.itemSelector.value);
    }

    return Future.wait(itemList.nodes.map((e) async {
      return ViewerListModel(
        title: await domSelector.singleString(parser.title, e),
        subtitle: await domSelector.singleString(parser.subtitle, e),
        page: await domSelector.singleInt(parser.imgCount, e),
        paper: await domSelector.singleString(parser.paper, e),
        star: await domSelector.singleDouble(parser.star, e),
        uploadTime: await domSelector.singleString(parser.uploadTime, e),
        tag: await domSelector.singleString(parser.tag, e),
        tagColor: await domSelector.singleColor(parser.tagColor, e),
      );
    }));
  }
}
