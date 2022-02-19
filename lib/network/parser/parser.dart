import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/ffi/ffi.dart';
import 'package:catweb/gen/protobuf/rpc.pbserver.dart';
import 'package:flutter/foundation.dart';
import 'package:protobuf/protobuf.dart';

class ParserFFi {
  ParserFFi({
    required this.source,
    required this.parser,
    required this.type,
    required this.env,
  });

  final String source;
  final GeneratedMessage parser;
  final RpcType type;
  final SiteEnvModel env;

  RpcRequest get request => RpcRequest(
        type: type,
        env: env.env,
        data: source,
        parserData: parser.writeToBuffer(),
      );

  Future<List<int>> send() async {
    final result = await compute(ffiParse, request);

    if (result.hasError() && result.error.isNotEmpty) {
      throw Exception(result.error);
    }
    return result.data;
  }
}
