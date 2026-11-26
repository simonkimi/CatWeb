@Timeout(Duration(minutes: 10))
library;

import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';

import 'package:catweb/data/loading/cancellation.dart';
import 'package:catweb/data/loading/paged_loader.dart';
import 'package:catweb/data/models/ffi/result/result.dart' as model;
import 'package:catweb/data/models/subpage_models.dart';
import 'package:catweb/data/site_runtime/ehentai_debug_definition.dart';
import 'package:catweb/data/site_runtime/runtime_contracts.dart';
import 'package:catweb/data/site_runtime/rust_parser_engine.dart';
import 'package:catweb/data/site_runtime/site_definition.dart';
import 'package:catweb/data/site_runtime/site_page_source.dart';
import 'package:catweb/network/runtime/dio_http_transport.dart';
import 'package:catweb/network/runtime/site_session.dart';
import 'package:catweb/src/rust/api/parser.dart' as parser;
import 'package:catweb/src/rust/errors.dart' as native_errors;
import 'package:catweb/src/rust/frb_generated.dart';
import 'package:catweb/src/rust/models/selector.dart' as native;
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart'
    show ExternalLibrary;
import 'package:test/test.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

native.SelectorRule rule(
  String selector, {
  native.SelectorQueryType queryType = native.SelectorQueryType.css,
  native.SelectorFunctionType function = native.SelectorFunctionType.text,
  String parameter = '',
  String regex = '',
  native.SelectorScript script = const native.SelectorScript.output(),
}) => native.SelectorRule(
  selector: selector,
  queryType: queryType,
  function: function,
  parameter: parameter,
  regex: regex,
  replace: '',
  script: script,
  defaultValue: '',
);

