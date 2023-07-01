import 'dart:io';

import 'package:catweb/data/constant.dart';
import 'package:catweb/data/controller/setting_service.dart';
import 'package:catweb/data/database/database.dart';
import 'package:catweb/data/models/ffi/parser_result.dart';
import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/data/models/site_model/pages/site_page.dart';
import 'package:catweb/data/models/site_model/site_blue_map.dart';
import 'package:catweb/network/interceptor/cookie_interceptor.dart';
import 'package:catweb/network/interceptor/encode_transform.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:dio_http_formatter/dio_http_formatter.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:get/get.dart' hide Response;
import 'package:catweb/i18n.dart';

class FlagException implements Exception {
  final String message;

  FlagException(this.message);
}

class NetClient {
  NetClient({
    required this.blueMap,
    required CookieJar cookieJar,
    required WebTableData db,
  })  : dio = _buildDio(
          model: blueMap,
          cookieJar: cookieJar,
          db: db,
        ),
        imageDio = _buildDio(
          model: blueMap,
          cookieJar: cookieJar,
          isImage: true,
          db: db,
        );

  final Dio dio;
  final Dio imageDio;
  final SiteBlueMap blueMap;

  Future<Response<String>> _buildRequest({
    required String url,
    required SitePage model,
    required SiteEnvStore localEnv,
    Options? options,
  }) async {
    final form = localEnv.apply(model.formData);
    final url2 = localEnv.apply(url);

    switch (model.action) {
      case SiteNetType.delete:
        return dio.delete(url2, options: options);
      case SiteNetType.get:
        return await dio.get<String>(url2, options: options);
      case SiteNetType.post:
        return await dio.post<String>(url2, data: form, options: options);
      case SiteNetType.put:
        return await dio.put<String>(url2, data: form, options: options);
    }
  }

  void _checkSuccessFlag({
    required bool enableSuccess,
    required bool enableFail,
    required bool isSuccess,
    required String failedMessage,
  }) {
    if (enableFail && failedMessage.isNotEmpty) {
      throw FlagException(failedMessage);
    }

    if (enableSuccess && !isSuccess) {
      throw FlagException(I.g.network_not_success_flag);
    }
  }

  Future<ListParserResult> getList({
    required String url,
    required SitePage model,
    required SiteEnvStore localEnv,
  }) async {
    final rsp = await _buildRequest(
      url: url,
      model: model,
      localEnv: localEnv,
    );
    if (rsp.data == null) {
      throw Exception('data is null');
    }

    // final buffer = await ParserFFi(
    //   parser: blueMap.getListParser(model.baseParser.value).toPb(),
    //   source: rsp.data!,
    //   env: Get.find<SiteService>().website.globalEnv,
    //   type: RpcType.RPC_TYPE_LIST_VIEW_PARSER,
    // ).send();
    //
    // final result = ListRpcModel.fromBuffer(buffer);
    //
    // _checkSuccessFlag(
    //   enableSuccess: result.enableSuccess,
    //   enableFail: result.enableFail,
    //   isSuccess: result.isSuccess,
    //   failedMessage: result.failedMessage,
    // );
    //
    // localEnv.mergeMap(result.localEnv);
    // Get.find<SiteService>().website.updateGlobalEnv(result.globalEnv);


    throw UnimplementedError();
  }

  Future<GalleryParserResult> getGallery({
    required String url,
    required SitePage model,
    required SiteEnvStore localEnv,
  }) async {
    final options = Get.find<SettingService>()
        .cacheOptions
        .copyWith(policy: CachePolicy.forceCache)
        .toOptions();

    final rsp = await _buildRequest(
      url: url,
      model: model,
      localEnv: localEnv,
      options: options,
    );

    if (rsp.data == null) {
      throw Exception('data is null');
    }

    // final buffer = await ParserFFi(
    //   parser: blueMap.getGalleryParser(model.baseParser.value).toPb(),
    //   source: rsp.data!,
    //   env: Get.find<SiteService>().website.globalEnv,
    //   type: RpcType.RPC_TYPE_GALLERY_PARSER,
    // ).send();
    //
    // final result = GalleryRpcModel.fromBuffer(buffer);
    //
    // _checkSuccessFlag(
    //   enableSuccess: result.enableSuccess,
    //   enableFail: result.enableFail,
    //   isSuccess: result.isSuccess,
    //   failedMessage: result.failedMessage,
    // );
    //
    // localEnv.mergeMap(result.localEnv);
    // Get.find<SiteService>().website.updateGlobalEnv(result.globalEnv);
    throw UnimplementedError();
  }

