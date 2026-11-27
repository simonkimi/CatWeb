import 'dart:async';
import 'dart:convert';
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
import 'package:catweb/src/rust/models/result.dart' as native_result;
import 'package:catweb/src/rust/models/selector.dart' as native;
import 'package:test/test.dart';

void main() {
  test(
    'maps current rule enums, all script variants and extras to FRB',
    () async {
      final config = ParserConfig(
        selectors: {
          'item': const SelectorRule(selector: 'li'),
          'title': const SelectorRule(
            queryType: SelectorQueryType.self,
            function: SelectorFunctionType.raw,
            regex: '(.*)',
            replace: r'$1',
            defaultValue: 'fallback',
          ),
          'language': const SelectorRule(
            selector: './/b/@lang',
            queryType: SelectorQueryType.xpath,
            function: SelectorFunctionType.attribute,
            parameter: 'lang',
            script: SelectorScript.replace(values: {'english': 'EN'}),
          ),
          'subtitle': const SelectorRule(
            selector: r'$.title',
            queryType: SelectorQueryType.jsonPath,
            script: SelectorScript.javaScript(source: r'$arg.toUpperCase()'),
          ),
        },
        extras: const [
          ExtraSelectorRule(
            id: 'token',
            persistent: true,
            selector: SelectorRule(selector: '#token'),
          ),
        ],
      );
      var calls = 0;
      final engine = RustParserEngine(
        listParser: ({required html, required config}) async {
          calls++;
          expect(html, '<li>中文</li>');
          expect(
            config.selectors['item']!.queryType,
            native.SelectorQueryType.css,
          );
          expect(
            config.selectors['item']!.script,
            const native.SelectorScript.output(),
          );
          final title = config.selectors['title']!;
          expect(title.queryType, native.SelectorQueryType.this_);
          expect(title.function, native.SelectorFunctionType.raw);
          expect(title.regex, '(.*)');
          expect(title.replace, r'$1');
          expect(title.defaultValue, 'fallback');
          final language = config.selectors['language']!;
          expect(language.queryType, native.SelectorQueryType.xpath);
          expect(language.function, native.SelectorFunctionType.attribute);
          expect(language.parameter, 'lang');
          expect(
            language.script,
            const native.SelectorScript.replace(values: {'english': 'EN'}),
          );
          expect(
            config.selectors['subtitle']!.queryType,
            native.SelectorQueryType.jsonPath,
          );
          expect(
            config.selectors['subtitle']!.script,
            const native.SelectorScript.javaScript(
              source: r'$arg.toUpperCase()',
            ),
          );
          expect(config.extras.single.id, 'token');
          expect(config.extras.single.persistent, isTrue);
          expect(config.extras.single.selector.selector, '#token');
          return _result();
        },
      );
      await engine.parse(_job(config: config), CancellationScope());
      expect(calls, 1);
    },
  );

  test(
    'maps every result field and separates valid environment patches',
    () async {
      const image = native_result.ImageResult(
        url: '/image',
        cacheKey: 'cache',
        width: 100,
        height: 80,
        x: -4,
        y: 5,
      );
      const tag = native_result.TagResult(
        text: 'Tag',
        color: '#123456',
        category: 'category',
      );
      final engine = _engine(
        _result(
          items: const [
            native_result.ListParserResultItem(
              title: 'Title',
              subtitle: 'Subtitle',
              uploadTime: 'Today',
              star: 4.5,
              imageCount: 42,
              previewImage: image,
              badges: [tag],
              tags: [tag],
              language: 'EN',
              idCode: 'id',
              paper: 'paper',
            ),
            native_result.ListParserResultItem(badges: [], tags: []),
          ],
          nextPage: '/next',
          isSuccess: true,
          envs: const [
            native_result.EnvResult(id: 'token', global: true, value: 'new'),
            native_result.EnvResult(
              id: 'cursor',
              global: false,
              value: 'local',
            ),
            native_result.EnvResult(id: 'keep', global: true),
            native_result.EnvResult(id: '', global: true, value: 'ignore'),
            native_result.EnvResult(id: 'empty', global: false, value: ''),
          ],
          errors: const [
            native_error.ParseError(
              code: 3,
              message: 'items[0].rating: invalid',
            ),
          ],
        ),
      );
      final payload = await engine.parse(_job(), CancellationScope());
      final result = payload.data;
      final item = result.items!.first;
      expect(
        item,
        const model.ListParserResultItem(
          title: 'Title',
          subtitle: 'Subtitle',
          uploadTime: 'Today',
          star: 4.5,
          imageCount: 42,
          previewImage: model.ImageResult(
            url: '/image',
            cacheKey: 'cache',
            width: 100,
            height: 80,
            x: -4,
            y: 5,
          ),
          badges: [
            model.TagResult(
              text: 'Tag',
              color: '#123456',
              category: 'category',
            ),
          ],
          tags: [
            model.TagResult(
              text: 'Tag',
              color: '#123456',
              category: 'category',
            ),
          ],
          language: 'EN',
          idCode: 'id',
          paper: 'paper',
        ),
      );
      expect(result.items!.last.previewImage, isNull);
      expect(result.items!.last.tags, isEmpty);
      expect(result.items!.last.badges, isEmpty);
      expect(result.isSuccess, isTrue);
      expect(result.nextPage, '/next');
      expect(result.failMessage, isNull);
      expect(result.errors.single.code, 3);
      expect(
        result.envs.first,
        const model.EnvResult(id: 'token', global: true, value: 'new'),
      );
      expect(payload.continuation, '/next');
      expect(payload.itemCount, 2);
      expect(payload.isLast, isNull);
      expect(payload.environment.global, {'token': 'new'});
      expect(payload.environment.local, {'cursor': 'local', 'empty': ''});
    },
  );

  test(
    'page failures and broken item queries become parsing exceptions',
    () async {
      for (final result in [
        _result(failMessage: 'Access denied'),
        _result(failMessage: ''),
        _result(isSuccess: false),
        _result(
          errors: const [
            native_error.ParseError(code: 1, message: 'item: invalid XPath'),
          ],
        ),
      ]) {
        await expectLater(
          _engine(result).parse(_job(), CancellationScope()),
          throwsA(isA<ParserException>()),
        );
      }
      await expectLater(
        _engine(_result(failMessage: 'Access denied'))
            .parse(_job(), CancellationScope()),
        throwsA(
          isA<ParserException>().having(
            (error) => error.message,
            'message',
            'Access denied',
          ),
        ),
      );
    },
  );

  test('an active success selector is required to match but placeholders are optional', () async {
    for (final rule in [
      const SelectorRule(selector: '#ok'),
      const SelectorRule(queryType: SelectorQueryType.self),
      const SelectorRule(script: SelectorScript.javaScript(source: r'$arg')),
    ]) {
      final job = _job(config: ParserConfig(selectors: {'success': rule}));
      await expectLater(
        _engine(_result()).parse(job, CancellationScope()),
        throwsA(isA<ParserException>()),
      );
      final payload = await _engine(_result(isSuccess: true))
          .parse(job, CancellationScope());
      expect(payload.data.isSuccess, isTrue);
    }
    for (final type in [SelectorQueryType.css, SelectorQueryType.xpath]) {
      final job = _job(
        config: ParserConfig(
          selectors: {'success': SelectorRule(queryType: type)},
        ),
      );
      expect(
        (await _engine(
          _result(),
        ).parse(job, CancellationScope())).data.isSuccess,
        isNull,
      );
    }
  });

  test('empty pages and optional selector errors stay successful', () async {
    final payload = await _engine(
      _result(
        errors: const [
          native_error.ParseError(code: 2, message: 'failure: no elements'),
          native_error.ParseError(code: 2, message: 'nextPage: no elements'),
          native_error.ParseError(
            code: 1,
            message: 'items[0].title: bad script',
          ),
        ],
      ),
    ).parse(_job(), CancellationScope());
    expect(payload.itemCount, 0);
    expect(payload.continuation, isNull);
    expect(payload.data.errors, hasLength(3));
  });

  test('native errors are wrapped with their original cause', () async {
    const error = native_error.ParseError(code: 1, message: 'item: required');
    final engine = RustParserEngine(
      listParser: ({required html, required config}) async => throw error,
    );
    await expectLater(
      engine.parse(_job(), CancellationScope()),
      throwsA(
        isA<ParserException>()
            .having((error) => error.message, 'message', 'item: required')
            .having((value) => value.cause, 'cause', same(error)),
      ),
    );
  });

  test('unsupported kinds and result types fail explicitly', () async {
    for (final kind in [EndpointKind.reader, EndpointKind.autocomplete]) {
      await expectLater(
        const RustParserEngine().parse(_job(kind: kind), CancellationScope()),
        throwsA(isA<ParserException>()),
      );
    }
    await expectLater(
      _engine(_result()).parse(
        ParseJob<String>(
          endpoint: _job().endpoint,
          parser: _job().parser,
          response: _job().response,
        ),
        CancellationScope(),
      ),
      throwsA(isA<SiteRuntimeException>()),
    );
    await expectLater(
      _engine(_result()).parse(
        _job(
          pagination: const PaginationRule.continuation(
            target: ContinuationTarget.variable,
            variable: 'cursor',
            responseField: 'unknown',
          ),
        ),
        CancellationScope(),
      ),
      throwsA(isA<SiteRuntimeException>()),
    );
  });

  test('cancellation before native dispatch does not call Rust', () async {
    var calls = 0;
    final engine = RustParserEngine(
      listParser: ({required html, required config}) async {
        calls++;
        return _result();
      },
    );
    final scope = CancellationScope()..cancel();
    await expectLater(
      engine.parse(_job(), scope),
      throwsA(isA<CancellationException>()),
    );
    expect(calls, 0);
  });

  test(
    'cancellation discards both late results and late native errors',
    () async {
      for (final fail in [false, true]) {
        final pending = Completer<native_result.ListParserResult>();
        final engine = RustParserEngine(
          listParser: ({required html, required config}) => pending.future,
        );
        final scope = CancellationScope();
        final future = engine.parse(_job(), scope);
        final expectation = expectLater(
          future,
          throwsA(isA<CancellationException>()),
        );
        scope.cancel('changed site');
        if (fail) {
          pending.completeError(
            const native_error.ParseError(code: 1, message: 'late error'),
          );
        } else {
          pending.complete(
            _result(
              envs: const [
                native_result.EnvResult(
                  id: 'token',
                  global: true,
                  value: 'late',
                ),
              ],
            ),
          );
        }
        await expectation;
      }
    },
  );

  test(
    'executor commits successful environment only and keeps it on failed pages',
    () async {
      final environment = InMemoryEnvironmentStore({
        'token': 'old',
        'keep': 'original',
      });
      var response = _result(
        envs: const [
          native_result.EnvResult(id: 'token', global: true, value: 'new'),
          native_result.EnvResult(id: 'keep', global: true),
          native_result.EnvResult(id: 'local', global: false, value: 'value'),
        ],
      );
      final job = _job();
      final executor = DefaultSiteExecutor(
        site: const SiteCompiler().compile(
          SiteDefinition(
            schemaVersion: 2,
            id: 'site',
            name: 'Site',
            baseUrl: 'https://example.test/',
            parsers: [job.parser],
            endpoints: [job.endpoint],
          ),
        ),
        transport: _Transport(),
        parser: RustParserEngine(
          listParser: ({required html, required config}) async => response,
        ),
        environment: environment,
      );
      final result = await executor.execute<model.ListParserResult>(
        SiteOperation(endpointId: 'list'),
        CancellationScope(),
      );
      expect(await environment.snapshot(), {
        'token': 'new',
        'keep': 'original',
      });
      expect(result.context.variables, {'local': 'value'});
      response = _result(
        failMessage: 'Blocked',
        envs: const [
          native_result.EnvResult(id: 'token', global: true, value: 'bad'),
        ],
      );
      await expectLater(
        executor.execute<model.ListParserResult>(
          SiteOperation(endpointId: 'list'),
          CancellationScope(),
        ),
        throwsA(isA<ParserException>()),
      );
      expect(await environment.snapshot(), {
        'token': 'new',
        'keep': 'original',
      });
    },
  );
}

