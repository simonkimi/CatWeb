import 'package:catweb/data/protocol/model/store.dart';
import 'package:catweb/network/interceptor/cookie_interceptor.dart';
import 'package:catweb/network/interceptor/encode_transform.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class DioBuilder {
  static Dio build(SiteProtobufModel model) {
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
}
