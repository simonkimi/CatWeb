import 'package:catweb/data/protocol/model/parser.dart';
import 'package:catweb/gen/protobuf/parser.pbenum.dart';
import 'package:catweb/ui/components/tab_bar.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_parser/parser/auto_complete_parser.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_parser/parser/extra_parser.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_parser/parser/gallery_parser.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_parser/parser/list_parser.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RulesParserEditor extends StatelessWidget {
  const RulesParserEditor({
    Key? key,
    required this.model,
  }) : super(key: key);

  final ParserBaseModel model;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: CupertinoPageScaffold(
        navigationBar: _buildAppbar(context),
        child: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return CupertinoTabBarView(
      children: [
        _buildEditor(context),
        ExtraParser(model: model),
      ],
      tabs: const [
        CupertinoTab('基础规则'),
        CupertinoTab('附加字段'),
      ],
    );
  }

  CupertinoNavigationBar _buildAppbar(BuildContext context) {
    return CupertinoNavigationBar(
      leading: CupertinoButton(
        onPressed: () => Get.back(),
        child: const Icon(CupertinoIcons.back),
        padding: EdgeInsets.zero,
        minSize: 0,
      ),
      middle: const Text('规则'),
      border: const Border(),
    );
  }

  Widget _buildEditor(BuildContext context) {
    switch (model.type) {
      case ParserType.PARSER_TYPE_GALLERY:
        return GalleryParserFragment(model: model as GalleryParserModel);
      case ParserType.PARSER_TYPE_LIST_VIEW:
        return ListParserFragment(model: model as ListViewParserModel);
      case ParserType.PARSER_TYPE_AUTO_COMPLETE:
        return SearchAutoCompleteParser(
            model: model as AutoCompleteParserModel);
      case ParserType.PARSER_TYPE_IMAGE:
        break;
    }
    throw Exception('未知的解析器类型 ${model.type}');
  }
}
