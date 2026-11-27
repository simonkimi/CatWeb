import 'dart:async';
import 'dart:typed_data';

import 'package:catweb/data/loading/cancellation.dart';
import 'package:catweb/data/models/ffi/result/base.dart' as model;
import 'package:catweb/data/models/ffi/result/result.dart' as model;
import 'package:catweb/data/site_runtime/runtime_contracts.dart';
import 'package:catweb/data/site_runtime/rust_parser_engine.dart';
import 'package:catweb/data/site_runtime/site_compiler.dart';
import 'package:catweb/data/site_runtime/site_definition.dart';
import 'package:catweb/data/site_runtime/site_executor.dart';
import 'package:catweb/src/rust/errors.dart' as native_error;
import 'package:catweb/src/rust/models/result.dart' as native;
import 'package:test/test.dart';

void main() {
  test('maps gallery metadata, previews and complete comments to existing UI models', () async {
    final result =
        _result(
          title: 'Title',
          previews: const [
            native.GalleryPreviewItem(target: 'target'),
            native.GalleryPreviewItem(),
          ],
        ).copyWith(
          subtitle: 'Subtitle',
          language: 'EN',
          uploadTime: 'Today',
          description: 'Description',
          imageCount: 100,
          pageCount: 5,
          countPerPage: 20,
          star: 4.5,
          coverImage: const native.ImageResult(
            url: 'cover',
            cacheKey: 'key',
            width: 100,
            height: 80,
            x: 1,
            y: 2,
          ),
          tags: const [
            native.TagResult(text: 'Tag', color: '#123456', category: 'group'),
          ],
          badges: const [native.TagResult(text: 'Badge')],
          comments: const [
            native.CommentResult(
              username: 'Alice',
              content: 'Text',
              time: 'Now',
              score: '+12',
              avatar: native.ImageResult(url: 'avatar'),
            ),
          ],
          envs: const [
            native.EnvResult(id: 'token', global: true, value: 'value'),
            native.EnvResult(id: 'missing', global: true),
            native.EnvResult(id: 'local', global: false, value: 'patch'),
          ],
          errors: const [
            native_error.ParseError(
              code: 2,
              message: 'previews[0].thumbnail.url: missing',
            ),
          ],
          nextPage: '?p=1',
          isSuccess: true,
        );
    final payload = await _engine(result).parse(_job(), CancellationScope());
    final data = payload.data;
    expect(data.title, 'Title');
    expect(data.subtitle, 'Subtitle');
    expect(data.language, 'EN');
    expect(data.uploadTime, 'Today');
    expect(data.description, 'Description');
    expect([data.imageCount, data.pageCount, data.countPrePage], [100, 5, 20]);
    expect(data.star, 4.5);
    expect(
      data.coverImage,
      const model.ImageResult(
        url: 'cover',
        cacheKey: 'key',
        width: 100,
        height: 80,
        x: 1,
        y: 2,
      ),
    );
    expect(data.previews!.map((preview) => preview.target), ['target', null]);
    expect(data.previews![0].previewImage, isNull);
    expect(
      data.tags!.single,
      const model.TagResult(text: 'Tag', color: '#123456', category: 'group'),
    );
    expect(data.badges!.single.text, 'Badge');
    expect(
      data.comments!.single,
      const model.CommentResult(
        username: 'Alice',
        content: 'Text',
        time: 'Now',
        score: '+12',
        avatar: model.ImageResult(url: 'avatar'),
      ),
    );
    expect(payload.totalCount, 100);
    expect(payload.itemCount, 2);
    expect(payload.isLast, isNull);
    expect(payload.continuation, '?p=1');
    expect(payload.environment.global, {'token': 'value'});
    expect(payload.environment.local, {'local': 'patch'});
    expect(data.errors.single.code, 2);
  });

  test(
    'metadata-only galleries do not publish nonexistent preview indices',
    () async {
      for (final config in [
        const ParserConfig(),
        const ParserConfig(
          selectors: {
            'thumbnail': SelectorRule(queryType: SelectorQueryType.xpath),
          },
        ),
      ]) {
        final payload = await _engine(
          _result().copyWith(imageCount: 100, nextPage: '/next'),
        ).parse(_job(config: config), CancellationScope());
        expect(payload.totalCount, isNull);
        expect(payload.itemCount, 0);
        expect(payload.isLast, isTrue);
        expect(payload.data.imageCount, 100);
      }
      final payload = await _engine(_result())
          .parse(_job(), CancellationScope());
      expect(payload.isLast, isNull);
    },
  );

  test('thumbnail syntax errors and page failures fail but comment diagnostics do not', () async {
    for (final result in [
      _result().copyWith(failMessage: 'Blocked'),
      _result().copyWith(isSuccess: false),
      _result().copyWith(
        errors: const [
          native_error.ParseError(code: 1, message: 'thumbnail: invalid CSS'),
        ],
      ),
    ]) {
      await expectLater(
        _engine(result).parse(_job(), CancellationScope()),
        throwsA(isA<ParserException>()),
      );
    }
    final payload = await _engine(
      _result().copyWith(
        errors: const [
          native_error.ParseError(code: 1, message: 'comment: invalid CSS'),
        ],
      ),
    ).parse(_job(), CancellationScope());
    expect(payload.data.errors.single.message, 'comment: invalid CSS');
    await expectLater(
      _engine(_result()).parse(
        _job(
          config: const ParserConfig(
            selectors: {'success': SelectorRule(selector: '#ok')},
          ),
        ),
        CancellationScope(),
      ),
      throwsA(isA<ParserException>()),
    );
  });

  test(
    'gallery native errors are wrapped and cancellation discards late results',
    () async {
      const error = native_error.ParseError(code: 1, message: 'native failure');
      await expectLater(
        RustParserEngine(
          galleryParser: ({required html, required config}) async =>
              throw error,
        ).parse(_job(), CancellationScope()),
        throwsA(
          isA<ParserException>().having(
            (value) => value.cause,
            'cause',
            same(error),
          ),
        ),
      );
      final pending = Completer<native.GalleryParserResult>();
      var calls = 0;
      final engine = RustParserEngine(
        galleryParser: ({required html, required config}) {
          calls++;
          return pending.future;
        },
      );
      final cancelled = CancellationScope()..cancel();
      await expectLater(
        engine.parse(_job(), cancelled),
        throwsA(isA<CancellationException>()),
      );
      expect(calls, 0);
      final scope = CancellationScope();
      final future = engine.parse(_job(), scope);
      final expectation = expectLater(
        future,
        throwsA(isA<CancellationException>()),
      );
      scope.cancel();
      pending.complete(
        _result().copyWith(
          envs: const [
            native.EnvResult(id: 'token', global: true, value: 'late'),
          ],
        ),
      );
      await expectation;
    },
  );

  test('failed gallery pages cannot commit environment changes', () async {
    final job = _job();
    final environment = InMemoryEnvironmentStore({'token': 'old'});
    final executor = DefaultSiteExecutor(
      site: const SiteCompiler().compile(
        SiteDefinition(
          schemaVersion: 2,
          id: 'gallery',
          name: 'Gallery',
          baseUrl: 'https://example.test/',
          parsers: [job.parser],
          endpoints: [job.endpoint],
        ),
      ),
      parser: _engine(
        _result().copyWith(
          failMessage: 'Blocked',
          envs: const [
            native.EnvResult(id: 'token', global: true, value: 'bad'),
          ],
        ),
      ),
      transport: _Transport(),
      environment: environment,
    );
    await expectLater(
      executor.execute<model.DetailParserResult>(
        SiteOperation(endpointId: 'gallery'),
        CancellationScope(),
      ),
      throwsA(isA<ParserException>()),
    );
    expect(await environment.snapshot(), {'token': 'old'});
  });
}

