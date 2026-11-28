@Timeout(Duration(minutes: 10))
library;

import 'dart:convert';
import 'dart:typed_data';

import 'package:catweb/data/loading/cancellation.dart';
import 'package:catweb/data/models/ffi/result/result.dart' as model;
import 'package:catweb/data/models/gallery_models.dart';
import 'package:catweb/data/site_runtime/ehentai_debug_definition.dart';
import 'package:catweb/data/site_runtime/runtime_contracts.dart';
import 'package:catweb/data/site_runtime/rust_parser_engine.dart';
import 'package:catweb/data/site_runtime/site_definition.dart';
import 'package:catweb/network/runtime/site_session.dart';
import 'package:catweb/src/rust/api/parser.dart' as parser;
import 'package:catweb/src/rust/frb_generated.dart';
import 'package:catweb/src/rust/models/selector.dart' as native;
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:test/test.dart';

import 'native_test_support.dart';

void main() {
  setUpAll(initializeNativeParser);
  tearDownAll(RustLib.dispose);

  test(
    'FRB transfers gallery counts, nested comments and Freezed collections',
    () async {
      final result = await parser.parseGallery(
        html: '''
      <h1>Gallery</h1><b id="total">4294967296</b><article><a href="target">Link</a></article>
      <section><p>Comment</p><i>+42</i><img src="avatar.jpg"></section>
    ''',
        config: native.ParserConfig(
          selectors: {
            'title': _rule('h1'),
            'imageCount': _rule('#total'),
            'thumbnail': _rule('article'),
            'thumbnail.target': _rule('a', attribute: 'href'),
            'comment': _rule('section'),
            'comment.content': _rule('p'),
            'comment.score': _rule('i'),
            'comment.avatar.url': _rule('img', attribute: 'src'),
          },
          extras: [],
        ),
      );
      expect(result.title, 'Gallery');
      expect(result.imageCount, 4294967296);
      expect(result.previews.single.target, 'target');
      expect(result.previews.single.previewImage, isNull);
      expect(result.comments.single.score, '+42');
      expect(result.comments.single.avatar!.url, 'avatar.jpg');
      expect(result.errors, isEmpty);
      expect(result.copyWith(title: 'Changed').title, 'Changed');
      expect(() => result.previews.clear(), throwsUnsupportedError);
    },
  );

  test(
    'broken thumbnail queries fail but metadata-only galleries succeed',
    () async {
      final definition = buildEhentaiDebugDefinition('gallery-test');
      final job = _job(definition, '<h1>Metadata</h1>');
      await expectLater(
        const RustParserEngine().parse<model.DetailParserResult>(
          ParseJob(
            endpoint: job.endpoint,
            parser: job.parser.copyWith(
              config: const ParserConfig(
                selectors: {'thumbnail': SelectorRule(selector: '[[')},
              ),
            ),
            response: job.response,
          ),
          CancellationScope(),
        ),
        throwsA(isA<ParserException>()),
      );
      final metadata = await const RustParserEngine()
          .parse<model.DetailParserResult>(
            ParseJob(
              endpoint: job.endpoint,
              parser: job.parser.copyWith(
                config: const ParserConfig(
                  selectors: {'title': SelectorRule(selector: 'h1')},
                ),
              ),
              response: job.response,
            ),
            CancellationScope(),
          );
      expect(metadata.data.title, 'Metadata');
      expect(metadata.isLast, isTrue);
      expect(metadata.totalCount, isNull);
    },
  );

  test('real gallery session supports fixed page sizes, random indices and total end', () async {
    final definition = _definition();
    final adapter = _GalleryAdapter();
    final environment = InMemoryEnvironmentStore();
    final session = SiteSession(
      definition: definition,
      parser: const RustParserEngine(),
      environment: environment,
      documentDio: Dio()..httpClientAdapter = adapter,
      imageDio: Dio(),
      documentCacheOptions: CacheOptions(store: MemCacheStore()),
      imageCacheOptions: CacheOptions(store: MemCacheStore()),
      imageConcurrency: 1,
    );
    final loader = session
        .createMappedPagedLoader<model.DetailParserResult, GalleryItemModel>(
          endpointId: 'gallery',
          inputs: {'idCode': '123/token'},
          itemsOf: (payload) => GalleryPageModel(payload).items,
        );
    addTearDown(() async {
      await loader.dispose();
      await session.dispose();
    });
    await loader.loadInitial();
    expect(loader.state.failure, isNull);
    expect(adapter.requests.first.uri.path, '/g/123/token/');
    expect(loader.state.loadedCount, 2);
    expect(loader.state.totalCount, 5);
    expect(loader.state.visibleLength, 5);
    expect(await environment.snapshot(), {'token': 'saved'});
    await loader.ensureIndex(4);
    expect(loader.state.failure, isNull);
    expect(adapter.requests.last.uri.queryParameters['p'], '2');
    expect(loader.state.itemAt(4)!.idCode, 'page-4');
    expect(loader.state.itemAt(2), isNull);
    await loader.loadNext();
    expect(loader.state.failure, isNull);
    expect(adapter.requests.last.uri.queryParameters['p'], '1');
    expect(loader.state.itemAt(2)!.idCode, 'page-2');
    expect(loader.state.itemAt(3)!.previewImage?.url, isNull);
    expect(loader.state.loadedCount, 5);
    expect(loader.state.hasNext, isFalse);
    await loader.refresh();
    expect(loader.state.failure, isNull);
    expect(adapter.requests.last.uri.queryParameters['p'], '0');
    expect(loader.state.loadedCount, 2);
  });
}

