import 'package:catweb/data/execute/js_runtime.dart';
import 'package:catweb/data/execute/selector_exec.dart';
import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/data/protocol/model/selector.dart';
import 'package:catweb/utils/utils.dart';
import 'package:dio/dio.dart';
import 'package:expressions/expressions.dart';
import 'package:flutter/cupertino.dart';
import 'package:xpath_selector/xpath_selector.dart';

class DomParserExec<T> {
  DomParserExec({
    required this.env,
    required this.dio,
  }) : jsRuntime = JsRuntime(dio: dio);

  final SiteEnvModel env;
  final Dio dio;

  final JsRuntime jsRuntime;

  List<XPathNode<T>> nodes(SelectorModel model, XPathNode<T> parent) {
    return DomSelectorExec<T>(selector: model, jsRuntime: jsRuntime)
        .findElements(parent);
  }

  String? singleString(SelectorModel model, XPathNode<T> parent) {
    final find = DomSelectorExec<T>(
      selector: model,
      jsRuntime: jsRuntime,
    ).find(parent);
    return env.resolve(find.index(0));
  }

  double? singleDouble(SelectorModel model, XPathNode<T> parent) {
    final find = DomSelectorExec<T>(
      selector: model,
      jsRuntime: jsRuntime,
    ).find(parent);
    var result = find.index(0);

    if (result == null) return null;
    final currentDouble = double.tryParse(result);
    if (currentDouble == null) {
      result = _compute(result);
    }

    if (result == null) return null;
    return double.tryParse(result);
  }

  int? singleInt(SelectorModel model, XPathNode<T> parent) {
    final find = DomSelectorExec<T>(
      selector: model,
      jsRuntime: jsRuntime,
    ).find(parent);
    String? result = find.index(0);

    if (result == null) return null;
    final currentInt = int.tryParse(result);
    if (currentInt == null) {
      result = _compute(result);
    }
    if (result == null) return null;

    return int.tryParse(result);
  }

  Color? singleColor(SelectorModel model, XPathNode<T> parent,
      {bool computed = false}) {
    final find = DomSelectorExec<T>(
      selector: model,
      jsRuntime: jsRuntime,
    ).find(parent);
    final result = find.index(0)?.trim().toLowerCase();
    if (result == null) return null;
    if (result.startsWith('0x')) {
      return Color(int.parse(result.substring(2), radix: 16) | 0xff000000);
    } else if (result.startsWith('#')) {
      return Color(int.parse(result.substring(1), radix: 16) | 0xff000000);
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

  int _getColorInt(String input) {
    if (input.endsWith('%')) {
      return (255 * (int.parse(input.substring(0, input.length - 1)) / 100))
          .floor();
    } else {
      return double.parse(input).floor();
    }
  }

  String? _compute(String? input) {
    if (input == null) return null;
    try {
      final result =
          const ExpressionEvaluator().eval(Expression.parse(input), {});
      return result.toString();
    } on Exception {
      return null;
    }
  }
}
