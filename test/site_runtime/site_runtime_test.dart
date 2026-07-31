import 'dart:typed_data';

import 'package:catweb/data/loading/cancellation.dart';
import 'package:catweb/data/loading/paged_loader.dart';
import 'package:catweb/data/site_runtime/request_resolver.dart';
import 'package:catweb/data/site_runtime/runtime_contracts.dart';
import 'package:catweb/data/site_runtime/site_compiler.dart';
import 'package:catweb/data/site_runtime/site_definition.dart';
import 'package:catweb/data/site_runtime/site_executor.dart';
import 'package:catweb/data/site_runtime/site_page_source.dart';
import 'package:test/test.dart';

void main() {
  group('SiteCompiler', () {
    test('rejects old schemas and invalid endpoint links', () {
      final definition = _siteDefinition(
        schemaVersion: 1,
        links: const EndpointLinks(item: 'missing'),
      );

      expect(
        () => const SiteCompiler().compile(definition),
        throwsA(
          isA<SiteCompileException>().having(
            (error) => error.errors,
            'errors',
            containsAll([
              contains('Unsupported schemaVersion'),
              contains('missing endpoint'),
            ]),
          ),
        ),
      );
    });

    test('round-trips schema v2 JSON', () {
      final definition = _siteDefinition();

      final decoded = SiteDefinition.fromJson(definition.toJson());
      final compiled = const SiteCompiler().compile(decoded);

      expect(compiled.definition.schemaVersion, 2);
      expect(
        compiled.endpoint('list').pagination,
        isA<PageNumberPaginationRule>(),
      );
    });

    test('generated serializers preserve the schema v2 JSON shape', () {
      final parser = ParserRule(
        id: 'list-parser',
        kind: EndpointKind.list,
        config: const ParserConfig(
          selectors: {'item': SelectorRule(selector: '.item')},
        ),
      );

      expect(parser.toJson(), {
        'id': 'list-parser',
        'name': '',
        'kind': 'list',
        'config': {
          'selectors': {
            'item': {
              'selector': '.item',
              'queryType': 'css',
              'function': 'text',
              'parameter': '',
              'regex': '',
              'replace': '',
              'script': {'type': 'output'},
              'defaultValue': '',
            },
          },
          'extras': <Object?>[],
        },
      });
      final selector = SelectorRule.fromJson(
        const SelectorRule(
          selector: '//a',
          queryType: SelectorQueryType.xpath,
          function: SelectorFunctionType.attribute,
          parameter: 'href',
          regex: r'/g/(.+)',
          script: SelectorScript.javaScript(source: r'return $arg;'),
        ).toJson(),
      );
      expect(selector.queryType, SelectorQueryType.xpath);
      expect(selector.parameter, 'href');
      expect(selector.script, isA<JavaScriptSelectorScript>());
      expect(const EndpointLinks(item: 'gallery').toJson(), {
        'item': 'gallery',
      });
      expect(RequestBodyRule.json(const {'page': 1}).toJson(), {
        'value': {'page': 1},
        'type': 'json',
      });
      expect(const PaginationRule.none().toJson(), {'type': 'none'});
    });

    test('strictly rejects unknown enum and pagination values', () {
      final json = _siteDefinition().toJson();
      final endpoints = json['endpoints']! as List<Object?>;
      final endpoint = endpoints.single! as Map<String, Object?>;
      endpoint['kind'] = 'unknown';
      endpoint['pagination'] = {'type': 'mystery'};

      expect(
        () => const SiteCompiler().compileJson(json),
        throwsA(
          isA<SiteCompileException>().having(
            (error) => error.errors.single,
            'error',
            contains('Unknown endpoint.kind'),
          ),
        ),
      );
    });
  });

  group('RequestResolver', () {
    test('resolves typed variables into URL, query, headers and JSON', () {
      final endpoint = _endpoint(
        request: RequestRule(
          method: RequestMethod.post,
          url: '/items/{{id}}',
          query: {'page': '{{page}}', 'empty': '{{empty}}'},
          headers: {'x-token': '{{token}}'},
          body: RequestBodyRule.json({
            'enabled': '{{enabled}}',
            'label': 'item-{{id}}',
          }),
        ),
      );

      final request = const RequestResolver().resolve(
        baseUri: Uri.parse('https://example.test/root/'),
        endpoint: endpoint,
        variables: {
          'id': 42,
          'page': 3,
          'empty': null,
          'token': 'secret',
          'enabled': true,
        },
      );

      expect(request.uri.toString(), 'https://example.test/items/42?page=3');
      expect(request.headers, {'x-token': 'secret'});
      final body = request.body as JsonResolvedRequestBody;
      expect(body.value, {'enabled': true, 'label': 'item-42'});
    });
  });

  group('DefaultSiteExecutor', () {
    test(
      'applies variable precedence and commits environment after parsing',
      () async {
        final site = const SiteCompiler().compile(
          _siteDefinition(
            request: RequestRule(
              method: RequestMethod.get,
              url: '/items',
              query: {'page': '{{page}}', 'query': '{{query}}'},
            ),
          ),
        );
        final transport = _FakeTransport();
        final environment = _RecordingEnvironmentStore({'query': 'global'});
        final parser = _FakeParserEngine((job) {
          return ParsedPayload<List<String>>(
            data: ['item'],
            itemCount: 1,
            environment: EnvironmentPatch(
              global: {'persisted': 'yes'},
              local: {'localResult': 'ok'},
            ),
          );
        });
        final executor = DefaultSiteExecutor(
          site: site,
          transport: transport,
          parser: parser,
          environment: environment,
        );

        final result = await executor.execute<List<String>>(
          SiteOperation<List<String>>(
            endpointId: 'list',
            context: RequestContext({'query': 'local'}),
            inputs: {'query': 'input'},
            pageRequest: const PageRequest.initial(),
          ),
          CancellationScope(),
        );

        expect(transport.requests.single.uri.queryParameters, {
          'page': '0',
          'query': 'input',
        });
        expect(environment.values['persisted'], 'yes');
        expect(result.context.variables['localResult'], 'ok');
        expect(result.nextCursor, const PageCursor.number(1));
      },
    );

    test('does not commit environment when parsing fails', () async {
      final site = const SiteCompiler().compile(_siteDefinition());
      final environment = _RecordingEnvironmentStore({'before': 1});
      final executor = DefaultSiteExecutor(
        site: site,
        transport: _FakeTransport(),
        parser: _FakeParserEngine((_) => throw StateError('bad document')),
        environment: environment,
      );

      await expectLater(
        executor.execute<List<String>>(
          SiteOperation<List<String>>(
            endpointId: 'list',
            pageRequest: const PageRequest.initial(),
          ),
          CancellationScope(),
        ),
        throwsStateError,
      );
      expect(environment.applyCount, 0);
      expect(environment.values, {'before': 1});
    });

    test('propagates cancellation without invoking the parser', () async {
      final site = const SiteCompiler().compile(_siteDefinition());
      final transport = _BlockingTransport();
      var parserCalls = 0;
      final executor = DefaultSiteExecutor(
        site: site,
        transport: transport,
        parser: _FakeParserEngine((_) {
          parserCalls++;
          return ParsedPayload<List<String>>(data: const []);
        }),
        environment: InMemoryEnvironmentStore(),
      );
      final cancellation = CancellationScope();
      final future = executor.execute<List<String>>(
        SiteOperation<List<String>>(
          endpointId: 'list',
          pageRequest: const PageRequest.initial(),
        ),
        cancellation,
      );
      await Future<void>.delayed(Duration.zero);

      cancellation.cancel('test');

      await expectLater(future, throwsA(isA<CancellationException>()));
      expect(parserCalls, 0);
    });

    test('validates parser metadata before committing environment', () async {
      final site = const SiteCompiler().compile(_siteDefinition());
      final environment = _RecordingEnvironmentStore({'before': 1});
      final executor = DefaultSiteExecutor(
        site: site,
        transport: _FakeTransport(),
        parser: _FakeParserEngine(
          (_) => ParsedPayload<List<String>>(
            data: const ['item'],
            itemCount: -1,
            environment: EnvironmentPatch(global: {'mustNotCommit': true}),
          ),
        ),
        environment: environment,
      );

      await expectLater(
        executor.execute<List<String>>(
          SiteOperation<List<String>>(
            endpointId: 'list',
            pageRequest: const PageRequest.initial(),
          ),
          CancellationScope(),
        ),
        throwsA(isA<SiteRuntimeException>()),
      );
      expect(environment.applyCount, 0);
      expect(environment.values, {'before': 1});
    });

    test('wraps environment write failures as persistence failures', () async {
      final site = const SiteCompiler().compile(_siteDefinition());
      final executor = DefaultSiteExecutor(
        site: site,
        transport: _FakeTransport(),
        parser: _FakeParserEngine(
          (_) => ParsedPayload<List<String>>(
            data: const [],
            itemCount: 0,
            environment: EnvironmentPatch(global: {'token': 'new'}),
          ),
        ),
        environment: _FailingEnvironmentStore(),
      );

      await expectLater(
        executor.execute<List<String>>(
          SiteOperation<List<String>>(
            endpointId: 'list',
            pageRequest: const PageRequest.initial(),
          ),
          CancellationScope(),
        ),
        throwsA(isA<PersistenceException>()),
      );
    });
  });

  group('SitePageSource', () {
    test('supports indexed page-number access', () async {
      final site = const SiteCompiler().compile(_siteDefinition());
      final transport = _FakeTransport();
      final executor = DefaultSiteExecutor(
        site: site,
        transport: transport,
        parser: _FakeParserEngine(
          (_) => ParsedPayload<List<int>>(
            data: List.generate(10, (index) => index),
            itemCount: 10,
            totalCount: 100,
          ),
        ),
        environment: InMemoryEnvironmentStore(),
      );
      final source = SitePageSource<int>(
        executor: executor,
        endpointId: 'list',
      );
      final loader = PagedLoader<int>(source: source);

      await loader.ensureIndex(42);

      expect(transport.requests.single.uri.queryParameters['page'], '4');
      expect(loader.state.items.keys.first, 40);
      expect(loader.state.totalCount, 100);
      await loader.dispose();
    });

    test('refresh forces revalidation for the new initial request', () async {
      final site = const SiteCompiler().compile(_siteDefinition());
      final transport = _FakeTransport();
      final executor = DefaultSiteExecutor(
        site: site,
        transport: transport,
        parser: _FakeParserEngine(
          (_) => ParsedPayload<List<int>>(data: const [1], itemCount: 1),
        ),
        environment: InMemoryEnvironmentStore(),
      );
      final loader = PagedLoader<int>(
        source: SitePageSource<int>(executor: executor, endpointId: 'list'),
      );

      await loader.loadInitial();
      await loader.refresh();

      expect(transport.requests, hasLength(2));
      expect(transport.requests.first.cacheDirective, CacheDirective.normal);
      expect(transport.requests.last.cacheDirective, CacheDirective.refresh);
      await loader.dispose();
    });

    test(
      'uses continuation URLs without exposing them to the loader',
      () async {
        final definition = _siteDefinition(
          pagination: const PaginationRule.continuation(
            target: ContinuationTarget.url,
            responseField: 'next',
          ),
        );
        final site = const SiteCompiler().compile(definition);
        final transport = _FakeTransport();
        var calls = 0;
        final executor = DefaultSiteExecutor(
          site: site,
          transport: transport,
          parser: _FakeParserEngine((_) {
            calls++;
            return ParsedPayload<List<String>>(
              data: [calls == 1 ? 'a' : 'b'],
              itemCount: 1,
              continuation: calls == 1 ? '/next?cursor=b' : null,
            );
          }),
          environment: InMemoryEnvironmentStore(),
        );
        final loader = PagedLoader<String>(
          source: SitePageSource<String>(
            executor: executor,
            endpointId: 'list',
          ),
        );

        await loader.loadInitial();
        await loader.loadNext();

        expect(transport.requests.map((request) => request.uri.toString()), [
          'https://example.test/items',
          'https://example.test/next?cursor=b',
        ]);
        expect(loader.state.items, {0: 'a', 1: 'b'});
        await loader.dispose();
      },
    );

    test(
      'maps parser payloads and replaces request inputs on refresh',
      () async {
        final site = const SiteCompiler().compile(
          _siteDefinition(
            request: RequestRule(
              method: RequestMethod.get,
              url: '/items',
              query: const {'page': '{{page}}', 'query': '{{query}}'},
            ),
          ),
        );
        final transport = _FakeTransport();
        final seenPayloads = <_MappedPayload>[];
        final executor = DefaultSiteExecutor(
          site: site,
          transport: transport,
          parser: _FakeParserEngine((_) {
            final query = transport.requests.last.uri.queryParameters['query']!;
            return ParsedPayload<_MappedPayload>(
              data: _MappedPayload([query.toUpperCase()]),
              itemCount: 1,
            );
          }),
          environment: InMemoryEnvironmentStore(),
        );
        final source = MappedSitePageSource<_MappedPayload, String>(
          executor: executor,
          endpointId: 'list',
          inputs: const {'query': 'first'},
          itemsOf: (payload) => payload.items,
          onPayload: seenPayloads.add,
        );
        final loader = PagedLoader<String>(source: source);

        await loader.loadInitial();
        source.updateInputs(const {'query': 'second'});
        await loader.refresh();

        expect(
          transport.requests.map(
            (request) => request.uri.queryParameters['query'],
          ),
          ['first', 'second'],
        );
        expect(loader.state.items, {0: 'SECOND'});
        expect(seenPayloads, hasLength(2));
        await loader.dispose();
      },
    );
  });
}

