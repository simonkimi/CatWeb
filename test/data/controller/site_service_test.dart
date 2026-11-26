import 'dart:convert';
import 'dart:typed_data';

import 'package:catweb/data/controller/db.dart';
import 'package:catweb/data/controller/settings.dart';
import 'package:catweb/data/controller/site.dart';
import 'package:catweb/data/database/database.dart';
import 'package:catweb/data/loading/load_failure.dart';
import 'package:catweb/data/models/site_render_model.dart';
import 'package:catweb/data/repositories/site_repository.dart';
import 'package:catweb/data/site_runtime/rust_parser_engine.dart';
import 'package:catweb/data/site_runtime/runtime_contracts.dart';
import 'package:catweb/data/site_runtime/site_definition.dart';
import 'package:catweb/network/runtime/site_runtime_factory.dart';
import 'package:catweb/src/rust/models/result.dart' as native;
import 'package:catweb/ui/pages/view_page/list/subpage_notifier.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('startup compile failure retains the site for recovery', () async {
    final fixture = await _createFixture();
    addTearDown(fixture.dispose);
    final invalidSite = _row(blueprint: '{}');

    await fixture.service.setNewSite(invalidSite);

    expect(fixture.service.currentSite, isNull);
    expect(fixture.service.failedSite, same(invalidSite));
    expect(
      fixture.service.loadFailureNotifier.value?.kind,
      LoadFailureKind.configuration,
    );
  });

  test('compile failure keeps the active site unchanged', () async {
    final fixture = await _createFixture();
    addTearDown(fixture.dispose);
    final service = fixture.service;

    await service.setNewSite(_row(blueprint: jsonEncode(_validDefinition)));
    final active = service.currentSite;
    expect(active, isNotNull);
    expect(active!.parserEngine, isA<RustParserEngine>());

    final invalidSite = _row(blueprint: '{}');
    await service.setNewSite(invalidSite);

    expect(service.currentSite, same(active));
    expect(service.failedSite, same(invalidSite));
    expect(
      service.loadFailureNotifier.value?.kind,
      LoadFailureKind.configuration,
    );
  });

  test(
    'list controller loads, searches and clears search using the parser engine',
    () async {
      final fixture = await _createFixture();
      addTearDown(fixture.dispose);
      final definition = SiteDefinition.fromJson(_validDefinition);
      final endpoint = definition.endpoints.single.copyWith(
        request: RequestRule(
          method: RequestMethod.get,
          url: '/items',
          query: {'q': '{{search}}'},
        ),
      );
      final website = SiteRenderConfigModel(
        definition: definition.copyWith(endpoints: [endpoint]),
        dbEntity: _row(blueprint: jsonEncode(_validDefinition)),
        repository: fixture.service.repository,
        runtimeFactory: fixture.service.runtimeFactory,
        parserEngine: RustParserEngine(
          listParser: ({required html, required config}) async =>
              const native.ListParserResult(
                items: [
                  native.ListParserResultItem(
                    title: 'Result',
                    badges: [],
                    tags: [],
                  ),
                ],
                envs: [],
                errors: [],
              ),
        ),
      );
      addTearDown(website.dispose);
      final requests = <RequestOptions>[];
      website.session.documentDio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            requests.add(options);
            handler.resolve(
              Response<List<int>>(
                requestOptions: options,
                statusCode: 200,
                data: utf8.encode('<li>Result</li>'),
              ),
            );
          },
        ),
      );
      final notifier = SubListNotifier(
        endpoint: endpoint,
        website: website,
        requestContext: RequestContext(),
      );
      addTearDown(notifier.dispose);

      await notifier.requireFirstLoad();
      expect(notifier.pageSnapshot.failure, isNull);
      expect(notifier.loadedItems.single.previewModel.title, 'Result');
      expect(notifier.loadedItems.single.previewImage, isNull);
      expect(requests.last.uri.queryParameters['q'], '');

      await notifier.onNewSearch(' cat ');
      expect(notifier.pageSnapshot.failure, isNull);
      expect(requests.last.uri.queryParameters['q'], 'cat');
      await notifier.onNewSearch('');
      expect(notifier.pageSnapshot.failure, isNull);
      expect(requests.last.uri.queryParameters['q'], '');
      expect(requests, hasLength(3));
    },
  );
}

Future<_Fixture> _createFixture() async {
  SharedPreferences.setMockInitialValues({});
  final setting = await SettingService().init();
  final db = DbService(
    database: AppDataBase.forTesting(NativeDatabase.memory()),
  );
  final repository = SiteRepository(
    webDao: db.webDao,
    cookieJarDao: db.cookieJarDao,
  );
  final service = SiteService(
    setting: setting,
    repository: repository,
    runtimeFactory: SiteRuntimeFactory(
      documentCacheOptions: CacheOptions(store: MemCacheStore()),
      imageCacheOptions: CacheOptions(store: MemCacheStore()),
      imageConcurrency: () => 1,
      cookieJarDao: repository.cookieJarDao,
    ),
  );
  return _Fixture(service: service, db: db, setting: setting);
}

class _Fixture {
  const _Fixture({
    required this.service,
    required this.db,
    required this.setting,
  });

  final SiteService service;
  final DbService db;
  final SettingService setting;

  Future<void> dispose() async {
    await service.dispose();
    await db.dispose();
    setting.dispose();
  }
}

WebTableData _row({required String blueprint}) => WebTableData(
  id: 1,
  uuid: 'site-1',
  blueprint: blueprint,
  env: '{}',
  favicon: Uint8List(0),
  lastOpen: 0,
  securityModel: true,
  loginCookies: '',
);

const _validDefinition = <String, Object?>{
  'schemaVersion': 2,
  'id': 'site-1',
  'name': 'Site',
  'baseUrl': 'https://example.com/',
  'parsers': [
    {'id': 'list-parser', 'kind': 'list', 'config': <String, Object?>{}},
  ],
  'endpoints': [
    {
      'id': 'list',
      'kind': 'list',
      'name': 'List',
      'request': {
        'method': 'get',
        'url': '/items',
        'body': {'type': 'none'},
      },
      'parserId': 'list-parser',
      'pagination': {'type': 'none'},
    },
  ],
};
