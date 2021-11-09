import 'package:catweb/data/protocol/model/parser.dart';
import 'package:catweb/ui/components/app_bar.dart';
import 'package:catweb/ui/fragments/parser/extra_parser.dart';
import 'package:catweb/ui/fragments/parser/gallery_parser.dart';
import 'package:catweb/ui/fragments/parser/gallery_preview.dart';
import 'package:catweb/ui/fragments/parser/list_parser.dart';
import 'package:catweb/ui/fragments/parser/list_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'editor_store.dart';

class RulesParserEditor extends StatelessWidget {
  RulesParserEditor({
    Key? key,
    required this.type,
    dynamic model,
  })  : store = EditorStore(type: type, model: model),
        super(key: key);

  static String routeName = 'rules_parser_editor';

  final ParserType type;

  final EditorStore store;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: buildAppBar(
          context,
          title: '规则编辑',
          bottom: const TabBar(
            tabs: [
              Tab(text: '预览'),
              Tab(text: '基础规则'),
              Tab(text: '附加字段'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            buildPreview(context),
            buildBody(context),
            buildExtra(),
          ],
        ),
      ),
    );
  }

  Widget buildPreview(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(5),
      children: [
        if (store.parserBase is GalleryParserModel) const GalleryPreview(),
        const SizedBox(),
        if (store.parserBase is ListViewParserModel) const ListParserPreview(),
      ],
    );
  }

  Widget buildBody(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(5),
      children: [
        if (store.parserBase is GalleryParserModel)
          GalleryParserFragment(model: store.parserBase as GalleryParserModel),
        if (store.parserBase is ListViewParserModel)
          ListParserFragment(model: store.parserBase as ListViewParserModel),
      ],
    );
  }

  Widget buildExtra() {
    return Observer(
      builder: (context) {
        return ListView(
          padding: const EdgeInsets.all(5),
          children: [
            ExtraParser(model: store.parserBase),
          ],
        );
      },
    );
  }
}