final class _MappedPayload {
  const _MappedPayload(this.items);

  final List<String> items;
}

SiteDefinition _siteDefinition({
  int schemaVersion = SiteDefinition.currentSchemaVersion,
  EndpointLinks links = const EndpointLinks(),
  RequestRule? request,
  PaginationRule pagination = const PaginationRule.pageNumber(
    variable: 'page',
    initial: 0,
    step: 1,
    pageSize: 10,
    endCondition: PageEndCondition.emptyItems,
  ),
}) {
  return SiteDefinition(
    schemaVersion: schemaVersion,
    id: 'test',
    name: 'Test',
    baseUrl: 'https://example.test/',
    parsers: [ParserRule(id: 'list-parser', kind: EndpointKind.list)],
    endpoints: [
      _endpoint(request: request, pagination: pagination, links: links),
    ],
  );
}

EndpointRule _endpoint({
  RequestRule? request,
  PaginationRule pagination = const PaginationRule.pageNumber(
    variable: 'page',
    initial: 0,
    step: 1,
    pageSize: 10,
    endCondition: PageEndCondition.emptyItems,
  ),
  EndpointLinks links = const EndpointLinks(),
}) {
  return EndpointRule(
    id: 'list',
    kind: EndpointKind.list,
    name: 'List',
    request:
        request ??
        RequestRule(
          method: RequestMethod.get,
          url: '/items',
          query: pagination is PageNumberPaginationRule
              ? {'page': '{{page}}'}
              : const {},
        ),
    parserId: 'list-parser',
    pagination: pagination,
    links: links,
  );
}

