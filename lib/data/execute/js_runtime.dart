import 'package:dio/dio.dart';
import 'package:flutter_qjs/flutter_qjs.dart';

class JsRuntime {
  JsRuntime({required this.dio});

  final engine = FlutterQjs(stackSize: 1024 * 1024);
  late final JSInvokable setToGlobalObject;
  final Dio dio;

  Future<void> init() async {
    setToGlobalObject =
        await engine.evaluate('(key, val) => { this[key] = val; }');
    await setToGlobalObject.invoke(
        ['get', (String url) => dio.get(url).then((value) => value.data)]);
    await setToGlobalObject.invoke([
      'post',
      (String url, String data) =>
          dio.post(url, data: data).then((value) => value.data)
    ]);
    // TODO 本地数据获取
  }

  Future<String?> exec(String js, List<String> args) async {
    await engine.evaluate(js);
    final result = engine.evaluate('hook(${args.join(',')})');
    // TODO 处理js运行错误
    return result;
  }

  Future<void> dispose() async {
    setToGlobalObject.free();
    engine.port.close();
    engine.close();
  }
}
