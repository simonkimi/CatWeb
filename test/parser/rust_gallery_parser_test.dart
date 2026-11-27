@Timeout(Duration(minutes: 10))
library;

import 'dart:convert';
import 'dart:io';
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
    'E-Hentai template parses offline large thumbnails and complete metadata',
    () async {
      final result = await _parseFixture('gallery_large.html');
      final data = result.data;
      expect(data.title, 'Offline gallery');
      expect(data.subtitle, 'Uploader');
      expect(data.language, 'English');
      expect(data.uploadTime, '2026-11-27');
      expect(data.description, 'Uploader description');
      expect(data.star, 4.75);
      expect(data.imageCount, 3);
      expect(data.pageCount, 2);
      expect(data.countPrePage, 40);
      expect(data.coverImage!.url, 'https://images.test/cover.jpg');
      expect(data.tags!.single.text, 'Manga');
      expect(data.badges!.map((tag) => tag.text), ['tag one', 'tag two']);
      expect(data.badges!.first.category, 'female');
      expect(data.previews, hasLength(2));
      expect(data.previews![0].target, 'one/123-1');
      expect(data.previews![1].target, 'two/123-2');
      final image = data.previews![0].previewImage!;
      expect(image.url, 'https://images.test/one.jpg');
      expect([image.width, image.height, image.x, image.y], [100, 140, 0, 0]);
      expect(data.previews![1].previewImage!.width, 120);
      expect(data.comments!.map((comment) => comment.username), [
        'Alice',
        'Bob',
      ]);
      expect(data.comments!.first.time, '27 November 2026');
      expect(data.comments!.last.score, '-3');
      expect(data.comments!.first.avatar!.url, 'https://images.test/alice.jpg');
      expect(result.totalCount, 3);
      expect(result.itemCount, 2);
      expect(result.continuation, '?p=1');
      expect(
        data.errors.where((error) => error.code == 1 || error.code == 3),
        isEmpty,
      );
    },
  );

  test(
    'sprite geometry, last pages and missing image positions remain intact',
    () async {
      final payload = await _parseFixture('gallery_sprite.html');
      final previews = payload.data.previews!;
      expect(previews, hasLength(3));
      final first = previews[0].previewImage!;
      expect(first.url, 'https://images.test/sprite.jpg');
      expect(
        [first.width, first.height, first.x, first.y],
        [100, 140, 200, 10],
      );
      final second = previews[1].previewImage!;
      expect(second.url, 'https://images.test/sprite2.jpg');
      expect(
        [second.width, second.height, second.x, second.y],
        [110, 150, 300, 20],
      );
      expect(previews[2].target, 'missing/123-5');
      expect(previews[2].previewImage?.url, isNull);
      expect(payload.continuation, isNull);
      expect(
        payload.data.errors.where(
          (error) => error.code == 1 || error.code == 3,
        ),
        isEmpty,
      );
    },
  );

  test(
    'legacy normal thumbnails prefer the sprite over a blank image',
    () async {
      final payload = await _parseFixture('gallery_normal.html');
      final first = payload.data.previews!.first;
      expect(first.target, 'three/123-3');
      expect(first.previewImage!.url, 'https://images.test/normal.jpg');
      expect(
        [
          first.previewImage!.width,
          first.previewImage!.height,
          first.previewImage!.x,
          first.previewImage!.y,
        ],
        [100, 140, 200, 10],
      );
    },
  );

  test(
    'failed pages and broken thumbnail queries become parser failures',
    () async {
      await expectLater(
        _parseFixture('gallery_failed.html'),
        throwsA(
          isA<ParserException>().having(
            (error) => error.message,
            'message',
            contains('IP address has'),
          ),
        ),
      );
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

Future<ParsedPayload<model.DetailParserResult>> _parseFixture(String name) =>
    const RustParserEngine().parse(
      _job(
        buildEhentaiDebugDefinition('gallery-test'),
        File('test/parser/testdata/$name').readAsStringSync(),
      ),
      CancellationScope(),
    );

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
