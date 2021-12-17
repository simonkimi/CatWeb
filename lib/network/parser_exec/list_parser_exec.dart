import 'package:catweb/data/controller/site_controller.dart';
import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/data/protocol/model/page.dart';
import 'package:catweb/data/protocol/model/parser.dart';
import 'package:catweb/network/parser_exec/parser_exec.dart';
import 'package:catweb/ui/pages/view_page/viewer_list/viewer_list_model.dart';
import 'package:catweb/utils/utils.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:xpath_selector/xpath_selector.dart';

class ListParserExec extends ParserExec {
  ListParserExec({
    required SitePageModel model,
    required String source,
    required SiteEnvModel env,
    required Dio dio,
  }) : super(
          model: model,
          source: source,
          env: env,
          dio: dio,
        );

  List<ViewerListModel> exec() {
    final global = Get.find<SiteController>();

    final ListViewParserModel? parser = global.site.value!.config.listViewParser
        .get((e) => e.name.value == model.parser.value);

    if (parser == null) throw Exception('Parser not found');
    final root = XPath.html(source);
    final result = root.query(parser.itemSelector.value);

    return result.nodes.map((e) {
      return ViewerListModel(
        title: singleString(parser.title, e),
        subtitle: singleString(parser.subtitle, e),
        page: singleInt(parser.imgCount, e),
        paper: singleString(parser.paper, e),
        star: singleDouble(parser.star, e),
        uploadTime: singleString(parser.uploadTime, e),
      );
    }).toList();
  }
}
