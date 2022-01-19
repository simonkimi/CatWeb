import 'package:catweb/data/protocol/model/parser.dart';
import 'package:catweb/gen/protobuf/selector.pbserver.dart';
import 'package:catweb/network/parser_exec/parser_exec.dart';
import 'package:catweb/ui/model/detail_model.dart';
import 'package:xpath_selector/xpath_selector.dart';

import 'extra_parser.dart';
import 'html_xpath_model.dart';
import 'package:universal_html/html.dart';
import 'package:xml/xml.dart';

ParserResult<GalleryDetailModel> galleryParserExec(
    ParserParam<GalleryParserModel> param) {
  ParserResult<GalleryDetailModel> _xmlHtml() {
    final parser = param.parser;
    late DomParserExec dom;

    late XPath root;
    if (param.source.substring(0, 20).contains('xml')) {
      root = XPath.xml(param.source);
      dom = DomParserExec<XmlNode>(env: param.globalEnv);
    } else {
      root = UniversalHtmlTree.parse(param.source);
      dom = DomParserExec<Node>(env: param.globalEnv);
    }

    final global = <String, String>{};
    final local = <String, String>{};

    xmlHtmlExtra(
      domSelector: dom,
      extras: parser.extraSelectorModel.where(
          (p0) => p0.type.value == ExtraSelectorType.EXTRA_SELECTOR_TYPE_NONE),
      root: root,
      onGlobalEnv: (key, value) => global[key] = value,
      onLocalEnv: (key, value) => local[key] = value,
    );

    final result = GalleryDetailModel(
      title: dom.string(parser.title, root.root),
      subtitle: dom.string(parser.subtitle, root.root),
      tag: dom.string(parser.tag, root.root),
      tagColor: dom.color(parser.tagColor, root.root),
      star: dom.double(parser.star, root.root),
      description: dom.string(parser.description, root.root),
      imageCount: dom.int(parser.imgCount, root.root),
      language: dom.string(parser.language, root.root),
      uploadTime: dom.string(parser.uploadTime, root.root),
      badgeList: dom
          .nodes(parser.badgeSelector, root.root)
          .map((e) {
            return BadgeModel(
              env: xmlHtmlLocalExtra(
                domSelector: dom,
                extras: parser.extraSelectorModel,
                root: root.root,
                filter: ExtraSelectorType.EXTRA_SELECTOR_TYPE_GALLERY_BADGE,
              ),
              text: dom.string(parser.badgeText, e),
              category: dom.string(parser.badgeType, e),
            );
          })
          .where((e) => e.text != null)
          .toList(),
      commentList: dom.nodes(parser.commentSelector, root.root).map((e) {
        return CommentItemModel(
          env: xmlHtmlLocalExtra(
            domSelector: dom,
            extras: parser.extraSelectorModel,
            root: root.root,
            filter: ExtraSelectorType.EXTRA_SELECTOR_TYPE_GALLERY_COMMENT,
          ),
          comment: dom.string(parser.comments.content, e),
          commentTime: dom.string(parser.comments.postTime, e),
          score: dom.int(parser.comments.vote, e),
          username: dom.string(parser.comments.username, e),
        );
      }).toList(),
    );

    return ParserResult<GalleryDetailModel>(
      result: result,
      globalEnv: global,
      localEnv: local,
    );
  }

  return _xmlHtml();
}
