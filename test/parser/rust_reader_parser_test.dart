@Timeout(Duration(minutes: 10))
library;

import 'dart:async';

import 'package:catweb/data/controller/settings.dart';
import 'package:catweb/data/loading/resource_loader.dart';
import 'package:catweb/data/media/image_repository.dart';
import 'package:catweb/data/models/ffi/result/base.dart' as model;
import 'package:catweb/data/models/image_with_preview.dart';
import 'package:catweb/data/site_runtime/runtime_contracts.dart';
import 'package:catweb/data/site_runtime/rust_parser_engine.dart';
import 'package:catweb/data/site_runtime/site_definition.dart';
import 'package:catweb/network/runtime/site_session.dart';
import 'package:catweb/src/rust/api/parser.dart' as parser;
import 'package:catweb/src/rust/frb_generated.dart';
import 'package:catweb/src/rust/models/selector.dart' as native;
import 'package:catweb/ui/pages/view_page/image/controller/reader_load_notifier.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'native_test_support.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(initializeNativeParser);
  tearDownAll(RustLib.dispose);

  test('FRB transfers reader qualities, string rating, numeric score and collections', () async {
    final result = await parser.parseReader(
      html:
          '<img src="normal.png"><a href="raw.png">Original</a><b>explicit</b><i>4.5</i>'
          '<article><p>Comment</p><i>+12</i><img src="avatar.png"></article>',
      config: native.ParserConfig(
        selectors: {
          'image.url': _rule('img', attribute: 'src'),
          'image.cacheKey': _rule('b'),
          'largerImage.url': _rule('a', attribute: 'href'),
          'rawImage.url': _rule('//a/@href', xpath: true),
          'rating': _rule('b'),
          'score': _rule('i'),
          'tag': _rule('b'),
          'badge': _rule('b'),
          'comment': _rule('article'),
          'comment.content': _rule('.//p', xpath: true),
          'comment.score': _rule('i'),
          'comment.avatar.url': _rule('img', attribute: 'src'),
        },
        extras: [
          native.ExtraSelectorRule(
            id: 'token',
            persistent: true,
            selector: _rule('b'),
          ),
        ],
      ),
    );
    expect(result.image!.url, 'normal.png');
    expect(result.image!.cacheKey, 'explicit');
    expect(result.largerImage!.url, 'raw.png');
    expect(result.rawImage!.url, 'raw.png');
    expect(result.rating, 'explicit');
    expect(result.score, 4.5);
    expect(result.tags.single.text, 'explicit');
    expect(result.badges.single.text, 'explicit');
    expect(result.comments.single.content, 'Comment');
    expect(result.comments.single.score, '+12');
    expect(result.comments.single.avatar!.url, 'avatar.png');
    expect(result.envs.single.value, 'explicit');
    expect(result.envs.single.global, isTrue);
    expect(result.errors, isEmpty);
    expect(result.copyWith(rating: 'safe').rating, 'safe');
    expect(result.copyWith(), result);
    expect(() => result.comments.clear(), throwsUnsupportedError);
  });

  test(
    'real reader loader applies every quality fallback and ignores empty URLs',
    () async {
      final cases = [
        (ImageQuality.defaultQ, true, true, true, 'normal'),
        (ImageQuality.defaultQ, false, true, true, 'large'),
        (ImageQuality.defaultQ, false, false, true, 'raw'),
        (ImageQuality.larger, true, true, true, 'large'),
        (ImageQuality.larger, true, false, true, 'normal'),
        (ImageQuality.larger, false, false, true, 'raw'),
        (ImageQuality.original, true, true, true, 'raw'),
        (ImageQuality.original, true, true, false, 'large'),
        (ImageQuality.original, true, false, false, 'normal'),
      ];
      for (final (quality, normal, large, raw, expected) in cases) {
        final fixture = await _fixture(quality);
        try {
          fixture.adapter.html =
              '<img id="normal" src="${normal ? 'normal' : '  '}">'
              '<img id="large" src="${large ? 'large' : ''}">'
              '<img id="raw" src="${raw ? 'raw' : ''}"><b id="token">saved</b>';
          await _terminal(fixture.loader);
          expect(fixture.loader.imageAt(0)!.url, expected);
          expect(fixture.adapter.requests.single.uri.path, '/s/target-0');
          expect(await fixture.environment.snapshot(), {'token': 'saved'});
        } finally {
          await fixture.dispose();
        }
      }
    },
  );

  test(
    'reader parsing failure preserves environment and can be retried',
    () async {
      final fixture = await _fixture(ImageQuality.defaultQ);
      try {
        fixture.adapter.html = '<b id="token">bad</b>';
        await _terminal(fixture.loader);
        expect(
          fixture.loader.stateAt(0),
          isA<ResourceFailure<model.ImageResult>>(),
        );
        expect(await fixture.environment.snapshot(), {'token': 'old'});
        fixture.adapter.html =
            '<img id="normal" src="recovered"><b id="token">saved</b>';
        final previous = fixture.loader.stateAt(0);
        fixture.loader.retry(0);
        await _terminal(fixture.loader, previous: previous);
        expect(fixture.loader.imageAt(0)!.url, 'recovered');
        expect(fixture.adapter.requests, hasLength(2));
        expect(
          (fixture.adapter.requests.last.extra[extraKey] as CacheOptions)
              .policy,
          CachePolicy.refreshForceCache,
        );
        expect(await fixture.environment.snapshot(), {'token': 'saved'});
      } finally {
        await fixture.dispose();
      }
    },
  );
}