final class _FakeTransport implements HttpTransport {
  final List<ResolvedRequest> requests = [];

  @override
  Future<RawResponse> send(
    ResolvedRequest request,
    CancellationScope cancellation,
  ) async {
    cancellation.throwIfCancelled();
    requests.add(request);
    return RawResponse(statusCode: 200, body: Uint8List(0));
  }
}

final class _BlockingTransport implements HttpTransport {
  @override
  Future<RawResponse> send(
    ResolvedRequest request,
    CancellationScope cancellation,
  ) async {
    await cancellation.whenCancelled;
    cancellation.throwIfCancelled();
    throw StateError('unreachable');
  }
}

final class _FakeParserEngine implements ParserEngine {
  const _FakeParserEngine(this.handler);

  final Object Function(ParseJob<Object?> job) handler;

  @override
  Future<ParsedPayload<T>> parse<T>(
    ParseJob<T> job,
    CancellationScope cancellation,
  ) async {
    cancellation.throwIfCancelled();
    return handler(
          ParseJob<Object?>(
            endpoint: job.endpoint,
            parser: job.parser,
            response: job.response,
          ),
        )
        as ParsedPayload<T>;
  }
}

final class _RecordingEnvironmentStore implements EnvironmentStore {
  _RecordingEnvironmentStore(Map<String, Object?> initial)
    : values = Map<String, Object?>.of(initial);

  final Map<String, Object?> values;
  int applyCount = 0;

  @override
  Future<void> apply(Map<String, Object?> patch) async {
    applyCount++;
    values.addAll(patch);
  }

  @override
  Future<Map<String, Object?>> snapshot() async => Map.of(values);
}

final class _FailingEnvironmentStore implements EnvironmentStore {
  @override
  Future<void> apply(Map<String, Object?> patch) async {
    throw StateError('disk full');
  }

  @override
  Future<Map<String, Object?>> snapshot() async => const {};
}
