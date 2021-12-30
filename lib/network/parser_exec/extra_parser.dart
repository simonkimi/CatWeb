import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/data/protocol/model/selector.dart';
import 'package:catweb/gen/protobuf/selector.pbserver.dart';
import 'package:catweb/network/parser_exec/parser_exec.dart';
import 'package:xpath_selector/xpath_selector.dart';
import 'package:get/get.dart';

bool xmlHtmlExtra({
  required DomParserExec domSelector,
  required Iterable<ExtraSelectorModel> extras,
  required XPath root,
  required Function(String key, String value) onLocalEnv,
  required Function(String key, String value) onGlobalEnv,
}) {
  var globalChange = false;
  // 额外的解析
  for (final extraParser in extras) {
    final value = domSelector.string(extraParser.selector, root.root);
    if (value != null && extraParser.id.isNotEmpty) {
      if (extraParser.global.value == true) {
        onGlobalEnv(extraParser.id.value, value);
        globalChange = true;
      } else {
        onLocalEnv(extraParser.id.value, value);
      }
    }
  }
  return globalChange;
}

SiteEnvModel xmlHtmlLocalExtra({
  required DomParserExec domSelector,
  required Iterable<ExtraSelectorModel> extras,
  required XPathNode root,
  required ExtraSelectorType filter,
}) {
  final env = SiteEnvModel();
  // 额外的解析
  for (final extraParser in extras.where((e) => e.type.value == filter)) {
    final value = domSelector.string(extraParser.selector, root);
    if (value != null && extraParser.id.isNotEmpty) {
      env.env[extraParser.id.value] = value;
    }
  }
  return env;
}