RustParserEngine _engine(native.GalleryParserResult result) => RustParserEngine(
  galleryParser: ({required html, required config}) async => result,
);
native.GalleryParserResult _result({
  String? title,
  List<native.GalleryPreviewItem> previews = const [],
}) => native.GalleryParserResult(
  title: title,
  previews: previews,
  tags: [],
  badges: [],
  comments: [],
  envs: [],
  errors: [],
);
ParseJob<model.DetailParserResult> _job({
  ParserConfig config = const ParserConfig(
    selectors: {'thumbnail': SelectorRule(selector: 'a')},
  ),
}) => ParseJob(
  endpoint: EndpointRule(
    id: 'gallery',
    name: 'Gallery',
    kind: EndpointKind.gallery,
    request: RequestRule(method: RequestMethod.get, url: '/gallery'),
    parserId: 'gallery-parser',
    pagination: const PaginationRule.none(),
  ),
  parser: ParserRule(
    id: 'gallery-parser',
    kind: EndpointKind.gallery,
    config: config,
  ),
  response: RawResponse(statusCode: 200, body: Uint8List(0)),
);

final class _Transport implements HttpTransport {
  @override
  Future<RawResponse> send(
    ResolvedRequest request,
    CancellationScope cancellation,
  ) async => RawResponse(statusCode: 200, body: Uint8List(0));
}
