import 'dart:convert';
import 'dart:typed_data';

import 'package:catweb/data/database/database.dart';
import 'package:catweb/data/site_runtime/site_compiler.dart';
import 'package:catweb/data/site_runtime/site_definition.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_editor_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('new rule starts with the E-Hentai debug definition', () {
    final editor = RulesEditorController.fromDatabase(null);
    addTearDown(editor.dispose);

    expect(editor.definition.name, 'E-Hentai');
    expect(editor.definition.baseUrl, 'https://e-hentai.org/');
    expect(editor.definition.parsers, hasLength(4));
    expect(editor.definition.endpoints, hasLength(7));
    expect(
      () => const SiteCompiler().compile(editor.definition),
      returnsNormally,
    );
    expect(
      editor.definition.endpoints.where((endpoint) => endpoint.visible),
      hasLength(4),
    );
    expect(
      editor.definition.endpoints
          .singleWhere((endpoint) => endpoint.id == 'eh-home')
          .presentation
          .filters,
      hasLength(15),
    );
    expect(
      editor.definition.endpoints
          .singleWhere((endpoint) => endpoint.id == 'eh-favorites')
          .presentation
          .subpages,
      hasLength(11),
    );
  });

  test(
    'invalid stored rule starts a blank schema v2 form without conversion',
    () {
      final editor = RulesEditorController.fromDatabase(_row('{}'));
      addTearDown(editor.dispose);

      expect(editor.replacedInvalidRule, isTrue);
      expect(
        editor.definition.schemaVersion,
        SiteDefinition.currentSchemaVersion,
      );
      expect(editor.definition.parsers, isEmpty);
      expect(editor.definition.endpoints, isEmpty);
    },
  );

  test('renaming parser and endpoint updates references', () {
    final editor = RulesEditorController.fromDatabase(
      _row(jsonEncode(_definition.toJson())),
    );
    addTearDown(editor.dispose);

    editor.upsertParser(
      const ParserRule(id: 'parser-new', kind: EndpointKind.list),
      previousId: 'parser-old',
    );
    editor.upsertEndpoint(
      editor.definition.endpoints.first.copyWith(id: 'list-new'),
      previousId: 'list-old',
    );

    final home = editor.definition.endpoints.singleWhere(
      (endpoint) => endpoint.id == 'home',
    );
    expect(home.parserId, 'parser-new');
    expect(home.links.item, 'list-new');
  });
}

WebTableData _row(String blueprint) => WebTableData(
  id: 1,
  uuid: 'database-site',
  blueprint: blueprint,
  env: '{}',
  favicon: Uint8List(0),
  lastOpen: 0,
  securityModel: true,
  loginCookies: '',
);

final _definition = SiteDefinition(
  schemaVersion: SiteDefinition.currentSchemaVersion,
  id: 'site',
  name: 'Site',
  baseUrl: 'https://example.com/',
  parsers: [
    ParserRule(id: 'parser-old', kind: EndpointKind.list),
    ParserRule(id: 'gallery-parser', kind: EndpointKind.gallery),
  ],
  endpoints: [
    EndpointRule(
      id: 'list-old',
      kind: EndpointKind.gallery,
      name: 'Gallery',
      request: const RequestRule(method: RequestMethod.get, url: '/items'),
      parserId: 'gallery-parser',
      pagination: const PaginationRule.none(),
    ),
    EndpointRule(
      id: 'home',
      kind: EndpointKind.list,
      name: 'Home',
      request: const RequestRule(method: RequestMethod.get, url: '/'),
      parserId: 'parser-old',
      pagination: const PaginationRule.none(),
      links: const EndpointLinks(item: 'list-old'),
    ),
  ],
);