native.SelectorRule _rule(String selector, {String? attribute}) =>
    native.SelectorRule(
      selector: selector,
      queryType: native.SelectorQueryType.css,
      function: attribute == null
          ? native.SelectorFunctionType.text
          : native.SelectorFunctionType.attribute,
      parameter: attribute ?? '',
      regex: '',
      replace: '',
      script: const native.SelectorScript.output(),
      defaultValue: '',
    );

ParseJob<model.DetailParserResult> _job(
  SiteDefinition definition,
  String html,
) {
  final endpoint = definition.endpoints.firstWhere(
    (endpoint) => endpoint.kind == EndpointKind.gallery,
  );
  return ParseJob(
    endpoint: endpoint,
    parser: definition.parsers.firstWhere(
      (rule) => rule.id == endpoint.parserId,
    ),
    response: RawResponse(
      statusCode: 200,
      body: Uint8List.fromList(utf8.encode(html)),
    ),
  );
}

SiteDefinition _definition() => SiteDefinition(
  schemaVersion: 2,
  id: 'gallery',
  name: 'Gallery',
  baseUrl: 'https://example.test/',
  parsers: const [
    ParserRule(
      id: 'gallery-parser',
      kind: EndpointKind.gallery,
      config: ParserConfig(
        selectors: {
          'title': SelectorRule(selector: 'h1'),
          'imageCount': SelectorRule(selector: '#total'),
          'countPerPage': SelectorRule(selector: '#size'),
          'thumbnail': SelectorRule(selector: 'a'),
          'thumbnail.target': SelectorRule(
            queryType: SelectorQueryType.self,
            function: SelectorFunctionType.attribute,
            parameter: 'href',
          ),
          'thumbnail.url': SelectorRule(
            selector: 'img',
            function: SelectorFunctionType.attribute,
            parameter: 'src',
          ),
        },
        extras: [
          ExtraSelectorRule(
            id: 'token',
            persistent: true,
            selector: SelectorRule(selector: '#token'),
          ),
        ],
      ),
    ),
  ],
  endpoints: [
    EndpointRule(
      id: 'gallery',
      kind: EndpointKind.gallery,
      name: 'Gallery',
      request: RequestRule(
        method: RequestMethod.get,
        url: '/g/{{idCode}}/',
        query: {'p': '{{page}}'},
      ),
      parserId: 'gallery-parser',
      pagination: const PaginationRule.pageNumber(
        variable: 'page',
        initial: 0,
        step: 1,
        pageSize: 2,
        endCondition: PageEndCondition.emptyItems,
      ),
    ),
  ],
);

final class _GalleryAdapter implements HttpClientAdapter {
  final requests = <RequestOptions>[];
  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    requests.add(options);
    final page = int.parse(options.uri.queryParameters['p']!);
    final previews = [
      for (
        var index = page * 2;
        index < (page == 2 ? 5 : page * 2 + 2);
        index++
      )
        '<a href="page-$index">${index == 3 ? '' : '<img src="https://images.test/$index.jpg">'}</a>',
    ].join();
    final html =
        '<h1>Gallery $page</h1><b id="total">5</b><b id="size">999</b><b id="token">saved</b>$previews';
    return ResponseBody.fromBytes(utf8.encode(html), 200);
  }

  @override
  void close({bool force = false}) {}
}
