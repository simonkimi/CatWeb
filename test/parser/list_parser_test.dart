import 'package:catweb/data/models/ffi/result/result.dart';
import 'package:catweb/data/models/site/parser.dart';
import 'package:catweb/network/client/client.dart';
import 'package:test/test.dart';

void main() {
  test('returns the temporary parser placeholder', () async {
    final rsp = await callFFiParser('', ParserModelType.list, '{}');
    final result = ListParserResult.fromJson(rsp);

    expect(result.isSuccess, isFalse);
    expect(result.items, isEmpty);
    expect(result.errors.single.code, -1);
  });
}
