import 'package:catweb/data/protocol/model/selector.dart';
import 'package:catweb/gen/protobuf/selector.pbserver.dart';
import 'package:xml/xml.dart';
import 'package:xpath_selector/xpath_selector.dart';
import 'package:html/dom.dart';


extension SelectorExec<T> on SelectorModel {
  List<String> resolve(final XPathNode<T> root) {
    final path = selector.value;
    // 默认值
    if (path.isEmpty) {
      if (defaultValue.value.isNotEmpty) {
        return [defaultValue.value];
      }
      return [];
    }

    // xpath选择器
    if (path.startsWith('/')) {
      XPathResult<T> result = root.queryXPath(path);

      // 如果是自动模式
      List<String> selectResult;
      if (function.value == SelectorFunction.auto) {
        // 如果有attr值则选择attr值
        if (result.attr != null) {
          selectResult = result.attrs.whereType<String>().toList();
        } else {
          // 没有attr返回text
          selectResult =
              result.nodes.map((e) => e.text).whereType<String>().toList();
        }
      } else {
        // 非自动模式, 按照给定计算
        selectResult = result.nodes
            .map((e) => _callFunction(e))
            .whereType<String>()
            .toList();
      }

      // 正则处理
      return selectResult.map(_callReg).whereType<String>().toList();
    }

    // css选择器, 只对html起效
    if (root.node is Element) {
      final result = (root.node as Element).querySelectorAll(selector.value);

      // 如果是自动模式, 选取text
      List<String> selectResult;
      if (function.value == SelectorFunction.auto) {
        selectResult = result.map((e) => e.text).whereType<String>().toList();
      } else {
        // 非自动模式
        selectResult = result
            .map((e) => _callFunction(HtmlNodeTree(e) as XPathNode<T>))
            .whereType<String>()
            .toList();
      }

      // 正则处理
      return selectResult.map(_callReg).whereType<String>().toList();
    } else {
      throw UnsupportedError('Xml只能使用XPath选择器');
    }
  }

  String? _callFunction(XPathNode<T> element) {
    if (!element.isElement) return null;
    switch (function.value) {
      case SelectorFunction.attr:
        for (final p in param.value.split(';')) {
          if (element.attributes.containsKey(p)) {
            return element.attributes[p];
          }
        }
        return null;
      case SelectorFunction.raw:
        return element.node is Element
            ? (element.node as Element).innerHtml
            : (element.node as XmlElement).innerXml;
      case SelectorFunction.text:
        return element.text;
      case SelectorFunction.auto:
        break;
    }
  }

  String? _callReg(String input) {
    if (regex.value.isNotEmpty) {
      final RegExp reg = RegExp(regex.value);
      final match = reg.allMatches(input).toList();
      if (match.isEmpty) return null;
      if (replace.value.isEmpty) {
        final m = match[0];
        return m.group(m.groupCount)!;
      } else {
        var rep = replace.value;
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

// String? selectJson({
//   required SelectorModel selector,
//   required Map<String, dynamic> json,
// }) {
//   final path = selector.selector.value;
//
//   // 默认值
//   if (path.isEmpty) {
//     if (selector.defaultValue.value.isNotEmpty) {
//       return selector.defaultValue.value;
//     }
//     return null;
//   }
// }
