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
  test(
    'maps complete reader results and publishes one nonpaginated item',
    () async {
      final result = _result().copyWith(
        largerImage: const native.ImageResult(url: 'large'),
        rawImage: const native.ImageResult(url: 'raw'),
        uploadTime: 'Today',
        source: 'Source',
        rating: 'explicit',
        score: 4.5,
        tags: const [
          native.TagResult(text: 'Tag', category: 'Group', color: '#123'),
        ],
        badges: const [native.TagResult(text: 'Badge')],
        comments: const [
          native.CommentResult(
            username: 'Alice',
            content: 'Text',
            time: 'Now',
            score: '+12',
            avatar: native.ImageResult(
              url: 'avatar',
              cacheKey: 'avatar-key',
              width: 10,
              height: 20,
              x: 1,
              y: 2,
            ),
          ),
        ],
        isSuccess: true,
        envs: const [
          native.EnvResult(id: 'token', global: true, value: 'saved'),
          native.EnvResult(id: 'local', global: false, value: 'context'),
          native.EnvResult(id: 'missing', global: true),
        ],
        errors: const [
          native_error.ParseError(code: 1, message: 'comment: invalid CSS'),
        ],
      );
      final engine = RustParserEngine(
        readerParser: ({required html, required config}) async {
          expect(config.selectors['image.url']!.selector, '#img');
          return result;
        },
      );
      final payload = await engine.parse(
        _job(
          config: const ParserConfig(
            selectors: {'image.url': SelectorRule(selector: '#img')},
          ),
        ),
        CancellationScope(),
      );
      final data = payload.data;
      expect(
        data.image,
        const model.ImageResult(
          url: 'normal',
          cacheKey: 'key',
          width: 100,
          height: 200,
          x: 1,
          y: 2,
        ),
      );
      expect(data.largerImage!.url, 'large');
      expect(data.rawImage!.url, 'raw');
      expect(
        [data.uploadTime, data.source, data.rating],
        ['Today', 'Source', 'explicit'],
      );
      expect(data.score, 4.5);
      expect(
        data.tags!.single,
        const model.TagResult(text: 'Tag', category: 'Group', color: '#123'),
      );
      expect(data.badges!.single.text, 'Badge');
      expect(
        data.comments!.single,
        const model.CommentResult(
          username: 'Alice',
          content: 'Text',
          time: 'Now',
          score: '+12',
          avatar: model.ImageResult(
            url: 'avatar',
            cacheKey: 'avatar-key',
            width: 10,
            height: 20,
            x: 1,
            y: 2,
          ),
        ),
      );
      expect(data.isSuccess, isTrue);
      expect(data.failMessage, isNull);
      expect(data.errors.single.message, 'comment: invalid CSS');
      expect(data.envs, hasLength(3));
      expect(payload.itemCount, 1);
      expect(payload.isLast, isTrue);
      expect(payload.totalCount, isNull);
      expect(payload.continuation, isNull);
      expect(payload.environment.global, {'token': 'saved'});
      expect(payload.environment.local, {'local': 'context'});
    },
  );

  test('failures, unmatched success and all missing URLs fail before environment commit', () async {
    final results = [
      _result().copyWith(failMessage: 'Blocked'),
      _result().copyWith(failMessage: ''),
      _result().copyWith(isSuccess: false),
      _result().copyWith(image: null),
      _result().copyWith(
        image: const native.ImageResult(width: 20),
        largerImage: const native.ImageResult(url: ''),
        rawImage: const native.ImageResult(url: '  '),
      ),
    ];
    for (final result in results) {
      final job = _job();
      final environment = InMemoryEnvironmentStore({'token': 'old'});
      final executor = DefaultSiteExecutor(
        site: const SiteCompiler().compile(
          SiteDefinition(
            schemaVersion: 2,
            id: 'reader',
            name: 'Reader',
            baseUrl: 'https://example.test/',
            parsers: [job.parser],
            endpoints: [job.endpoint],
          ),
        ),
        parser: _engine(
          result.copyWith(
            envs: const [
              native.EnvResult(id: 'token', global: true, value: 'bad'),
            ],
          ),
        ),
        transport: _Transport(),
        environment: environment,
      );
      await expectLater(
        executor.execute<model.ImageReaderResult>(
          SiteOperation(endpointId: 'reader'),
          CancellationScope(),
        ),
        throwsA(isA<ParserException>()),
      );
      expect(await environment.snapshot(), {'token': 'old'});
    }
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
    // An untouched editor placeholder is not a required success rule.
    await _engine(_result()).parse(
      _job(config: const ParserConfig(selectors: {'success': SelectorRule()})),
      CancellationScope(),
    );
  });

  test(
    'other image qualities remain usable when optional extraction fails',
    () async {
      for (final result in [
        _result().copyWith(
          image: null,
          largerImage: const native.ImageResult(url: 'large'),
        ),
        _result().copyWith(
          image: const native.ImageResult(width: 20),
          rawImage: const native.ImageResult(url: 'raw'),
        ),
      ]) {
        final payload = await _engine(
          result.copyWith(
            errors: const [
              native_error.ParseError(
                code: 1,
                message: 'image.url: invalid CSS',
              ),
              native_error.ParseError(
                code: 3,
                message: 'score: invalid number',
              ),
            ],
          ),
        ).parse(_job(), CancellationScope());
        expect(payload.data.errors, hasLength(2));
        expect(payload.isLast, isTrue);
      }
    },
  );

  test('reader errors are wrapped and cancellation discards late results and errors', () async {
    const error = native_error.ParseError(code: 1, message: 'native failure');
    await expectLater(
      RustParserEngine(
        readerParser: ({required html, required config}) async => throw error,
      ).parse(_job(), CancellationScope()),
      throwsA(
        isA<ParserException>().having((e) => e.cause, 'cause', same(error)),
      ),
    );
    for (final fail in [false, true]) {
      final pending = Completer<native.ImageReaderResult>();
      var calls = 0;
      final engine = RustParserEngine(
        readerParser: ({required html, required config}) {
          calls++;
          return pending.future;
        },
      );
      await expectLater(
        engine.parse(_job(), CancellationScope()..cancel()),
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
      if (fail) {
        pending.completeError(error);
      } else {
        pending.complete(_result());
      }
      await expectation;
    }
    final job = _job();
    await expectLater(
      _engine(_result()).parse(
        ParseJob<String>(
          endpoint: job.endpoint,
          parser: job.parser,
          response: job.response,
        ),
        CancellationScope(),
      ),
      throwsA(isA<SiteRuntimeException>()),
    );
  });
}

RustParserEngine _engine(native.ImageReaderResult result) => RustParserEngine(
  readerParser: ({required html, required config}) async => result,
);
native.ImageReaderResult _result() => const native.ImageReaderResult(
  image: native.ImageResult(
    url: 'normal',
    cacheKey: 'key',
    width: 100,
    height: 200,
    x: 1,
    y: 2,
  ),
  tags: [],
  badges: [],
  comments: [],
  envs: [],
  errors: [],
);
ParseJob<model.ImageReaderResult> _job({
  ParserConfig config = const ParserConfig(),
}) => ParseJob(
  endpoint: EndpointRule(
    id: 'reader',
    name: 'Reader',
    kind: EndpointKind.reader,
    request: RequestRule(method: RequestMethod.get, url: '/reader'),
    parserId: 'reader-parser',
    pagination: const PaginationRule.none(),
  ),
  parser: ParserRule(
    id: 'reader-parser',
    kind: EndpointKind.reader,
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