void main() {
  setUpAll(() async {
    // Build the actual host library so this test never silently uses a mock or
    // an outdated binary. Cargo reuses incremental artifacts on later runs.
    final build = await Process.run('cargo', [
      'build',
      '--locked',
      '--manifest-path',
      'rust/Cargo.toml',
    ]);
    if (build.exitCode != 0) {
      throw StateError('Native test build failed:\n${build.stderr}');
    }
    final target = Directory(
      Platform.environment['CARGO_TARGET_DIR'] ?? 'rust/target',
    ).absolute.path;
    final name = Platform.isWindows
        ? 'rust_lib_catweb.dll'
        : Platform.isMacOS
        ? 'librust_lib_catweb.dylib'
        : 'librust_lib_catweb.so';
    await RustLib.init(
      externalLibrary: ExternalLibrary.open('$target/debug/$name'),
    );
  });

  tearDownAll(RustLib.dispose);

  test(
    'typed FRB call transfers nested lists, scripts and environment',
    () async {
      final result = await parser.parseList(
        html: '''
        <p id="token">secret</p><a href="/next">Next</a>
        <li><b>first</b><em>3.5</em><span>4294967296 pages</span>
          <img src="/fallback" data-src="/one"><i>A</i><small>Badge</small></li>
        <li><b>second</b><em>4.5</em><span>2 pages</span>
          <img src="/two"><i>B</i></li>
      ''',
        config: native.ParserConfig(
          selectors: {
            'item': rule('li'),
            'title': rule(
              'b',
              script: const native.SelectorScript.replace(
                values: {'first': '第一条', 'second': '第二条'},
              ),
            ),
            'rating': rule(
              'em',
              script: const native.SelectorScript.javaScript(
                source: 'Number(\$arg) + 0.25',
              ),
            ),
            'imageCount': rule('span', regex: r'\d+'),
            'preview.url': rule(
              'img',
              function: native.SelectorFunctionType.attribute,
              parameter: 'data-src,src',
            ),
            'tag': rule('i'),
            'badge': rule('small'),
            'nextPage': rule(
              'a',
              function: native.SelectorFunctionType.attribute,
              parameter: 'href',
            ),
          },
          extras: [
            native.ExtraSelectorRule(
              id: 'token',
              persistent: true,
              selector: rule('#token'),
            ),
          ],
        ),
      );

      expect(result.errors, isEmpty);
      expect(result.items.map((item) => item.title), ['第一条', '第二条']);
      expect(result.items.first.star, 3.75);
      expect(result.items.first.imageCount, 4294967296);
      expect(result.items.first.previewImage?.url, '/one');
      expect(result.items.last.previewImage?.url, '/two');
      expect(result.items.last.tags.single.text, 'B');
      expect(result.items.first.badges.single.text, 'Badge');
      expect(result.items.last.badges, isEmpty);
      expect(result.nextPage, '/next');
      expect(result.isSuccess, isNull);
      expect(result.envs.single.id, 'token');
      expect(result.envs.single.global, isTrue);
      expect(result.envs.single.value, 'secret');
    },
  );

  test('field diagnostics cross FRB without discarding the item', () async {
    final result = await parser.parseList(
      html: '<li><b>Keep</b><em>invalid number</em></li>',
      config: native.ParserConfig(
        selectors: {
          'item': rule('li'),
          'title': rule('b'),
          'rating': rule('em'),
        },
        extras: [],
      ),
    );
    expect(result.items.single.title, 'Keep');
    expect(result.items.single.star, isNull);
    expect(result.errors.single.code, 3);
    expect(result.errors.single.message, startsWith('items[0].rating:'));
  });

  test('fatal configuration errors cross FRB with code and message', () async {
    await expectLater(
      parser.parseList(
        html: '<li>Item</li>',
        config: const native.ParserConfig(selectors: {}, extras: []),
      ),
      throwsA(
        isA<native_errors.ParseError>()
            .having((error) => error.code, 'code', 1)
            .having((error) => error.message, 'message', startsWith('item:')),
      ),
    );
  });

  test(
    'current E-Hentai rules reach the Flutter list models through Rust',
    () async {
      final definition = buildEhentaiDebugDefinition('eh-test');
      final endpoint = definition.endpoints.firstWhere(
        (rule) => rule.id == 'eh-home',
      );
      final parserRule = definition.parsers.firstWhere(
        (rule) => rule.id == endpoint.parserId,
      );
      final result = await const RustParserEngine()
          .parse<model.ListParserResult>(
            ParseJob(
              endpoint: endpoint,
              parser: parserRule,
              response: RawResponse(
                statusCode: 200,
                body: File('test/parser/testdata/list_html.html')
                    .readAsBytesSync(),
              ),
            ),
            CancellationScope(),
          );
      expect(result.itemCount, 25);
      expect(
        result.data.items!.first.title,
        'Alis Yume cosplay - Savage Arknight',
      );
      expect(result.data.items![0].imageCount, 18);
      expect(result.data.items![1].imageCount, 40);
      expect(result.data.items![0].star, 1.5);
      expect(result.data.items![1].star, 5);
      expect(
        result.data.items![1].previewImage!.url,
        startsWith('https://ehgt.org/4f/2e/'),
      );
      expect(result.continuation, 'https://e-hentai.org/?next=3099159');
      expect(
        result.data.items!.map(ListItemModel.new).first.idCode,
        '3099188/0e6cda8513',
      );
    },
  );

  test(
    'session loads lists, next pages and search refreshes with the real parser',
    () async {
      final adapter = _ListAdapter();
      final documentDio = Dio()..httpClientAdapter = adapter;
      final environment = InMemoryEnvironmentStore({'token': 'initial-token'});
      final definition = _listDefinition();
      final session = SiteSession(
        definition: definition,
        parser: const RustParserEngine(),
        environment: environment,
        documentDio: documentDio,
        imageDio: Dio(),
        documentCacheOptions: CacheOptions(store: MemCacheStore()),
        imageCacheOptions: CacheOptions(store: MemCacheStore()),
        imageConcurrency: 1,
      );
      final source =
          MappedSitePageSource<model.ListParserResult, ListItemModel>(
            executor: session.executor,
            endpointId: 'list',
            context: RequestContext({'local': 'initial-local'}),
            inputs: const {'search': ''},
            itemsOf: (result) => result.items!.map(ListItemModel.new).toList(),
          );
      final loader = PagedLoader<ListItemModel>(
        source: source,
        failureMapper: const SiteRuntimeFailureMapper(),
      );
      addTearDown(() async {
        await loader.dispose();
        await session.dispose();
      });

      await loader.loadInitial();
      expect(loader.state.failure, isNull);
      expect(loader.state.loadedCount, 2);
      expect(loader.state.itemAt(0)!.previewModel.title, 'First');
      expect(loader.state.itemAt(1)!.previewModel.title, 'Second');
      expect(
        loader.state.itemAt(0)!.previewImage!.url,
        'https://images.test/one.jpg',
      );
      expect(loader.state.itemAt(1)!.previewImage?.url, isNull);
      expect(loader.state.hasNext, isTrue);
      expect(adapter.requests.first.uri.queryParameters, {
        'q': '',
        'local': 'initial-local',
      });
      expect(adapter.requests.first.headers['x-token'], 'initial-token');
      expect(await environment.snapshot(), {'token': 'new-token'});

      await loader.loadNext();
      expect(loader.state.failure, isNull);
      expect(loader.state.loadedCount, 2);
      expect(loader.state.hasNext, isFalse);
      expect(adapter.requests.last.uri.path, '/second');
      expect(adapter.requests.last.uri.queryParameters['local'], 'page-local');
      expect(adapter.requests.last.headers['x-token'], 'new-token');
      expect(await environment.snapshot(), {'token': 'new-token'});

      source.updateInputs({'search': 'cat'});
      await loader.refresh();
      expect(loader.state.failure, isNull);
      expect(adapter.requests.last.uri.path, '/items');
      expect(adapter.requests.last.uri.queryParameters, {
        'q': 'cat',
        'local': 'initial-local',
      });
      expect(loader.state.itemAt(0)!.previewModel.title, 'cat');
      expect(loader.state.loadedCount, 2);
      source.updateInputs({'search': ''});
      await loader.refresh();
      expect(loader.state.failure, isNull);
      expect(adapter.requests.last.uri.queryParameters['q'], '');
      expect(loader.state.itemAt(0)!.previewModel.title, 'First');
    },
  );
}

