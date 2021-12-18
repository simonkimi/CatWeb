import 'package:catweb/data/controller/site_controller.dart';
import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/data/protocol/model/page.dart';
import 'package:catweb/data/protocol/model/store.dart';
import 'package:catweb/network/interceptor/cookie_interceptor.dart';
import 'package:catweb/network/interceptor/encode_transform.dart';
import 'package:catweb/network/parser_exec/list_parser_exec.dart';
import 'package:catweb/ui/pages/view_page/viewer_list/viewer_list_model.dart';
import 'package:catweb/utils/utils.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class NetClient {
  NetClient(SiteProtobufModel model) : dio = buildDio(model);

  final Dio dio;

  Future<List<ViewerListModel>> getList({
    required SitePageModel model,
    required SubPageModel subPageModel,
    required SiteEnvModel localEnv,
  }) async {
    final site = Get.find<SiteController>();
    final env = site.globalEnv.create(localEnv);
    final url = env.resolve(model.url.value)!;
    final rsp = await dio.get<String>(url);

    final data = rsp.data;

    if (rsp.data == null) {
      // TODO 处理为空的错误
      throw Exception('data is null');
    }

    final global = Get.find<SiteController>();
    final parser = global.site.value!.config.listViewParser
        .get((e) => e.name.value == model.parser.value);

    if (parser == null) throw Exception('parser is null');

    return ListParserExec(
      parser: parser,
      source: data!,
      env: env,
      dio: dio,
    ).exec();
  }
}

Dio buildDio(SiteProtobufModel model) {
  final dio = Dio();

  dio.options.connectTimeout = 10 * 1000;
  dio.options.receiveTimeout = 60 * 1000;
  dio.options.sendTimeout = 10 * 1000;

  if (model.baseUrl.value.isNotEmpty) {
    dio.options.baseUrl = model.baseUrl.value;
  }

  dio.interceptors.add(HeaderCookieInterceptor(model));
  dio.transformer = EncodeTransformer();

  // TODO 添加忽略证书错误开关
  (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
      (client) => client..badCertificateCallback = (cert, host, port) => true;

  return dio;
}
