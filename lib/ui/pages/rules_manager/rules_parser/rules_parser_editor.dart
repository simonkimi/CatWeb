import 'package:catweb/data/protocol/model/parser.dart';
import 'package:catweb/ui/components/dialog.dart';
import 'package:catweb/ui/components/grey_tab_indicator.dart';
import 'package:catweb/ui/fragments/parser/extra_parser.dart';
import 'package:catweb/ui/fragments/parser/gallery_parser.dart';
import 'package:catweb/ui/fragments/parser/gallery_preview.dart';
import 'package:catweb/ui/fragments/parser/list_parser.dart';
import 'package:catweb/ui/fragments/parser/list_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../themes.dart';

class RulesParserEditor extends StatefulWidget {
  const RulesParserEditor({
    Key? key,
    required this.model,
  }) : super(key: key);

  static String routeName = 'rules_parser_editor';

  final ParserBaseModel model;

  @override
  _RulesParserEditorState createState() => _RulesParserEditorState();
}

class _RulesParserEditorState extends State<RulesParserEditor> {
  late final ParserBaseModel model = widget.model;

  CupertinoNavigationBar buildAppbar(BuildContext context) {
    return CupertinoNavigationBar(
      leading: CupertinoButton(
        onPressed: () {
          showExitConferDialog(context).then((value) {
            if (value == true) {
              Navigator.of(context).pop();
            }
          });
        },
        child: const Icon(CupertinoIcons.back),
        padding: EdgeInsets.zero,
        minSize: 0,
      ),
      middle: const Text('规则'),
      trailing: CupertinoButton(
        onPressed: () {},
        child: const Icon(Icons.save_outlined),
        padding: EdgeInsets.zero,
        minSize: 0,
      ),
      border: const Border(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => showExitConferDialog(context),
      child: DefaultTabController(
        length: 3,
        child: CupertinoPageScaffold(
          navigationBar: buildAppbar(context),
          child: SafeArea(
            child: Column(
              children: [
                buildTabBar(context),
                Expanded(
                  child: TabBarView(
                    children: [
                      buildPreview(context),
                      buildBody(context),
                      ExtraParser(model: model),
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
    switch (model.type) {
      case ParserType.galleryParser:
        return const GalleryPreview();
      case ParserType.listParser:
        return const ListParserPreview();
      default:
        return const SizedBox();
    }
  }

  Widget buildBody(BuildContext context) {
    switch (model.type) {
      case ParserType.galleryParser:
        return GalleryParserFragment(model: model as GalleryParserModel);
      case ParserType.listParser:
        return ListParserFragment(model: model as ListViewParserModel);
      default:
        return const SizedBox();
    }
  }

  Widget buildTabBar(BuildContext context) {
    return Material(
      color: CupertinoTheme.of(context).barBackgroundColor,
      child: TabBar(
        padding: EdgeInsets.zero,
        overlayColor: MaterialStateProperty.all(Colors.blue),
        indicator: const GreyUnderlineTabIndicator(),
        tabs: [
          buildTab(context: context, text: '预览'),
          buildTab(context: context, text: '基础规则'),
          buildTab(context: context, text: '附加字段'),
        ],
      ),
    );
  }

  Tab buildTab({
    required BuildContext context,
    required String text,
  }) {
    return Tab(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          color: FixColor.title.resolveFrom(context),
        ),
      ),
      height: 30,
    );
  }
}