SiteDefinition _listDefinition() => SiteDefinition(
  schemaVersion: 2,
  id: 'native-list',
  name: 'Native list',
  baseUrl: 'https://example.test/',
  parsers: const [
    ParserRule(
      id: 'list-parser',
      kind: EndpointKind.list,
      config: ParserConfig(
        selectors: {
          'item': SelectorRule(selector: 'li'),
          'title': SelectorRule(selector: 'b'),
          'idCode': SelectorRule(
            queryType: SelectorQueryType.self,
            function: SelectorFunctionType.attribute,
            parameter: 'data-id',
          ),
          'preview.url': SelectorRule(
            selector: 'img',
            function: SelectorFunctionType.attribute,
            parameter: 'src',
          ),
          'nextPage': SelectorRule(
            selector: '#next',
            function: SelectorFunctionType.attribute,
            parameter: 'href',
          ),
          'success': SelectorRule(selector: '#ok'),
        },
        extras: [
          ExtraSelectorRule(
            id: 'token',
            persistent: true,
            selector: SelectorRule(selector: '#token'),
          ),
          ExtraSelectorRule(
            id: 'local',
            selector: SelectorRule(selector: '#local'),
          ),
        ],
      ),
    ),
  ],
  endpoints: [
    EndpointRule(
      id: 'list',
      kind: EndpointKind.list,
      name: 'List',
      request: RequestRule(
        method: RequestMethod.get,
        url: '/items',
        query: {'q': '{{search}}', 'local': '{{local}}'},
        headers: {'x-token': '{{token}}'},
      ),
      parserId: 'list-parser',
      pagination: const PaginationRule.continuation(
        target: ContinuationTarget.url,
        responseField: 'nextPage',
      ),
    ),
  ],
);

final class _ListAdapter implements HttpClientAdapter {
  final requests = <RequestOptions>[];

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    requests.add(options);
    final query = options.uri.queryParameters['q'] ?? '';
    final html = options.uri.path == '/second'
        ? '<p id="ok">OK</p>'
        : '''
      <p id="ok">OK</p><p id="token">new-token</p><p id="local">page-local</p>
      <a id="next" href="/second">Next</a>
      <li data-id="one"><b>${query.isEmpty ? 'First' : query}</b><img src="https://images.test/one.jpg"></li>
      <li data-id="two"><b>Second</b></li>
    ''';
    return ResponseBody.fromBytes(
      utf8.encode(html),
      200,
      headers: {
        Headers.contentTypeHeader: ['text/html; charset=utf-8'],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}