  Future<ImageReaderParserResult> getReadImage({
    required String url,
    required SitePage model,
    required SiteEnvStore localEnv,
  }) async {
    // final options = Get.find<SettingService>()
    //     .imageCacheOption
    //     .copyWith(policy: CachePolicy.forceCache)
    //     .toOptions();
    //
    // final rsp = await _buildRequest(
    //   url: url,
    //   model: model,
    //   localEnv: localEnv,
    //   options: options,
    // );
    // if (rsp.data == null) {
    //   throw Exception('data is null');
    // }
    //
    // final buffer = await ParserFFi(
    //   parser: blueMap.getImageParser(model.baseParser.value).toPb(),
    //   source: rsp.data!,
    //   env: Get.find<SiteService>().website.globalEnv,
    //   type: RpcType.RPC_TYPE_IMAGE_PARSER,
    // ).send();
    //
    // final result = ImageReaderRpcModel.fromBuffer(buffer);
    //
    // _checkSuccessFlag(
    //   enableSuccess: result.enableSuccess,
    //   enableFail: result.enableFail,
    //   isSuccess: result.isSuccess,
    //   failedMessage: result.failedMessage,
    // );
    //
    // localEnv.mergeMap(result.localEnv);
    // Get.find<SiteService>().website.updateGlobalEnv(result.globalEnv);
    throw UnimplementedError();
  }

  Future<AutoCompleteParserResult> getAutoComplete({
    required String url,
    required SitePage model,
    required SiteEnvStore localEnv,
  }) async {
    // final rsp = await _buildRequest(url: url, model: model, localEnv: localEnv);
    // if (rsp.data == null) {
    //   throw Exception('data is null');
    // }
    //
    // final buffer = await ParserFFi(
    //   parser: blueMap.getAutoCompleteParser(model.baseParser.value).toPb(),
    //   source: rsp.data!,
    //   env: Get.find<SiteService>().website.globalEnv,
    //   type: RpcType.RPC_TYPE_AUTO_COMPLETE,
    // ).send();
    //
    // final result = AutoCompleteRpcModel.fromBuffer(buffer);
    //
    // _checkSuccessFlag(
    //   enableSuccess: result.enableSuccess,
    //   enableFail: result.enableFail,
    //   isSuccess: result.isSuccess,
    //   failedMessage: result.failedMessage,
    // );
    //
    // localEnv.mergeMap(result.localEnv);
    // Get.find<SiteService>().website.updateGlobalEnv(result.globalEnv);
    throw UnimplementedError();
  }
}

Dio _buildDio({
  required SiteBlueMap model,
  required CookieJar cookieJar,
  required WebTableData db,
  bool isImage = false,
}) {
  final dio = Dio();

  dio.options
    ..connectTimeout = 60.seconds
    ..receiveTimeout = (5 * 60).seconds
    ..sendTimeout = 60.seconds;

  if (model.baseUrl.isNotEmpty) {
    dio.options.baseUrl = model.baseUrl;
  }

  dio.transformer = EncodeTransformer();
  final setting = Get.find<SettingService>();

  dio.interceptors.add(CookieManager(cookieJar));
  dio.interceptors.add(HeaderCookieInterceptor(model: model, db: db));
  dio.interceptors.add(RetryInterceptor(
    dio: dio,
    logPrint: print,
    retries: 3,
    retryDelays: const [
      Duration(seconds: 1),
      Duration(seconds: 2),
      Duration(seconds: 3),
    ],
  ));

  if (!isImage) {
    dio.interceptors.add(DioCacheInterceptor(options: setting.cacheOptions));
    dio.interceptors.add(HttpFormatter(includeResponseBody: true));
  } else {
    dio.interceptors.add(
      DioCacheInterceptor(options: setting.imageCacheOption),
    );
  }

  if (model.containsFlag(Flag.ignoreCertificate)) {
    (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient =
        () => HttpClient()
          ..badCertificateCallback =
              (X509Certificate cert, String host, int port) => true;
  }

  return dio;
}
