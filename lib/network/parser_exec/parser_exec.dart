import 'dart:core' as core;
import 'dart:core';
import 'package:catweb/data/execute/js_runtime.dart';
import 'package:catweb/data/execute/selector_exec.dart';
import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/data/protocol/model/selector.dart';
import 'package:catweb/utils/utils.dart';
import 'package:expressions/expressions.dart';
import 'package:flutter/cupertino.dart';
import 'package:xpath_selector/xpath_selector.dart';

class ParserResult<T> {
  ParserResult({
    required this.result,
    required this.globalEnv,
    required this.localEnv,
  });

  final T result;
  final Map<String, String> globalEnv;
  final Map<String, String> localEnv;
}

class ParserParam<T> {
  ParserParam({
    required this.parser,
    required this.source,
    required this.globalEnv,
  });

  final T parser;
  final String source;
  final SiteEnvModel globalEnv;
}

class DomParserExec<T> {
  DomParserExec({
    required this.env,
  }) : jsRuntime = JsRuntime();

  final SiteEnvModel env;

  final JsRuntime jsRuntime;

  List<XPathNode<T>> nodes(SelectorModel parser, XPathNode<T> parent) {
    if (parser.selector.value.isEmpty) return [];
    return DomSelectorExec<T>(selector: parser, jsRuntime: jsRuntime)
        .findElements(parent);
  }

  String? string(SelectorModel parser, XPathNode<T> parent) {
    try {
      final find = DomSelectorExec<T>(
        selector: parser,
        jsRuntime: jsRuntime,
      ).find(parent);
      return env.resolve(find.index(0));
    } on Error {
      return 'Error';
    }
  }

  core.double? double(SelectorModel parser, XPathNode<T> parent) {
    try {
      final find = DomSelectorExec<T>(
        selector: parser,
        jsRuntime: jsRuntime,
      ).find(parent);
      var result = find.index(0);

      if (result == null) return null;
      final currentDouble = core.double.tryParse(result);
      if (currentDouble == null) {
        result = _compute(result);
      }

      if (result == null) return null;
      return core.double.tryParse(result);
    } on Error {
      return 0.0;
    }
  }

  core.int? int(SelectorModel parser, XPathNode<T> parent) {
    try {
      final find = DomSelectorExec<T>(
        selector: parser,
        jsRuntime: jsRuntime,
      ).find(parent);
      String? result = find.index(0);

      if (result == null) return null;
      final currentInt = core.int.tryParse(result);
      if (currentInt == null) {
        result = _compute(result);
      }
      if (result == null) return null;

      return core.int.tryParse(result);
    } on Error {
      return -1;
    }
  }

  Color? color(
    SelectorModel parser,
    XPathNode<T> parent, {
    bool computed = false,
  }) {
    try {
      final find = DomSelectorExec<T>(
        selector: parser,
        jsRuntime: jsRuntime,
      ).find(parent);
      final result = find.index(0)?.trim().toLowerCase();
      if (result == null) return null;
      if (result.startsWith('0x')) {
        return Color(
            core.int.parse(result.substring(2), radix: 16) | 0xff000000);
      } else if (result.startsWith('#')) {
        return Color(
            core.int.parse(result.substring(1), radix: 16) | 0xff000000);
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
          ((core.double.tryParse(match[3][0]!) ?? 1) * 255).floor(),
          _getColorInt(match[0][0]!),
          _getColorInt(match[1][0]!),
          _getColorInt(match[2][0]!),
        );
      }
    } on Error {
      return null;
    }
  }

  core.int _getColorInt(String input) {
    if (input.endsWith('%')) {
      return (255 *
              (core.int.parse(input.substring(0, input.length - 1)) / 100))
          .floor();
    } else {
      return core.double.parse(input).floor();
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
