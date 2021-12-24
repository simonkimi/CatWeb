import 'package:universal_html/parsing.dart';
import 'package:xpath_selector/xpath_selector.dart';
import 'package:universal_html/html.dart';

class UniversalHtmlTree extends XPathNode<Node> {
  UniversalHtmlTree(Node node) : super(node);

  static XPath<Node> parse(String input) {
    final dom = parseHtmlDocument(input).documentElement;
    if (dom == null) throw UnsupportedError('No html');
    return XPath<Node>(UniversalHtmlTree(dom));
  }

  static UniversalHtmlTree? from(Node? node) {
    if (node == null) return null;
    return UniversalHtmlTree(node);
  }

  @override
  Map<String, String> get attributes =>
      isElement ? (node as Element).attributes : {};

  @override
  List<XPathNode<Node>> get children =>
      node.childNodes.map((e) => UniversalHtmlTree(e)).toList();

  @override
  bool get isElement => node is Element;

  @override
  NodeTagName? get name =>
      isElement ? NodeTagName(localName: (node as Element).localName) : null;

  @override
  XPathNode<Node>? get nextSibling =>
      isElement ? from((node as Element).nextElementSibling) : null;

  @override
  XPathNode<Node>? get parent => from(node.parentNode);

  @override
  XPathNode<Node>? get previousSibling =>
      isElement ? from((node as Element).previousElementSibling) : null;

  @override
  String? get text => node.text;

  @override
  String toString() => node.toString();

  @override
  int get hashCode => node.hashCode;

  @override
  bool operator ==(Object other) {
    return other is UniversalHtmlTree && other.node == node;
  }
}
