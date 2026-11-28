import 'dart:convert';
import 'dart:typed_data';

import 'package:catweb/data/controller/db.dart';
import 'package:catweb/data/controller/settings.dart';
import 'package:catweb/data/controller/site.dart';
import 'package:catweb/data/database/database.dart';
import 'package:catweb/data/models/site_render_model.dart';
import 'package:catweb/data/repositories/site_repository.dart';
import 'package:catweb/data/site_runtime/runtime_contracts.dart';
import 'package:catweb/data/site_runtime/rust_parser_engine.dart';
import 'package:catweb/data/site_runtime/site_definition.dart';
import 'package:catweb/i18n.dart';
import 'package:catweb/network/runtime/site_runtime_factory.dart';
import 'package:catweb/src/rust/models/result.dart' as native;
import 'package:catweb/ui/pages/view_page/gallery/viewer_gallery.dart';
import 'package:catweb/ui/pages/view_page/gallery/viewer_gallery_notifier.dart';
import 'package:catweb/ui/pages/view_page/gallery/viewer_gallery_images.dart';
import 'package:catweb/ui/pages/view_page/image/image_reader.dart';
import 'package:catweb/ui/widgets/image_loader.dart';
import 'package:catweb/ui/widgets/preview_image.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
    'gallery opens reader, displays image bytes and retries page failures',
    (tester) async {
      final fixture = (await tester.runAsync(
        () => _fixture(_result('Gallery').copyWith(imageCount: 1)),
      ))!;
      addTearDown(() async {
        await tester.pumpWidget(const SizedBox());
        await tester.runAsync(fixture.dispose);
      });
      fixture.readerResponse = fixture.readerResponse.copyWith(
        failMessage: 'Reader blocked',
      );
      await tester.pumpWidget(
        _app(
          fixture,
          ViewerGalleryFragment(
            endpoint: fixture.endpoint,
            website: fixture.website,
            requestContext: RequestContext(),
          ),
        ),
      );
      await tester.runAsync(() => Future<void>.delayed(Duration.zero));
      await tester.pumpAndSettle();
      await tester.tap(find.byType(PreviewImage));
      await tester.pump();
      await tester.runAsync(
        () => Future<void>.delayed(const Duration(milliseconds: 50)),
      );
      await tester.pumpAndSettle();
      expect(find.byType(ImageReader), findsOneWidget);
      expect(find.textContaining('Reader blocked'), findsOneWidget);
      fixture.readerResponse = fixture.readerResponse.copyWith(
        failMessage: null,
      );
      await tester.tap(find.textContaining('Reader blocked'));
      await tester.pump(const Duration(milliseconds: 350));
      await tester.runAsync(
        () => Future<void>.delayed(const Duration(milliseconds: 100)),
      );
      await tester.pump();
      await tester.runAsync(
        () => Future<void>.delayed(const Duration(milliseconds: 100)),
      );
      await tester.pumpAndSettle();
      expect(
        fixture.requests.where((r) => r.uri.path == '/s/target'),
        hasLength(2),
      );
      expect(find.textContaining('Reader blocked'), findsNothing);
      expect(
        fixture.imageRequests.single.uri.toString(),
        'https://images.test/reader.png',
      );
      final image = tester.widget<ImageLoader>(find.byType(ImageLoader));
      expect(image.model.url, 'https://images.test/reader.png');
      expect(find.byType(RawImage), findsWidgets);
      expect(
        tester.widget<CupertinoSlider>(find.byType(CupertinoSlider)).onChanged,
        isNull,
      );
      expect(tester.takeException(), isNull);
      await tester.pumpWidget(const SizedBox());
    },
  );

  testWidgets(
    'gallery metadata renders with uncategorized tags and missing preview images',
    (tester) async {
      final fixture = await tester.runAsync(() => _fixture(_result('Gallery')));
      addTearDown(fixture!.dispose);
      await tester.pumpWidget(
        _app(
          fixture,
          ViewerGalleryFragment(
            endpoint: fixture.endpoint,
            website: fixture.website,
            requestContext: RequestContext(),
          ),
        ),
      );
      await tester.runAsync(() => Future<void>.delayed(Duration.zero));
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
      expect(find.text('Gallery'), findsOneWidget);
      expect(find.text('Uncategorized'), findsOneWidget);
      expect(find.byType(PreviewImage), findsOneWidget);
      expect(find.byType(ImageLoader), findsNothing);
      await tester.pumpWidget(const SizedBox());
    },
  );

  testWidgets('first page failures are visible and can be retried', (
    tester,
  ) async {
    final fixture = await tester.runAsync(() => _fixture(_result('Recovered')));
    addTearDown(fixture!.dispose);
    fixture.response = _result('Failed')
        .copyWith(failMessage: 'Gallery blocked');
    await tester.pumpWidget(
      _app(
        fixture,
        ViewerGalleryFragment(
          endpoint: fixture.endpoint,
          website: fixture.website,
          requestContext: RequestContext(),
        ),
      ),
    );
    await tester.runAsync(() => Future<void>.delayed(Duration.zero));
    await tester.pumpAndSettle();
    expect(find.text('Gallery blocked'), findsOneWidget);
    fixture.response = _result('Recovered');
    await tester.tap(find.text('Gallery blocked'));
    await tester.runAsync(() => Future<void>.delayed(Duration.zero));
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
    expect(find.text('Recovered'), findsOneWidget);
    expect(find.text('Gallery blocked'), findsNothing);
    await tester.pumpWidget(const SizedBox());
  });

  testWidgets(
    'random preview pages keep absolute indices and first metadata until refresh',
    (tester) async {
      final fixture = await tester.runAsync(() => _fixture(_result('First')));
      addTearDown(fixture!.dispose);
      final notifier = ViewerGalleryNotifier(
        endpoint: fixture.endpoint,
        website: fixture.website,
        requestContext: RequestContext(),
      );
      addTearDown(notifier.dispose);
      await tester.runAsync(notifier.loadInitial);
      fixture.response = _result('Later');
      await tester.runAsync(() => notifier.loadIndexModel(4));
      expect(notifier.firstPage!.pageData.title, 'First');
      expect(notifier.loadedPreviewIndices, [0, 4]);
      expect(fixture.requests.last.uri.queryParameters['p'], '2');
      expect(notifier.itemCount, 5);
      expect(notifier.itemAt(4)!.idCode, 'target');
      int? opened;
      await tester.pumpWidget(
        _app(
          fixture,
          ChangeNotifierProvider.value(
            value: notifier,
            child: ViewerGalleryImages(
              onOpenPage: (index) async {
                opened = index;
              },
            ),
          ),
        ),
      );
      await tester.runAsync(() => Future<void>.delayed(Duration.zero));
      await tester.pumpAndSettle();
      expect(find.text('5'), findsOneWidget);
      expect(find.byType(ImageLoader), findsNothing);
      await tester.tap(find.text('5'));
      expect(opened, 4);
      expect(tester.takeException(), isNull);
      await tester.pumpWidget(const SizedBox());
      fixture.response = _result('Refreshed');
      await tester.runAsync(notifier.refresh);
      expect(notifier.firstPage!.pageData.title, 'Refreshed');
      expect(notifier.loadedPreviewIndices, [0]);
    },
  );
}

