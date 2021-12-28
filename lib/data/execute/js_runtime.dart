import 'package:flutter_qjs/flutter_qjs.dart';

class JsRuntime {
  final _engine = FlutterQjs(stackSize: 1024 * 1024);
  late final JSInvokable _setToGlobalObject;

  String? exec(String js, String args) {
    try {
      _engine.evaluate(js);
      final result = _engine.evaluate('hook("$args")');
      if (result is Future) throw Exception('Future is not allowed here');
      return result.toString();
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
