import 'package:catweb/data/protocol/model/page.dart';
import 'package:catweb/data/protocol/model/templete.dart';
import 'package:catweb/ui/components/cupertino_app_bar.dart';
import 'package:catweb/ui/pages/view_page/viewer_subpage/list/subpage_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SearchList extends StatefulWidget {
  const SearchList({
    Key? key,
    required this.blueprint,
  }) : super(key: key);

  final PageBlueprint blueprint;

  @override
  _SearchListState createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {
  late PageBlueprint blueprint = widget.blueprint;
  late SubListController controller;
  late final extra = blueprint.templateData as TemplateListDataModel;

  bool get hasFilter => extra.filterItem.isNotEmpty;

  @override
  void initState() {
    super.initState();
    controller = SubListController(blueprint: widget.blueprint);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CupertinoScrollbar(
        child: CupertinoAppBar(
          title: '搜索',
          leading: const CupertinoBackLeading(),
          tabBar: _buildSearchInput(context),
          tabBarHeight: 40,
          actions: _buildAction(context),
          child: SmartRefresher(
            controller: controller.refreshController,
            child: const CustomScrollView(
              slivers: [],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildAction(BuildContext context) {
    return [
      if (hasFilter)
        CupertinoButton(
          padding: EdgeInsets.zero,
          minSize: 0,
          child: const Icon(Icons.filter_alt_outlined),
          onPressed: () {},
        )
    ];
  }

  Widget _buildSearchInput(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
        child: CupertinoTextField(
          decoration: BoxDecoration(
            color: CupertinoColors.systemGroupedBackground.resolveFrom(context),
            borderRadius: BorderRadius.circular(50),
          ),
          prefix: const Padding(
            padding: EdgeInsets.only(left: 5),
            child: Icon(
              CupertinoIcons.search,
              color: CupertinoColors.systemGrey,
              size: 18,
            ),
          ),
          onSubmitted: (value) {},
        ),
      ),
    );
  }
}
