import 'package:catweb/data/controller/setting_controller.dart';
import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/data/protocol/model/page.dart';
import 'package:catweb/data/protocol/model/store.dart';
import 'package:catweb/network/interceptor/cookie_interceptor.dart';
import 'package:catweb/network/interceptor/encode_transform.dart';
import 'package:catweb/network/parser_exec/list_parser_exec.dart';
import 'package:catweb/ui/model/viewer_list_model.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:get/get.dart';

class NetClient {
  NetClient(this.configModel) : dio = buildDio(configModel);

  final Dio dio;
  final SiteConfigModel configModel;

  Future<List<ViewerListModel>> getList({
    required String url,
    required SitePageModel model,
    required SiteEnvModel localEnv,
  }) async {
    final rsp = await dio.get<String>(url);

    if (rsp.data == null) {
      // TODO 处理为空的错误
      throw Exception('data is null');
    }

    return ListParserExec(
      parser: configModel.getListParser(model.parser.value),
      source: rsp.data!,
      env: localEnv,
      dio: dio,
    ).exec();
  }
}

Dio buildDio(SiteConfigModel model) {
  final dio = Dio();

  dio.options.connectTimeout = 10 * 1000;
  dio.options.receiveTimeout = 60 * 1000;
  dio.options.sendTimeout = 10 * 1000;

  if (model.baseUrl.value.isNotEmpty) {
    dio.options.baseUrl = model.baseUrl.value;
  }

  dio.interceptors.add(HeaderCookieInterceptor(model));
  dio.interceptors.add(DioCacheInterceptor(
      options: Get.find<SettingController>().dioCacheOptions));
  dio.transformer = EncodeTransformer();

  // TODO 添加忽略证书错误开关
  (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
      (client) => client..badCertificateCallback = (cert, host, port) => true;

  return dio;
}
