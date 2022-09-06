import 'package:catweb/data/constant.dart';
import 'package:catweb/data/controller/setting_controller.dart';
import 'package:catweb/data/controller/site_controller.dart';
import 'package:catweb/data/database/database.dart';
import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/data/protocol/model/page.dart';
import 'package:catweb/data/protocol/model/store.dart';
import 'package:catweb/gen/protobuf/actions.pbenum.dart';
import 'package:catweb/gen/protobuf/model.pbserver.dart';
import 'package:catweb/gen/protobuf/rpc.pbserver.dart';
import 'package:catweb/network/interceptor/cookie_interceptor.dart';
import 'package:catweb/network/interceptor/encode_transform.dart';
import 'package:catweb/network/parser/parser.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
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
    required this.configModel,
    required CookieJar cookieJar,
    required WebTableData db,
  })  : dio = _buildDio(
          model: configModel,
          cookieJar: cookieJar,
          db: db,
        ),
        imageDio = _buildDio(
          model: configModel,
          cookieJar: cookieJar,
          isImage: true,
          db: db,
        );

  final Dio dio;
  final Dio imageDio;
  final SiteBlueprintModel configModel;

  Future<Response<String>> _buildRequest({
    required String url,
    required PageBlueprintModel model,
    required SiteEnvModel localEnv,
    Options? options,
  }) async {
    final form = localEnv.replace(model.formData.value);
    final url2 = localEnv.replace(url);

    switch (model.netAction.value) {
      case NetActionType.NET_ACTION_TYPE_DELETE:
        return dio.delete(url2, options: options);
      case NetActionType.NET_ACTION_TYPE_GET:
        return await dio.get<String>(url2, options: options);
      case NetActionType.NET_ACTION_TYPE_POST:
        return await dio.post<String>(url2, data: form, options: options);
      case NetActionType.NET_ACTION_TYPE_PUT:
        return await dio.put<String>(url2, data: form, options: options);
    }
    throw Exception('Unsupported net action type');
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

  Future<ListRpcModel> getList({
    required String url,
    required PageBlueprintModel model,
    required SiteEnvModel localEnv,
  }) async {
    final rsp = await _buildRequest(
      url: url,
      model: model,
      localEnv: localEnv,
    );
    if (rsp.data == null) {
      throw Exception('data is null');
    }

    final buffer = await ParserFFi(
      parser: configModel.getListParser(model.baseParser.value).toPb(),
      source: rsp.data!,
      env: Get.find<GlobalController>().website.globalEnv,
      type: RpcType.RPC_TYPE_LIST_VIEW_PARSER,
    ).send();

    final result = ListRpcModel.fromBuffer(buffer);

    _checkSuccessFlag(
      enableSuccess: result.enableSuccess,
      enableFail: result.enableFail,
      isSuccess: result.isSuccess,
      failedMessage: result.failedMessage,
    );

    localEnv.mergeMap(result.localEnv);
    Get.find<GlobalController>().website.updateGlobalEnv(result.globalEnv);

    return result;
  }

  Future<GalleryRpcModel> getGallery({
    required String url,
    required PageBlueprintModel model,
    required SiteEnvModel localEnv,
  }) async {
    final options = Get.find<SettingController>()
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

    final buffer = await ParserFFi(
      parser: configModel.getGalleryParser(model.baseParser.value).toPb(),
      source: rsp.data!,
      env: Get.find<GlobalController>().website.globalEnv,
      type: RpcType.RPC_TYPE_GALLERY_PARSER,
    ).send();

    final result = GalleryRpcModel.fromBuffer(buffer);

    _checkSuccessFlag(
      enableSuccess: result.enableSuccess,
      enableFail: result.enableFail,
      isSuccess: result.isSuccess,
      failedMessage: result.failedMessage,
    );

    localEnv.mergeMap(result.localEnv);
    Get.find<GlobalController>().website.updateGlobalEnv(result.globalEnv);
    return result;
  }

  Future<ImageReaderRpcModel> getReadImage({
    required String url,
    required PageBlueprintModel model,
    required SiteEnvModel localEnv,
  }) async {
    final options = Get.find<SettingController>()
        .imageCacheOption
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

    final buffer = await ParserFFi(
      parser: configModel.getImageParser(model.baseParser.value).toPb(),
      source: rsp.data!,
      env: Get.find<GlobalController>().website.globalEnv,
      type: RpcType.RPC_TYPE_IMAGE_PARSER,
    ).send();

    final result = ImageReaderRpcModel.fromBuffer(buffer);

    _checkSuccessFlag(
      enableSuccess: result.enableSuccess,
      enableFail: result.enableFail,
      isSuccess: result.isSuccess,
      failedMessage: result.failedMessage,
    );

    localEnv.mergeMap(result.localEnv);
    Get.find<GlobalController>().website.updateGlobalEnv(result.globalEnv);
    return result;
  }

  Future<AutoCompleteRpcModel> getAutoComplete({
    required String url,
    required PageBlueprintModel model,
    required SiteEnvModel localEnv,
  }) async {
    final rsp = await _buildRequest(url: url, model: model, localEnv: localEnv);
    if (rsp.data == null) {
      throw Exception('data is null');
    }

    final buffer = await ParserFFi(
      parser: configModel.getAutoCompleteParser(model.baseParser.value).toPb(),
      source: rsp.data!,
      env: Get.find<GlobalController>().website.globalEnv,
      type: RpcType.RPC_TYPE_AUTO_COMPLETE,
    ).send();

    final result = AutoCompleteRpcModel.fromBuffer(buffer);

    _checkSuccessFlag(
      enableSuccess: result.enableSuccess,
      enableFail: result.enableFail,
      isSuccess: result.isSuccess,
      failedMessage: result.failedMessage,
    );

    localEnv.mergeMap(result.localEnv);
    Get.find<GlobalController>().website.updateGlobalEnv(result.globalEnv);
    return result;
  }
}

Dio _buildDio({
  required SiteBlueprintModel model,
  required CookieJar cookieJar,
  required WebTableData db,
  bool isImage = false,
}) {
  final dio = Dio();

  dio.options
    ..connectTimeout = 60 * 1000
    ..receiveTimeout = 60 * 1000 * 5
    ..sendTimeout = 60 * 1000;

  if (model.baseUrl.value.isNotEmpty) {
    dio.options.baseUrl = model.baseUrl.value;
  }

  dio.transformer = EncodeTransformer();
  final setting = Get.find<SettingController>();

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
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) => client
          ..badCertificateCallback = ((cert, host, port) => true)
          ..userAgent = null;
  }

  return dio;
}
