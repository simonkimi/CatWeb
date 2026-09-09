import 'dart:typed_data';

import 'package:catweb/data/loading/cancellation.dart';
import 'package:catweb/data/site_runtime/runtime_contracts.dart';
import 'package:catweb/data/site_runtime/site_definition.dart';
import 'package:test/test.dart';

void main() {
  test('unavailable parser fails explicitly', () async {
    final parser = ParserRule(id: 'list-parser', kind: EndpointKind.list);
    final endpoint = EndpointRule(
      id: 'list',
      kind: EndpointKind.list,
      name: 'List',
      request: RequestRule(
        method: RequestMethod.get,
        url: 'https://example.com',
      ),
      parserId: 'list-parser',
      pagination: const PaginationRule.none(),
    );
    final job = ParseJob<Object>(
      endpoint: endpoint,
      parser: parser,
      response: RawResponse(statusCode: 200, body: Uint8List(0)),
    );

    expect(
      const UnavailableParserEngine().parse(job, CancellationScope()),
      throwsA(isA<ParserUnavailableException>()),
    );
  });
}
