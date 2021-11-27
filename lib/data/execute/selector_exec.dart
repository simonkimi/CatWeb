import 'package:catweb/data/protocol/model/selector.dart';
import 'package:catweb/gen/protobuf/selector.pbserver.dart';
import 'package:xpath_selector/xpath_selector.dart';

class HtmlXmlSelectorExec {
  HtmlXmlSelectorExec({
    required this.selector,
    required this.root,
  }) : path = selector.selector.value;

  final SelectorModel selector;
  final XPathElement root;
  final String path;

  List<String> exec() {
    // 默认值
    if (path.isEmpty) {
      if (selector.defaultValue.value.isNotEmpty) {
        return [selector.defaultValue.value];
      }
      return [];
    }

    // xpath选择器
    if (path.startsWith('/')) {
      late XPathResult result;
      if (root is HtmlElementTree) {
        result = (root as HtmlElementTree).queryXPath(path);
      } else {
        result = (root as XmlElementTree).queryXPath(path);
      }

      // 如果是自动模式
      List<String> selectResult;
      if (selector.function.value == SelectorFunction.auto) {
        // 如果有attr值则选择attr值
        if (result.attr != null) {
          selectResult = result.attrs.whereType<String>().toList();
        } else {
          // 没有attr返回text
          selectResult =
              result.elements.map((e) => e.text).whereType<String>().toList();
        }
      } else {
        // 非自动模式, 按照给定计算
        selectResult = result.elements
            .map((e) => _callFunction(e))
            .whereType<String>()
            .toList()
            .cast();
      }

      // 正则处理
      return selectResult.map(_callReg).whereType<String>().toList();
    }

    // css选择器, 只对html起效
    if (root is HtmlElementTree) {
      final result = (root as HtmlElementTree)
          .element
          .querySelectorAll(selector.selector.value);

      // 如果是自动模式, 选取text
      List<String> selectResult;
      if (selector.function.value == SelectorFunction.auto) {
        selectResult = result.map((e) => e.text).whereType<String>().toList();
      } else {
        // 非自动模式
        selectResult = result
            .map((e) => _callFunction(HtmlElementTree(e)))
            .whereType<String>()
            .toList()
            .cast();
      }

      // 正则处理
      return selectResult.map(_callReg).whereType<String>().toList();
    } else {
      throw UnsupportedError('Xml只能使用XPath选择器');
    }
  }

  String? _callFunction(XPathNode element) {
    if (element is! XPathElement) return null;
    switch (selector.function.value) {
      case SelectorFunction.attr:
        for (final p in selector.param.value.split(';')) {
          if (element.attributes.containsKey(p)) {
            return element.attributes[p];
          }
        }
        return null;
      case SelectorFunction.raw:
        return element is HtmlElementTree
            ? (element).element.innerHtml
            : (element as XmlElementTree).element.innerXml;
      case SelectorFunction.text:
        return element.text;
      case SelectorFunction.auto:
        break;
    }
  }

  String? _callReg(String input) {
    if (selector.regex.value.isNotEmpty) {
      final RegExp reg = RegExp(selector.regex.value);
      final match = reg.allMatches(input).toList();
      if (match.isEmpty) return null;
      if (selector.replace.value.isEmpty) {
        final m = match[0];
        return m.group(m.groupCount)!;
      } else {
        var rep = selector.replace.value;
        for (var i = match.length; i >= 1; i--) {
          rep = rep.replaceAll('\$$i', match[i - 1][1]!);
        }
        return rep;
      }
    } else {
      return input;
    }
  }
}

String? selectJson({
  required SelectorModel selector,
  required Map<String, dynamic> json,
}) {
  final path = selector.selector.value;

  // 默认值
  if (path.isEmpty) {
    if (selector.defaultValue.value.isNotEmpty) {
      return selector.defaultValue.value;
    }
    return null;
  }
}
