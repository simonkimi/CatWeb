import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/gen/protobuf/rpc.pbserver.dart';
import 'package:ffi/ffi.dart' as ffi;
import 'dart:ffi';
import 'libgo.h.dart';

class FFi {
  FFi._();

  final _native = NativeLibrary(DynamicLibrary.open('libgo.so'));

  static final FFi _instant = FFi._();

  factory FFi() => _instant;

  List<int> parse({
    required String html,
    required List<int> selectorPb,
    required SiteEnvModel env,
    required RpcType type,
  }) {
    final raw = RpcRequest(
      data: html,
      parserData: selectorPb,
      env: env.env,
      type: type,
    ).writeToBuffer();

    final buffer = ffi.malloc.allocate<Int8>(raw.length + 1);
    buffer.asTypedList(raw.length + 1)
      ..setAll(0, raw)
      ..[raw.length] = 0;

    final result = _native.ParseData(buffer, raw.length);
    final rsp = RpcResponse.fromBuffer(result.data.asTypedList(result.len));

    ffi.malloc.free(buffer);
    _native.FreeResult(result);

    if (rsp.hasError() && rsp.error.isNotEmpty) {
      throw Exception(rsp.error);
    }
    return rsp.data;
  }
}
