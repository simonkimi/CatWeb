import 'dart:convert';

import 'package:catweb/data/database/database.dart';
import 'package:catweb/data/site_runtime/ehentai_debug_definition.dart';
import 'package:catweb/data/site_runtime/site_compiler.dart';
import 'package:catweb/data/site_runtime/site_definition.dart';
import 'package:flutter/foundation.dart';

class RulesEditorController extends ChangeNotifier {
  RulesEditorController._(this.definition, {required this.replacedInvalidRule});

  factory RulesEditorController.fromDatabase(WebTableData? database) {
    if (database != null) {
      try {
        final decoded = jsonDecode(database.blueprint);
        if (decoded is! Map) throw const FormatException();
        final json = decoded.map<String, Object?>(
          (key, value) => MapEntry(key.toString(), value),
        );
        final definition = const SiteCompiler().compileJson(json).definition;
        return RulesEditorController._(definition, replacedInvalidRule: false);
      } catch (_) {
        return RulesEditorController._(
          _emptyDefinition(database.uuid),
          replacedInvalidRule: true,
        );
      }
    }

    final id = 'ehentai-debug-${DateTime.now().microsecondsSinceEpoch}';
    return RulesEditorController._(
      buildEhentaiDebugDefinition(id),
      replacedInvalidRule: false,
    );
  }

  SiteDefinition definition;
  final bool replacedInvalidRule;

  void updateBasic({String? id, String? name, String? baseUrl}) {
    definition = definition.copyWith(
      id: id ?? definition.id,
      name: name ?? definition.name,
      baseUrl: baseUrl ?? definition.baseUrl,
    );
    notifyListeners();
  }

  void updateOptions(SiteOptions options) {
    definition = definition.copyWith(options: options);
    notifyListeners();
  }

  void upsertParser(ParserRule parser, {String? previousId}) {
    final parsers = [...definition.parsers];
    final index = previousId == null
        ? -1
        : parsers.indexWhere((item) => item.id == previousId);
    if (index < 0) {
      parsers.add(parser);
    } else {
      parsers[index] = parser;
    }

    var endpoints = definition.endpoints;
    if (previousId != null && previousId != parser.id) {
      endpoints = endpoints
          .map(
            (endpoint) => endpoint.parserId == previousId
                ? endpoint.copyWith(parserId: parser.id)
                : endpoint,
          )
          .toList();
    }
    definition = definition.copyWith(parsers: parsers, endpoints: endpoints);
    notifyListeners();
  }

  bool removeParser(ParserRule parser) {
    if (definition.endpoints.any((item) => item.parserId == parser.id)) {
      return false;
    }
    definition = definition.copyWith(
      parsers: definition.parsers
          .where((item) => item.id != parser.id)
          .toList(),
    );
    notifyListeners();
    return true;
  }

  void upsertEndpoint(EndpointRule endpoint, {String? previousId}) {
    final endpoints = [...definition.endpoints];
    final index = previousId == null
        ? -1
        : endpoints.indexWhere((item) => item.id == previousId);
    if (index < 0) {
      endpoints.add(endpoint);
    } else {
      endpoints[index] = endpoint;
    }

    if (previousId != null && previousId != endpoint.id) {
      for (var i = 0; i < endpoints.length; i++) {
        final links = endpoints[i].links;
        endpoints[i] = endpoints[i].copyWith(
          links: links.copyWith(
            item: links.item == previousId ? endpoint.id : links.item,
            autocomplete: links.autocomplete == previousId
                ? endpoint.id
                : links.autocomplete,
            reader: links.reader == previousId ? endpoint.id : links.reader,
          ),
        );
      }
    }

    definition = definition.copyWith(endpoints: endpoints);
    notifyListeners();
  }

  void removeEndpoint(EndpointRule endpoint) {
    final endpoints = definition.endpoints
        .where((item) => item.id != endpoint.id)
        .map((item) {
          final links = item.links;
          return item.copyWith(
            links: links.copyWith(
              item: links.item == endpoint.id ? null : links.item,
              autocomplete: links.autocomplete == endpoint.id
                  ? null
                  : links.autocomplete,
              reader: links.reader == endpoint.id ? null : links.reader,
            ),
          );
        })
        .toList();
    definition = definition.copyWith(endpoints: endpoints);
    notifyListeners();
  }

  static SiteDefinition _emptyDefinition(String id) => SiteDefinition(
    schemaVersion: SiteDefinition.currentSchemaVersion,
    id: id,
    name: '',
    baseUrl: '',
  );
}
