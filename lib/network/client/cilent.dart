import 'package:catweb/data/constant.dart';
import 'package:catweb/data/controller/setting_controller.dart';
import 'package:catweb/data/controller/site_controller.dart';
import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/data/protocol/model/page.dart';
import 'package:catweb/data/protocol/model/store.dart';
import 'package:catweb/gen/protobuf/model.pbserver.dart';
import 'package:catweb/gen/protobuf/rpc.pbserver.dart';
import 'package:catweb/network/interceptor/cookie_interceptor.dart';
import 'package:catweb/network/interceptor/encode_transform.dart';
import 'package:catweb/network/parser/parser.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_http_formatter/dio_http_formatter.dart';
import 'package:get/get.dart';

class NetClient {
  NetClient(this.configModel)
      : dio = _buildDio(configModel, true),
        imageDio = _buildDio(configModel);

  final Dio dio;
  final Dio imageDio;

  final SiteConfigModel configModel;

  Future<ListRpcModel> getList({
    required String url,
    required SitePageModel model,
    required SiteEnvModel localEnv,
  }) async {
    final rsp = await dio.get<String>(url);
    if (rsp.data == null) {
      throw Exception('data is null');
    }

    final buffer = await ParserFFi(
      parser: configModel.getListParser(model.parser.value).toPb(),
      source: rsp.data!,
      env: Get.find<GlobalController>().website.globalEnv,
      type: RpcType.RPC_TYPE_LIST_VIEW_PARSER,
    ).send();

    final result = ListRpcModel.fromBuffer(buffer);

    localEnv.mergeMap(result.localEnv);
    Get.find<GlobalController>().website.updateGlobalEnv(result.globalEnv);

    return result;
  }

  Future<GalleryRpcModel> getGallery({
    required String url,
    required SitePageModel model,
    required SiteEnvModel localEnv,
  }) async {
    final rsp = await dio.get<String>(url);
    if (rsp.data == null) {
      throw Exception('data is null');
    }

    final buffer = await ParserFFi(
      parser: configModel.getGalleryParser(model.parser.value).toPb(),
      source: rsp.data!,
      env: Get.find<GlobalController>().website.globalEnv,
      type: RpcType.RPC_TYPE_GALLERY_PARSER,
    ).send();
    final result = GalleryRpcModel.fromBuffer(buffer);
    localEnv.mergeMap(result.localEnv);
    Get.find<GlobalController>().website.updateGlobalEnv(result.globalEnv);
    return result;
  }
}

Dio _buildDio(SiteConfigModel model, [bool log = false]) {
  final dio = Dio();

  dio.options.connectTimeout = 60 * 1000;
  dio.options.receiveTimeout = 60 * 1000;
  dio.options.sendTimeout = 60 * 1000;

  if (model.baseUrl.value.isNotEmpty) {
    dio.options.baseUrl = model.baseUrl.value;
  }

  dio.interceptors.add(HeaderCookieInterceptor(model));
  dio.interceptors.add(DioCacheInterceptor(
      options: Get.find<SettingController>().dioCacheOptions));
  dio.transformer = EncodeTransformer();
  if (log) {
    dio.interceptors.add(HttpFormatter(
      includeResponseBody: false,
    ));
  }

  if (model.containsFlag(Flag.ignoreCertificate)) {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) => client..badCertificateCallback = (cert, host, port) => true;
  }

  return dio;
}
