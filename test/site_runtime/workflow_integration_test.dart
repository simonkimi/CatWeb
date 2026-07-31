import 'dart:typed_data';

import 'package:catweb/data/loading/cancellation.dart';
import 'package:catweb/data/loading/paged_loader.dart';
import 'package:catweb/data/site_runtime/runtime_contracts.dart';
import 'package:catweb/data/site_runtime/site_compiler.dart';
import 'package:catweb/data/site_runtime/site_definition.dart';
import 'package:catweb/data/site_runtime/site_executor.dart';
import 'package:catweb/data/site_runtime/site_page_source.dart';
import 'package:test/test.dart';

void main() {
  test('list, gallery, reader and autocomplete share one executor', () async {
    final transport = _WorkflowTransport();
    final executor = DefaultSiteExecutor(
      site: const SiteCompiler().compile(_definition()),
      transport: transport,
      parser: const _WorkflowParser(),
      environment: InMemoryEnvironmentStore({'token': 'global'}),
    );
    final list = PagedLoader<String>(
      source: SitePageSource<String>(executor: executor, endpointId: 'list'),
    );
    await list.loadInitial();
    expect(list.state.items, {0: 'gallery-1'});

    final gallery = PagedLoader<String>(
      source: SitePageSource<String>(
        executor: executor,
        endpointId: 'gallery',
        inputs: {'id': list.state.itemAt(0)},
      ),
    );
    await gallery.loadInitial();
    expect(gallery.state.items, {0: 'image-1'});

    final reader = await executor.execute<String>(
      SiteOperation<String>(
        endpointId: 'reader',
        inputs: {'id': gallery.state.itemAt(0)},
      ),
      CancellationScope(),
    );
    final autocomplete = await executor.execute<List<String>>(
      SiteOperation<List<String>>(
        endpointId: 'autocomplete',
        inputs: {'query': 'ca'},
      ),
      CancellationScope(),
    );

    expect(reader.data, 'https://img.test/image-1.jpg');
    expect(autocomplete.data, ['cat', 'catalog']);
    expect(transport.uris.map((uri) => uri.toString()), [
      'https://example.test/list?page=0',
      'https://example.test/gallery/gallery-1',
      'https://example.test/reader/image-1',
      'https://example.test/autocomplete?q=ca',
    ]);
    await list.dispose();
    await gallery.dispose();
  });
}

SiteDefinition _definition() {
  return SiteDefinition(
    schemaVersion: SiteDefinition.currentSchemaVersion,
    id: 'workflow',
    name: 'Workflow',
    baseUrl: 'https://example.test/',
    parsers: [
      for (final kind in EndpointKind.values)
        ParserRule(id: '${kind.name}-parser', kind: kind),
    ],
    endpoints: [
      EndpointRule(
        id: 'list',
        kind: EndpointKind.list,
        name: 'List',
        request: RequestRule(
          method: RequestMethod.get,
          url: '/list',
          query: const {'page': '{{page}}'},
        ),
        parserId: 'list-parser',
        pagination: const PaginationRule.pageNumber(
          variable: 'page',
          initial: 0,
          step: 1,
          pageSize: 2,
          endCondition: PageEndCondition.shortPage,
        ),
        links: const EndpointLinks(
          item: 'gallery',
          autocomplete: 'autocomplete',
        ),
      ),
      EndpointRule(
        id: 'gallery',
        kind: EndpointKind.gallery,
        name: 'Gallery',
        request: RequestRule(method: RequestMethod.get, url: '/gallery/{{id}}'),
        parserId: 'gallery-parser',
        pagination: const PaginationRule.none(),
        links: const EndpointLinks(reader: 'reader'),
      ),
      EndpointRule(
        id: 'reader',
        kind: EndpointKind.reader,
        name: 'Reader',
        request: RequestRule(method: RequestMethod.get, url: '/reader/{{id}}'),
        parserId: 'reader-parser',
        pagination: const PaginationRule.none(),
      ),
      EndpointRule(
        id: 'autocomplete',
        kind: EndpointKind.autocomplete,
        name: 'Autocomplete',
        request: RequestRule(
          method: RequestMethod.get,
          url: '/autocomplete',
          query: const {'q': '{{query}}'},
        ),
        parserId: 'autocomplete-parser',
        pagination: const PaginationRule.none(),
      ),
    ],
  );
}

final class _WorkflowTransport implements HttpTransport {
  final List<Uri> uris = [];

  @override
  Future<RawResponse> send(
    ResolvedRequest request,
    CancellationScope cancellation,
  ) async {
    cancellation.throwIfCancelled();
    uris.add(request.uri);
    return RawResponse(statusCode: 200, body: Uint8List(0));
  }
}

final class _WorkflowParser implements ParserEngine {
  const _WorkflowParser();

  @override
  Future<ParsedPayload<T>> parse<T>(
    ParseJob<T> job,
    CancellationScope cancellation,
  ) async {
    cancellation.throwIfCancelled();
    final result = switch (job.endpoint.kind) {
      EndpointKind.list => ParsedPayload<List<String>>(
        data: const ['gallery-1'],
        itemCount: 1,
      ),
      EndpointKind.gallery => ParsedPayload<List<String>>(
        data: const ['image-1'],
        itemCount: 1,
      ),
      EndpointKind.reader => ParsedPayload<String>(
        data: 'https://img.test/image-1.jpg',
      ),
      EndpointKind.autocomplete => ParsedPayload<List<String>>(
        data: const ['cat', 'catalog'],
      ),
    };
    return result as ParsedPayload<T>;
  }
}
