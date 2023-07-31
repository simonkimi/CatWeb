import 'package:catweb/data/models/site_model/parser/parser.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_parser/editor/auto_complete.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_parser/editor/extra_parser.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_parser/editor/gallery_parser.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_parser/editor/image_parser.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_parser/editor/list_parser.dart';
import 'package:catweb/ui/widgets/tab_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RulesParserEditor extends StatelessWidget {
  const RulesParserEditor({
    super.key,
    required this.model,
  });

  final IParserBase model;

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
        ExtraParserEditor(
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
    switch (model.parserType) {
      case ParserType.gallery:
        return GalleryParserEditor(parser: model as GalleryParser);
      case ParserType.listView:
        return ListParserEditor(parser: model as ListViewParser);
      case ParserType.autoComplete:
        return AutoCompleteParserEditor(parser: model as AutoCompleteParser);
      case ParserType.imageReader:
        return NewImageParserEditor(parser: model as ImageReaderParser);
    }
  }
}
