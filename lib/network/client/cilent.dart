import 'package:catweb/data/controller/setting_controller.dart';
import 'package:catweb/data/controller/site_controller.dart';
import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/data/protocol/model/page.dart';
import 'package:catweb/data/protocol/model/store.dart';
import 'package:catweb/gen/protobuf/model.pbserver.dart';
import 'package:catweb/network/interceptor/cookie_interceptor.dart';
import 'package:catweb/network/interceptor/encode_transform.dart';
import 'package:catweb/ui/model/detail_model.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_http_formatter/dio_http_formatter.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import 'image_loader.dart';

class NetClient {
  NetClient(this.configModel)
      : dio = _buildDio(configModel, true),
        imageConcurrency = ImageConcurrency(
          dio: _buildDio(configModel),
          concurrency: 5,
        );

  final Dio dio;

  final SiteConfigModel configModel;

  final ImageConcurrency imageConcurrency;

  Future<ListRpcModel> getList({
    required String url,
    required SitePageModel model,
    required SiteEnvModel localEnv,
  }) async {
    final rsp = await dio.get<String>(url);

    if (rsp.data == null) {
      throw Exception('data is null');
    }

    final param = ParserParam(
      parser: configModel.getListParser(model.parser.value),
      source: rsp.data!,
      globalEnv: Get.find<SiteController>().website.globalEnv,
    );

    // final result = listParserExec(param);
    final result = await compute(listParserExec, param);

    localEnv.mergeMap(result.localEnv);
    final site = Get.find<SiteController>().website;
    if (result.globalEnv.isNotEmpty) {
      site.globalEnv.mergeMap(result.globalEnv);
      site.updateGlobalEnv();
    }
    return result.result;
  }

  Future<GalleryDetailModel> getGallery({
    required String url,
    required SitePageModel model,
    required SiteEnvModel localEnv,
  }) async {
    final rsp = await dio.get<String>(url);

    if (rsp.data == null) {
      throw Exception('data is null');
    }

    final param = ParserParam(
      parser: configModel.getGalleryParser(model.parser.value),
      source: rsp.data!,
      globalEnv: Get.find<SiteController>().website.globalEnv,
    );

    final ParserResult<GalleryDetailModel> result =
        await compute(galleryParserExec, param);

    localEnv.mergeMap(result.localEnv);
    final site = Get.find<SiteController>().website;
    if (result.globalEnv.isNotEmpty) {
      site.globalEnv.mergeMap(result.globalEnv);
      site.updateGlobalEnv();
    }
    return result.result;
  }
}

Dio _buildDio(SiteConfigModel model, [bool log = false]) {
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
  if (log) {
    dio.interceptors.add(HttpFormatter(
      includeResponseBody: false,
    ));
  }

  // TODO 添加忽略证书错误开关
  (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
      (client) => client..badCertificateCallback = (cert, host, port) => true;

  return dio;
}
