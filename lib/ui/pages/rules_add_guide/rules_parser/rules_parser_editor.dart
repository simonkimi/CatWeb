import 'package:catweb/data/protocol/model/parser.dart';
import 'package:catweb/ui/components/tab_bar.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_parser/parser/extra_parser.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_parser/parser/gallery_parser.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_parser/parser/gallery_preview.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_parser/parser/list_parser.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_parser/parser/list_preview.dart';

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
        if (model.type != ParserType.imageParser) _buildPreview(context),
        _buildEditor(context),
        ExtraParser(model: model),
      ],
      tabs: [
        if (model.type != ParserType.imageParser) const CupertinoTab('预览'),
        const CupertinoTab('基础规则'),
        const CupertinoTab('附加字段'),
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

  Widget _buildPreview(BuildContext context) {
    switch (model.type) {
      case ParserType.galleryParser:
        return const GalleryPreview();
      case ParserType.listParser:
        return const ListParserPreview();
      case ParserType.imageParser:
        return const SizedBox();
    }
  }

  Widget _buildEditor(BuildContext context) {
    switch (model.type) {
      case ParserType.galleryParser:
        return GalleryParserFragment(model: model as GalleryParserModel);
      case ParserType.listParser:
        return ListParserFragment(model: model as ListViewParserModel);
      default:
        return const SizedBox();
    }
  }
}
