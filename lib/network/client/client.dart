import 'dart:convert';
import 'dart:io';

import 'package:catweb/data/constant.dart';
import 'package:catweb/data/controller/global.dart';
import 'package:catweb/data/controller/site.dart';
import 'package:catweb/data/database/database.dart';
import 'package:catweb/data/models/ffi/result/result.dart';
import 'package:catweb/data/models/site/page.dart';
import 'package:catweb/data/models/site/parser.dart';
import 'package:catweb/data/models/site/site_blueprint.dart';
import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/navigator.dart';

import 'package:catweb/network/interceptor/cookie_interceptor.dart';
import 'package:catweb/network/interceptor/encode_transform.dart';
import 'package:catweb/utils/debug.dart';
import 'package:catweb/utils/num_helper.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:dio_http_formatter/dio_http_formatter.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';

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
  final SiteBlueprint blueMap;

  Future<Response<String>> _buildRequest({
    required String url,
    required SitePageRule model,
    required SiteEnvStore localEnv,
    Options? options,
  }) async {
    final form = localEnv.apply(model.formData);
    final url2 = localEnv.apply(url);

    final req = switch (model.action) {
      SiteNetType.delete => dio.delete<String>(url2, options: options),
      SiteNetType.get => dio.get<String>(url2, options: options),
      SiteNetType.post => dio.post<String>(url2, data: form, options: options),
      SiteNetType.put => dio.put<String>(url2, data: form, options: options)
    };

    final rsp = await req;

    if (rsp.data == null) {
      throw Exception('data is null');
    }
    return rsp;
  }

  void _checkSuccessFlag(bool? isSuccess, String? failMessage) {
    if (failMessage?.isNotEmpty == true) {
      throw FlagException(failMessage!);
    }
    if (isSuccess == false) {
      throw FlagException('Success flag is not true');
    }
  }

  Future<ListParserResult> getList({
    required String url,
    required SitePageRule model,
    required SiteEnvStore localEnv,
  }) async {
    final parser = blueMap.getParserById<ParserModelList>(model.parserId);

    final req = await _buildRequest(
      url: url,
      model: model,
      localEnv: localEnv,
    );

    final rsp = await callFFiParser(
      req.data!,
      'ParserType.list.value',
      jsonEncode(parser.toJson()),
    );

    final result = ListParserResult.fromJson(jsonDecode(rsp));
    _checkSuccessFlag(result.isSuccess, result.failMessage);
    siteService.currentSite?.updateGlobalEnv(result.envs);
    return result;
  }

  Future<DetailParserResult> getDetail({
    required String url,
    required SitePageRule model,
    required SiteEnvStore localEnv,
  }) async {
    final parser = blueMap.getParserById<ParserModelDetail>(model.parserId);

    final options = globalService.cacheOptions
        .copyWith(policy: CachePolicy.forceCache)
        .toOptions();

    final rsp = await _buildRequest(
      url: url,
      model: model,
      localEnv: localEnv,
      options: options,
    );

    final parseRsp = await callFFiParser(
      rsp.data!,
      '',
      jsonEncode(parser.toJson()),
    );

    final result = DetailParserResult.fromJson(jsonDecode(parseRsp));
    _checkSuccessFlag(result.isSuccess, result.failMessage);
    siteService.currentSite?.updateGlobalEnv(result.envs);
    return result;
  }

  Future<ImageReaderResult> getReadImage({
    required String url,
    required SitePageRule model,
    required SiteEnvStore localEnv,
  }) async {
    final parser =
        blueMap.getParserById<ParserModelImageReader>(model.parserId);

    final options = getIt
        .get<GlobalService>()
        .imageCacheOption
        .copyWith(policy: CachePolicy.forceCache)
        .toOptions();

    final rsp = await _buildRequest(
      url: url,
      model: model,
      localEnv: localEnv,
      options: options,
    );

    final parserRsq = await callFFiParser(
      rsp.data!,
      'ParserType.image.value',
      jsonEncode(parser.toJson()),
    );

    final result = ImageReaderResult.fromJson(jsonDecode(parserRsq));
    _checkSuccessFlag(result.isSuccess, result.failMessage);
    siteService.currentSite?.updateGlobalEnv(result.envs);
    return result;
  }

  Future<AutoCompleteResult> getAutoComplete({
    required String url,
    required SitePageRule model,
    required SiteEnvStore localEnv,
  }) async {
    final parser =
        blueMap.getParserById<ParserModelAutoComplete>(model.parserId);

    final rsp = await _buildRequest(url: url, model: model, localEnv: localEnv);

    final parseRsp = await callFFiParser(
      rsp.data!,
      'ParserType.autoComplete.value',
      jsonEncode(parser.toJson()),
    );

    final result = AutoCompleteResult.fromJson(jsonDecode(parseRsp));
    _checkSuccessFlag(result.isSuccess, result.failMessage);
    siteService.currentSite?.updateGlobalEnv(result.envs);
    return result;
  }

  static Dio _buildDio({
    required SiteBlueprint model,
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
      dio.interceptors
          .add(DioCacheInterceptor(options: globalService.cacheOptions));
      dio.interceptors.add(HttpFormatter(includeResponseBody: false));
    } else {
      dio.interceptors.add(
        DioCacheInterceptor(options: globalService.imageCacheOption),
      );
    }

    if (model.containsFlag(Flag.ignoreCertificate)) {
      (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () =>
          HttpClient()
            ..badCertificateCallback =
                (X509Certificate cert, String host, int port) => true;
    }

    return dio;
  }

  static GlobalService get globalService => getIt.get();

  static SiteService get siteService => getIt.get();
}

Future<String> callFFiParser(
  String content,
  String parserType,
  String parser,
) async {
  logger.d(
      'Call FFI Parser $parserType len:${content.length} parser:${parser.length}');
  // final rsp = await parseHtmlAsync(content, parserType, parser);
  // logger.d('FFI Parser Result: ${rsp.length}');
  // return rsp;
  return '';
}