Widget _app(_Fixture fixture, Widget child) => MultiProvider(
  providers: [
    Provider.value(value: fixture.service),
    Provider.value(value: fixture.setting),
  ],
  child: CupertinoApp(
    localizationsDelegates: I.localizationsDelegates,
    supportedLocales: I.supportedLocales,
    home: child,
  ),
);

native.GalleryParserResult _result(String title) => native.GalleryParserResult(
  title: title,
  imageCount: 5,
  previews: const [native.GalleryPreviewItem(target: 'target')],
  badges: const [native.TagResult(text: 'Uncategorized')],
  tags: [],
  comments: [],
  envs: [],
  errors: [],
);

Future<_Fixture> _fixture(native.GalleryParserResult result) async {
  SharedPreferences.setMockInitialValues({});
  final setting = await SettingService().init();
  final db = DbService(
    database: AppDataBase.forTesting(NativeDatabase.memory()),
  );
  final repository = SiteRepository(
    webDao: db.webDao,
    cookieJarDao: db.cookieJarDao,
  );
  final factory = SiteRuntimeFactory(
    documentCacheOptions: CacheOptions(store: MemCacheStore()),
    imageCacheOptions: CacheOptions(store: MemCacheStore()),
    imageConcurrency: () => 1,
    cookieJarDao: repository.cookieJarDao,
  );
  final service = SiteService(
    setting: setting,
    repository: repository,
    runtimeFactory: factory,
  );
  final definition = SiteDefinition(
    schemaVersion: 2,
    id: 'gallery-test',
    name: 'Gallery test',
    baseUrl: 'https://example.test/',
    parsers: const [
      ParserRule(
        id: 'gallery-parser',
        kind: EndpointKind.gallery,
        config: ParserConfig(
          selectors: {'thumbnail': SelectorRule(selector: 'a')},
        ),
      ),
      ParserRule(id: 'reader-parser', kind: EndpointKind.reader),
    ],
    endpoints: [
      EndpointRule(
        id: 'gallery',
        name: 'Gallery',
        kind: EndpointKind.gallery,
        request: RequestRule(
          method: RequestMethod.get,
          url: '/gallery',
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
        links: const EndpointLinks(reader: 'reader'),
      ),
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
  final fixture = _Fixture(db, setting, service, definition, result);
  fixture.website = SiteRenderConfigModel(
    definition: definition,
    dbEntity: WebTableData(
      id: 1,
      uuid: 'gallery-test',
      blueprint: '{}',
      env: '{}',
      favicon: Uint8List(0),
      lastOpen: 0,
      securityModel: true,
      loginCookies: '',
    ),
    repository: repository,
    runtimeFactory: factory,
    parserEngine: RustParserEngine(
      galleryParser: ({required html, required config}) async =>
          fixture.response,
      readerParser: ({required html, required config}) async =>
          fixture.readerResponse,
    ),
  );
  fixture.website.session.documentDio.interceptors.clear();
  fixture.website.session.documentDio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        fixture.requests.add(options);
        handler.resolve(
          Response<List<int>>(
            requestOptions: options,
            statusCode: 200,
            data: [],
          ),
        );
      },
    ),
  );
  fixture.website.session.imageDio.interceptors.clear();
  fixture.website.session.imageDio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        fixture.imageRequests.add(options);
        handler.resolve(
          Response<Uint8List>(
            requestOptions: options,
            statusCode: 200,
            data: base64Decode(
              'iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mP8/x8AAwMCAO+aSaUAAAAASUVORK5CYII=',
            ),
          ),
        );
      },
    ),
  );
  return fixture;
}

class _Fixture {
  _Fixture(this.db, this.setting, this.service, this.definition, this.response);
  final DbService db;
  final SettingService setting;
  final SiteService service;
  final SiteDefinition definition;
  native.GalleryParserResult response;
  native.ImageReaderResult readerResponse = const native.ImageReaderResult(
    image: native.ImageResult(url: 'https://images.test/reader.png'),
    tags: [],
    badges: [],
    comments: [],
    envs: [],
    errors: [],
  );
  late final SiteRenderConfigModel website;
  final requests = <RequestOptions>[];
  final imageRequests = <RequestOptions>[];
  EndpointRule get endpoint => definition.endpoints.first;

  Future<void> dispose() async {
    await website.dispose();
    await service.dispose();
    await db.dispose();
    setting.dispose();
  }
}
