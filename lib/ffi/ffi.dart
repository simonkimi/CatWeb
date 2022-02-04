import 'package:brotli/brotli.dart';
import 'package:catweb/gen/protobuf/rpc.pbserver.dart';
import 'package:ffi/ffi.dart' as ffi;
import 'dart:ffi';
import 'libgo.h.dart';
import 'dart:io';

RpcResponse ffiParse(RpcRequest msg) {
  final _native = NativeLibrary(Platform.isAndroid
      ? DynamicLibrary.open('libgo.so')
      : Platform.isWindows
          ? DynamicLibrary.open('./lib/libs/libgo.dll')
          : DynamicLibrary.process());

  final raw = msg.writeToBuffer();
  final buffer = ffi.malloc.allocate<Int8>(raw.length + 1);
  buffer.asTypedList(raw.length + 1)
    ..setAll(0, raw)
    ..[raw.length] = 0;

  final result = _native.ParseData(buffer, raw.length);
  final rsp = RpcResponse.fromBuffer(result.data.asTypedList(result.len));

  ffi.malloc.free(buffer);
  _native.FreeResult(result);
  return rsp;
}
