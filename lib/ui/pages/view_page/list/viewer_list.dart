import 'package:catweb/data/models/site_model/pages/site_page.dart';
import 'package:catweb/data/models/site_model/pages/template_list.dart';
import 'package:catweb/ui/widgets/cupertino_app_bar.dart';
import 'package:catweb/ui/widgets/tab_bar.dart';

import 'package:catweb/ui/pages/rules_add_guide/rules_manager.dart';
import 'package:catweb/ui/pages/view_page/list/search_list.dart';
import 'package:catweb/ui/pages/view_page/list/controller/subpage_controller.dart';
import 'package:catweb/ui/pages/view_page/list/subpage_list.dart';
import 'package:catweb/utils/debug.dart';
import 'package:catweb/utils/helper.dart';
import 'package:cupertino_modal_sheet/cupertino_modal_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewerListFragment extends StatefulWidget {
  const ViewerListFragment({
    super.key,
    required this.blueprint,
    this.hasToolBar = false,
  });

  final SitePage blueprint;
  final bool hasToolBar;

  @override
  State<ViewerListFragment> createState() => _ViewerListFragmentState();
}

class _ViewerListFragmentState extends State<ViewerListFragment>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  late final blueprint = widget.blueprint;
  late final extra = widget.blueprint.template as TemplateList;

  bool get useSingleWidget =>
      extra.subPages.isEmpty || extra.subPages.length == 1;

  late List<SubListController> subListController;

  late final TabController tabController;

  bool get hasSearch => widget.blueprint.url.contains('{search}');

  bool get hasFilter => extra.filters.isNotEmpty && !hasSearch;

  @override
  void initState() {
    super.initState();
    logger.i('ViewerListFragment<${blueprint.name}> 初始化');
    tabController = TabController(length: extra.subPages.length, vsync: this);

    if (useSingleWidget) {
      subListController = [
        SubListController(
          blueprint: blueprint,
          subPageModel: extra.subPages.index(0),
        )
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
      title: blueprint.name.value,
      tabBar: CupertinoCustomTabBar(
        tabs: extra.subPages
            .map((e) => CupertinoTab(e.name.value.globalEnv()))
            .toList(),
        tabController: tabController,
      ),
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
    return Obx(() => CupertinoAppBar(
          canHide: subListController.first.items.isNotEmpty,
          title: blueprint.name.value,
          leading: _buildLeading(context),
          actions: _buildActions(context),
          child: SubPageListFragment(
            controller: subListController.first,
            hasTabBar: !useSingleWidget,
            hasToolBar: widget.hasToolBar,
          ),
        ));
  }

  Widget _buildLeading(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      minSize: 0,
      child: const Icon(CupertinoIcons.layers_alt),
      onPressed: () {
        showCupertinoModalSheet(
          context: context,
          builder: (context) => Navigator(
            observers: [HeroController()],
            onGenerateRoute: (settings) => CupertinoPageRoute(
              builder: ((context) {
                return const SiteManager();
              }),
            ),
          ),
        );
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
          onPressed: () {
            Navigator.of(context).push(CupertinoPageRoute(
                builder: (context) => SearchList(blueprint: blueprint)));
          },
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