RustParserEngine _engine(native_result.ListParserResult result) =>
    RustParserEngine(
      listParser: ({required html, required config}) async => result,
    );

native_result.ListParserResult _result({
  List<native_result.ListParserResultItem> items = const [],
  String? nextPage,
  bool? isSuccess,
  String? failMessage,
  List<native_result.EnvResult> envs = const [],
  List<native_error.ParseError> errors = const [],
}) => native_result.ListParserResult(
  items: items,
  nextPage: nextPage,
  isSuccess: isSuccess,
  failMessage: failMessage,
  envs: envs,
  errors: errors,
);

ParseJob<model.ListParserResult> _job({
  ParserConfig config = const ParserConfig(),
  EndpointKind kind = EndpointKind.list,
  PaginationRule pagination = const PaginationRule.none(),
}) => ParseJob<model.ListParserResult>(
  endpoint: EndpointRule(
    id: 'list',
    kind: kind,
    name: 'List',
    request: RequestRule(method: RequestMethod.get, url: '/items'),
    parserId: 'parser',
    pagination: pagination,
  ),
  parser: ParserRule(id: 'parser', kind: kind, config: config),
  response: RawResponse(
    statusCode: 200,
    body: Uint8List.fromList(utf8.encode('<li>中文</li>')),
  ),
);

final class _Transport implements HttpTransport {
  @override
  Future<RawResponse> send(
    ResolvedRequest request,
    CancellationScope cancellation,
  ) async => RawResponse(statusCode: 200, body: Uint8List(0));
}
