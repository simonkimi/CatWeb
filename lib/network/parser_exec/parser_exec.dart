import 'package:catweb/data/execute/js_runtime.dart';
import 'package:catweb/data/execute/selector_exec.dart';
import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/data/protocol/model/selector.dart';
import 'package:catweb/utils/utils.dart';
import 'package:dio/dio.dart';
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
    final exec = DomSelectorExec<T>(selector: model, jsRuntime: jsRuntime);
    return exec.findElements(parent);
  }

  Future<String?> singleString(SelectorModel model, XPathNode<T> parent) async {
    final exec = DomSelectorExec<T>(selector: model, jsRuntime: jsRuntime);
    final find = await exec.find(parent);
    return env.resolve(find.index(0));
  }

  Future<double?> singleDouble(SelectorModel model, XPathNode<T> parent) async {
    final exec = DomSelectorExec<T>(selector: model, jsRuntime: jsRuntime);
    final find = await exec.find(parent);
    final result = find.index(0);
    if (result == null) return null;
    return double.tryParse(result);
  }

  Future<int?> singleInt(SelectorModel model, XPathNode<T> parent) async {
    final exec = DomSelectorExec<T>(selector: model, jsRuntime: jsRuntime);
    final find = await exec.find(parent);
    final result = find.index(0);
    if (result == null) return null;
    return int.tryParse(result);
  }

  Future<Color?> singleColor(SelectorModel model, XPathNode<T> parent) async {
    final exec = DomSelectorExec<T>(selector: model, jsRuntime: jsRuntime);
    final find = await exec.find(parent);
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
}
