import 'package:catweb/data/protocol/model/selector.dart';
import 'package:catweb/gen/protobuf/selector.pbserver.dart';
import 'package:catweb/utils/utils.dart';
import 'package:expressions/expressions.dart';
import 'package:xml/xml.dart';
import 'package:xpath_selector/xpath_selector.dart';
import 'package:html/dom.dart';

import 'js_runtime.dart';

class DomSelectorExec<T> {
  DomSelectorExec({
    required this.jsRuntime,
    required this.selector,
  });

  final JsRuntime jsRuntime;
  final SelectorModel selector;

  List<XPathNode<T>> findElements(XPathNode<T> root) {
    final path = selector.selector.value;
    if (path.isEmpty) return root.children;
    if (path.startsWith('/')) {
      return root.queryXPath(path).nodes;
    } else if (root.node is Element) {
      final elements =
          (root.node as Element).querySelectorAll(selector.selector.value);
      return elements.map((e) => HtmlNodeTree(e) as XPathNode<T>).toList();
    } else {
      throw UnsupportedError('Xml只能使用XPath选择器, 且必须以"/"开头');
    }
  }

  Future<List<String>> find(final XPathNode<T> root) async {
    final path = selector.selector.value;
    if (path.isEmpty) {
      if (!(selector.function.value != SelectorFunction.auto ||
          selector.param.value.isNotEmpty ||
          selector.regex.value.isNotEmpty ||
          selector.replace.value.isNotEmpty ||
          selector.js.value.isNotEmpty)) {
        // 默认值
        if (selector.defaultValue.value.isNotEmpty) {
          return [selector.defaultValue.value];
        } else {
          return [];
        }
      }
    }

    late List<String?> functionResult;

    if (path.isEmpty) {
      // 空选择器，直接进入function
      functionResult = [
        _callFunction(XPathResult([root], []))
      ];
    } else if (path.startsWith('/')) {
      // xpath选择器
      functionResult = [_callFunction(root.queryXPath(path))];
    } else if (root.node is Element) {
      // css选择器
      final Element? query = (root.node as Element)
          .querySelectorAll(selector.selector.value)
          .index(0);
      if (query == null) {
        return [];
      } else {
        functionResult = [
          _callFunction(XPathResult<Node>([HtmlNodeTree(query)], []))
        ];
      }
    } else {
      throw UnsupportedError('Xml只能使用XPath选择器, 且必须以"/"开头');
    }

    return (await Future.wait(
            functionResult.map(_callReg).map(_callComputed).map(_callJs)))
        .whereType<String>()
        .toList();
  }

  String? _callComputed(String? input) {
    if (input == null) return null;
    if (selector.computed.value) {
      try {
        final result =
            const ExpressionEvaluator().eval(Expression.parse(input), {});
        return result.toString();
      } on Exception {
        return null;
      }
    }
    return input;
  }

  String? _callFunction<E>(XPathResult<E> result) {
    final element = result.nodes.where((e) => e.isElement).toList().index(0);
    if (element == null) return null;
    switch (selector.function.value) {
      case SelectorFunction.attr:
        // 属性选择
        for (final p in selector.param.value.split(';')) {
          if (element.attributes.containsKey(p)) {
            return element.attributes[p];
          }
        }
        return null;
      case SelectorFunction.raw:
        // 原生内容
        return element.node is Element
            ? (element.node as Element).innerHtml
            : (element.node as XmlElement).innerXml;
      case SelectorFunction.text:
        // 内容
        return element.text;
      case SelectorFunction.auto:
        // 自动
        // 如果有attr值则选择attr值
        if (result.attr != null) {
          return result.attrs.whereType<String>().toList().index(0);
        } else {
          // 没有attr返回text
          return result.nodes
              .map((e) => e.text)
              .whereType<String>()
              .toList()
              .index(0);
        }
    }
  }

  String? _callReg(String? input) {
    if (input == null) return null;
    if (selector.regex.value.isNotEmpty) {
      final RegExp reg = RegExp(selector.regex.value);
      final match = reg.firstMatch(input);
      if (match == null) return null;
      if (selector.replace.value.isEmpty) {
        return match.group(0);
      } else {
        var rep = selector.replace.value;
        for (var i = match.groupCount; i >= 1; i--) {
          rep = rep.replaceAll('\$$i', match.group(i)!);
        }
        return rep;
      }
    } else {
      return input;
    }
  }

  Future<String?> _callJs(String? input) async {
    if (input == null) return null;
    if (selector.js.value.isNotEmpty) {
      return await jsRuntime.exec(selector.js.value, input);
    } else {
      return input;
    }
  }
}
