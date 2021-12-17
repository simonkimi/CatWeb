import 'package:dio/dio.dart';
import 'package:flutter_qjs/flutter_qjs.dart';

class JsRuntime {
  JsRuntime({required Dio dio}) : _dio = dio;

  final _engine = FlutterQjs(stackSize: 1024 * 1024);
  late final JSInvokable _setToGlobalObject;
  final Dio _dio;

  Future<void> init() async {
    _setToGlobalObject =
        await _engine.evaluate('(key, val) => { this[key] = val; }');
    await _setToGlobalObject.invoke(
        ['get', (String url) => _dio.get(url).then((value) => value.data)]);
    await _setToGlobalObject.invoke([
      'post',
      (String url, String data) =>
          _dio.post(url, data: data).then((value) => value.data)
    ]);
    // TODO 本地数据获取
  }

  Future<String?> exec(String js, String args) async {
    try {
      await _engine.evaluate(js);
      final result = _engine.evaluate('hook($args)');
      return result;
    } on Exception {
      return null;
    }
  }

  Future<void> dispose() async {
    _setToGlobalObject.free();
    _engine.port.close();
    _engine.close();
  }
}
