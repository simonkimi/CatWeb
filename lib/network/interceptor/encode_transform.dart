import 'dart:typed_data';

import 'package:brotli/brotli.dart';
import 'package:dio/dio.dart';

class EncodeTransformer extends BackgroundTransformer {
  @override
  Future transformResponse(
      RequestOptions options, ResponseBody responseBody) async {
    if (responseBody.headers['content-encoding']?.contains('br') ?? false) {
      if (options.responseType == ResponseType.bytes) {
        final data = <int>[];
        await responseBody.stream.forEach(data.addAll);
        return brotli.decode(Uint8List.fromList(data));
      }
      return await brotli.decodeStream(responseBody.stream);
    }
    return super.transformResponse(options, responseBody);
  }
}
