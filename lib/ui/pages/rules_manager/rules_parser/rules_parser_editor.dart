import 'package:catweb/data/protocol/model/parser.dart';
import 'package:catweb/ui/components/dialog.dart';
import 'package:catweb/ui/components/tab_bar.dart';
import 'package:catweb/ui/fragments/parser/extra_parser.dart';
import 'package:catweb/ui/fragments/parser/gallery_parser.dart';
import 'package:catweb/ui/fragments/parser/gallery_preview.dart';
import 'package:catweb/ui/fragments/parser/list_parser.dart';
import 'package:catweb/ui/fragments/parser/list_preview.dart';
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
    return WillPopScope(
      onWillPop: () => showExitConfine(context),
      child: DefaultTabController(
        length: 3,
        child: CupertinoPageScaffold(
          navigationBar: buildAppbar(context),
          child: buildBody(context),
        ),
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return CupertinoTabBarView(
      children: [
        buildPreview(context),
        buildEditor(context),
        ExtraParser(model: model),
      ],
      tabs: const [
        CupertinoTab('预览'),
        CupertinoTab('基础规则'),
        CupertinoTab('附加字段'),
      ],
    );
  }

  CupertinoNavigationBar buildAppbar(BuildContext context) {
    return CupertinoNavigationBar(
      leading: CupertinoButton(
        onPressed: () {
          showExitConfine(context).then((value) {
            if (value == true) {
              Get.back();
            }
          });
        },
        child: const Icon(CupertinoIcons.back),
        padding: EdgeInsets.zero,
        minSize: 0,
      ),
      middle: const Text('规则'),
      border: const Border(),
    );
  }

  Future<bool> showExitConfine(BuildContext context) async {
    if (model.name.value.isEmpty) {
      return (await showCupertinoConfirmDialog(
            context: context,
            title: '返回',
            content: '没有设定名称, 将不会保存\n确定不保存直接退出吗?',
          ) ==
          true);
    }
    return true;
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

  Widget buildEditor(BuildContext context) {
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
