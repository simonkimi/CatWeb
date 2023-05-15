import 'package:catweb/data/models/site_model/parser/parser.dart'
    hide ParserType;
import 'package:catweb/data/protocol/model/parser.dart';
import 'package:catweb/gen/protobuf/parser.pbenum.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_parser/new_parser/auto_complete.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_parser/new_parser/list_parser.dart';
import 'package:catweb/ui/widgets/tab_bar.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_parser/parser/extra_parser.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_parser/parser/gallery_parser.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_parser/parser/image_parser.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'new_parser/extra_parser.dart';

class RulesParserEditor extends StatelessWidget {
  const RulesParserEditor({
    super.key,
    required this.model,
  });

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
      tabs: const [
        CupertinoTab('基础规则'),
        CupertinoTab('附加字段'),
      ],
      children: [
        _buildEditor(context),
        // ExtraParser(model: model),
        NewExtraParser(
          parser: GalleryParser(
            name: '123123',
            uuid: '12132',
          ),
        ),
      ],
    );
  }

  CupertinoNavigationBar _buildAppbar(BuildContext context) {
    return CupertinoNavigationBar(
      leading: CupertinoButton(
        onPressed: () => Get.back(),
        padding: EdgeInsets.zero,
        minSize: 0,
        child: const Icon(CupertinoIcons.back),
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
        // return ListParserFragment(model: model as ListViewParserModel);
        return NewListParser();
      case ParserType.PARSER_TYPE_AUTO_COMPLETE:
        // return SearchAutoCompleteParser(
        //     model: model as AutoCompleteParserModel);
        return AutoCompleteParserEdit();
      case ParserType.PARSER_TYPE_IMAGE:
        return ImageReaderParserFragment(
            model: model as ImageReaderParserModel);
    }
    throw Exception('未知的解析器类型 ${model.type}');
  }
}
