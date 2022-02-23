import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/data/protocol/model/page.dart';
import 'package:catweb/data/protocol/model/templete.dart';
import 'package:catweb/ui/components/cupertino_app_bar.dart';
import 'package:catweb/ui/components/tab_bar.dart';

import 'package:catweb/ui/pages/rules_add_guide/rules_manager.dart';
import 'package:catweb/ui/pages/view_page/viewer_subpage/list/subpage_controller.dart';
import 'package:catweb/ui/pages/view_page/viewer_subpage/list/subpage_list.dart';
import 'package:catweb/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewerListFragment extends StatefulWidget {
  const ViewerListFragment({
    Key? key,
    required this.blueprint,
    this.hasToolBar = false,
  }) : super(key: key);

  final PageBlueprint blueprint;
  final bool hasToolBar;

  @override
  _ViewerListFragmentState createState() => _ViewerListFragmentState();
}

class _ViewerListFragmentState extends State<ViewerListFragment>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  late final blueprint = widget.blueprint;
  late final extra = widget.blueprint.templateData as TemplateListDataModel;

  bool get useSingleWidget =>
      extra.subPages.isEmpty || extra.subPages.length == 1;

  late List<SubListController> subListController;

  late final TabController tabController;

  bool get hasSearch => widget.blueprint.url.contains('{search}');

  bool get hasFilter => extra.filterItem.isNotEmpty && !hasSearch;

  @override
  void initState() {
    super.initState();
    print('ViewerListFragment<${blueprint.name.string}> 初始化');
    tabController = TabController(length: extra.subPages.length, vsync: this);

    if (useSingleWidget) {
      subListController = [
        SubListController(
            blueprint: blueprint, subPageModel: extra.subPages.index(0))
      ];
    } else {
      subListController = extra.subPages
          .map((e) => SubListController(blueprint: blueprint, subPageModel: e))
          .toList();
    }

    tabController.addListener(() {
      subListController[tabController.index].requestFirstLoad();
    });
    subListController.first.requestFirstLoad();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CupertinoPageScaffold(
      child: useSingleWidget
          ? _buildSingleViewer(context)
          : _buildMultiViewer(context),
    );
  }

  Widget _buildMultiViewer(BuildContext context) {
    return CupertinoAppBar(
      title: blueprint.name.string,
      tabs: extra.subPages
          .map((e) => CupertinoTab(e.name.string.globalEnv()))
          .toList(),
      tabController: tabController,
      leading: _buildLeading(context),
      actions: _buildActions(context),
      child: TabBarView(
        controller: tabController,
        children: subListController.map((e) {
          return SubPageListFragment(
            controller: e,
            hasTabBar: !useSingleWidget,
            hasToolBar: widget.hasToolBar,
          );
        }).toList(),
      ),
    );
  }

  Widget _buildSingleViewer(BuildContext context) {
    return CupertinoAppBar(
      title: blueprint.name.string,
      leading: _buildLeading(context),
      actions: _buildActions(context),
      child: SubPageListFragment(
        controller: subListController.first,
        hasTabBar: !useSingleWidget,
        hasToolBar: widget.hasToolBar,
      ),
    );
  }

  Widget _buildLeading(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      minSize: 0,
      child: const Icon(Icons.menu),
      onPressed: () {
        Get.to(() => const SiteManager());
      },
    );
  }

  List<Widget> _buildActions(BuildContext context) {
    return [
      if (hasSearch)
        CupertinoButton(
          padding: EdgeInsets.zero,
          minSize: 0,
          child: const Icon(CupertinoIcons.search),
          onPressed: () {},
        ),
      if (hasFilter)
        CupertinoButton(
          padding: EdgeInsets.zero,
          minSize: 0,
          child: const Icon(Icons.filter_alt_outlined),
          onPressed: () {},
        )
    ];
  }

  @override
  bool get wantKeepAlive => true;
}
