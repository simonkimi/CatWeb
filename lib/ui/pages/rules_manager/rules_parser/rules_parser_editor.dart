import 'package:catweb/data/protocol/model/parser.dart';
import 'package:catweb/ui/components/app_bar.dart';
import 'package:catweb/ui/components/grey_tab_indicator.dart';
import 'package:catweb/ui/fragments/parser/extra_parser.dart';
import 'package:catweb/ui/fragments/parser/gallery_parser.dart';
import 'package:catweb/ui/fragments/parser/gallery_preview.dart';
import 'package:catweb/ui/fragments/parser/list_parser.dart';
import 'package:catweb/ui/fragments/parser/list_preview.dart';
import 'package:flutter/cupertino.dart';
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

  CupertinoNavigationBar buildAppbar(BuildContext context) {
    return CupertinoNavigationBar(
      leading: CupertinoButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Icon(CupertinoIcons.back),
        padding: EdgeInsets.zero,
        minSize: 0,
      ),
      middle: const Text('规则'),
      border: const Border(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: CupertinoPageScaffold(
        navigationBar: buildAppbar(context),
        child: SafeArea(
          child: Material(
            child: Column(
              children: [
                buildTabBar(context),
                Expanded(
                  child: TabBarView(
                    children: [
                      buildPreview(context),
                      buildBody(context),
                      buildExtra(),
                    ],
                  ),
                )
              ],
            ),
          ),
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
    if (store.parserBase is GalleryParserModel) {
      return GalleryParserFragment(
          model: store.parserBase as GalleryParserModel);
    }
    if (store.parserBase is ListViewParserModel) {
      return ListParserFragment(model: store.parserBase as ListViewParserModel);
    }
    throw UnimplementedError('UnSupport');
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

  TabBar buildTabBar(BuildContext context) {
    return TabBar(
      padding: EdgeInsets.zero,
      labelColor: CupertinoColors.systemBlue,
      indicator: const GreyUnderlineTabIndicator(),
      tabs: [
        buildTab(text: '预览'),
        buildTab(text: '基础规则'),
        buildTab(text: '附加字段'),
      ],
    );
  }

  Tab buildTab({required String text}) {
    return Tab(
      child: Text(
        text,
        style: const TextStyle(fontSize: 12),
      ),
      height: 30,
    );
  }
}