native.SelectorRule _rule(
  String selector, {
  String? attribute,
  bool xpath = false,
}) => native.SelectorRule(
  selector: selector,
  queryType: xpath
      ? native.SelectorQueryType.xpath
      : native.SelectorQueryType.css,
  function: attribute == null
      ? native.SelectorFunctionType.text
      : native.SelectorFunctionType.attribute,
  parameter: attribute ?? '',
  regex: '',
  replace: '',
  defaultValue: '',
  script: const native.SelectorScript.output(),
);

Future<void> _terminal(
  ReaderLoaderNotifier loader, {
  ResourceSnapshot<model.ImageResult>? previous,
}) async {
  bool done() =>
      loader.stateAt(0) is ResourceSuccess<model.ImageResult> ||
      loader.stateAt(0) is ResourceFailure<model.ImageResult>;
  final completer = Completer<void>();
  void check() {
    if (done() &&
        !identical(loader.stateAt(0), previous) &&
        !completer.isCompleted) {
      completer.complete();
    }
  }

  loader.addListener(check);
  try {
    check();
    await completer.future.timeout(const Duration(seconds: 15));
  } finally {
    loader.removeListener(check);
  }
}

Future<_Fixture> _fixture(ImageQuality quality) async {
  SharedPreferences.setMockInitialValues({});
  final settings = await SettingService().init();
  settings.imageQualityNotifier.value = quality;
  final adapter = _Adapter();
  final environment = InMemoryEnvironmentStore({'token': 'old'});
  final definition = SiteDefinition(
    schemaVersion: 2,
    id: 'reader',
    name: 'Reader',
    baseUrl: 'https://example.test/',
    parsers: [
      ParserRule(
        id: 'reader-parser',
        kind: EndpointKind.reader,
        config: ParserConfig(
          selectors: {
            for (final entry in {
              'image': '#normal',
              'largerImage': '#large',
              'rawImage': '#raw',
            }.entries)
              '${entry.key}.url': SelectorRule(
                selector: entry.value,
                function: SelectorFunctionType.attribute,
                parameter: 'src',
              ),
          },
          extras: const [
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
        id: 'reader',
        name: 'Reader',
        kind: EndpointKind.reader,
        request: RequestRule(method: RequestMethod.get, url: '/s/{{idCode!}}'),
        parserId: 'reader-parser',
        pagination: const PaginationRule.none(),
      ),
    ],
  );
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
  final info = _ReaderInfo(session.images);
  final loader = ReaderLoaderNotifier(
    readerInfo: info,
    endpoint: definition.endpoints.single,
    requestContext: RequestContext(),
    session: session,
    settingService: settings,
  );
  return _Fixture(loader, session, settings, info, adapter, environment);
}

class _ReaderInfo extends ChangeNotifier
    implements ReaderInfo<ImageWithPreviewModel> {
  _ReaderInfo(this.previewRepository);
  @override
  final ImageRepository previewRepository;
  @override
  int get itemCount => 1;
  @override
  int? get startReadIndex => 0;
  @override
  ImageWithPreviewModel? itemAt(int index) => index == 0 ? const _Item() : null;
  @override
  Future<void> loadIndexModel(int index) async {}
}

class _Item implements ImageWithPreviewModel {
  const _Item();
  @override
  String get idCode => 'target-0';
  @override
  model.ImageResult? get previewImage => null;
}

class _Adapter implements HttpClientAdapter {
  String html = '';
  final requests = <RequestOptions>[];
  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    requests.add(options);
    return ResponseBody.fromString(
      html,
      200,
      headers: {
        Headers.contentTypeHeader: ['text/html; charset=utf-8'],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

class _Fixture {
  _Fixture(
    this.loader,
    this.session,
    this.settings,
    this.info,
    this.adapter,
    this.environment,
  );
  final ReaderLoaderNotifier loader;
  final SiteSession session;
  final SettingService settings;
  final _ReaderInfo info;
  final _Adapter adapter;
  final InMemoryEnvironmentStore environment;
  Future<void> dispose() async {
    loader.dispose();
    await session.dispose();
    settings.dispose();
    info.dispose();
  }
}
