import 'package:catweb/data/execute/js_runtime.dart';
import 'package:catweb/data/execute/selector_exec.dart';
import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/data/protocol/model/page.dart';
import 'package:catweb/data/protocol/model/selector.dart';
import 'package:catweb/utils/utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:xpath_selector/xpath_selector.dart';

abstract class ParserExec {
  ParserExec({
    required this.model,
    required this.source,
    required this.env,
    required this.dio,
  }) : jsRuntime = JsRuntime(dio: dio);

  final SitePageModel model;
  final String source;
  final SiteEnvModel env;
  final Dio dio;

  final JsRuntime jsRuntime;

  @protected
  String? singleString(SelectorModel model, XPathNode parent) {
    return env.resolve(model.resolve(parent).index(0));
  }

  @protected
  double? singleDouble(SelectorModel model, XPathNode parent) {
    final result = model.resolve(parent).index(0);
    if (result == null) return null;
    return double.tryParse(result);
  }

  @protected
  int? singleInt(SelectorModel model, XPathNode parent) {
    final result = model.resolve(parent).index(0);
    if (result == null) return null;
    return int.tryParse(result);
  }

  @protected
  Color? singleColor(SelectorModel model, XPathNode parent) {
    final result = model.resolve(parent).index(0)?.trim().toLowerCase();
    if (result == null) return null;
    if (result.startsWith('0x')) {
      return Color(int.parse(result.substring(2), radix: 16));
    } else if (result.startsWith('#')) {
      return Color(int.parse(result.substring(1), radix: 16));
    }

    final rgb = RegExp(r'[\.\d]+%?');
    final match = rgb.allMatches(result).toList();
    if (match.length == 3) {
      return Color.fromARGB(
        0xFF,
        _getColorInt(match[0][0]!),
        _getColorInt(match[1][0]!),
        _getColorInt(match[2][0]!),
      );
    }
    if (match.length == 4) {
      return Color.fromARGB(
        ((double.tryParse(match[3][0]!) ?? 1) * 255).floor(),
        _getColorInt(match[0][0]!),
        _getColorInt(match[1][0]!),
        _getColorInt(match[2][0]!),
      );
    }
    return null;
  }

  @protected
  int _getColorInt(String input) {
    if (input.endsWith('%')) {
      return (255 * (int.parse(input.substring(0, input.length - 1)) / 100))
          .floor();
    } else {
      return double.parse(input).floor();
    }
  }
}
