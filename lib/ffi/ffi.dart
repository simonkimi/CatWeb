import 'package:catweb/gen/h/libgo.h.dart';
import 'package:catweb/gen/protobuf/rpc.pbserver.dart';
import 'package:ffi/ffi.dart' as ffi;
import 'dart:ffi';
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

String runJs(String js, String input) {
  final _native = NativeLibrary(Platform.isAndroid
      ? DynamicLibrary.open('libgo.so')
      : Platform.isWindows
          ? DynamicLibrary.open('./lib/libs/libgo.dll')
          : DynamicLibrary.process());

  final jsBuffer = js.toNativeUtf8().cast<Int8>();
  final inputBuffer = input.toNativeUtf8().cast<Int8>();

  final result = _native.RunJs(jsBuffer, inputBuffer);

  final str = result.data.cast<ffi.Utf8>().toDartString(length: result.len);
  ffi.malloc.free(jsBuffer);
  ffi.malloc.free(inputBuffer);
  _native.FreeResult(result);
  return str;
}
