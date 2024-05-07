import 'package:catweb/data/models/site/page.dart';
import 'package:catweb/data/models/site/template.dart';
import 'package:catweb/ui/pages/view_page/viewer_provider.dart';
import 'package:catweb/ui/widgets/cupertino_app_bar.dart';
import 'package:catweb/ui/widgets/tab_bar.dart';

import 'package:catweb/ui/pages/rules_add_guide/rules_manager.dart';
import 'package:catweb/ui/pages/view_page/list/search_list.dart';
import 'package:catweb/ui/pages/view_page/list/notifier/subpage_controller.dart';
import 'package:catweb/ui/pages/view_page/list/subpage_list.dart';
import 'package:catweb/utils/debug.dart';
import 'package:cupertino_modal_sheet/cupertino_modal_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewerListFragment extends StatefulWidget {
  const ViewerListFragment({super.key});

  @override
  State<ViewerListFragment> createState() => _ViewerListFragmentState();
}

class _ViewerListFragmentState extends State<ViewerListFragment>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  late final TabController tabController;
  late List<SubListController> subListController;
  bool isInit = false;

  bool get isSingleTab =>
      template.subPages.isEmpty || template.subPages.length == 1;

  bool get hasToolBar =>
      context.read<ViewerConfig>().website.displayPage.length > 1;

  SitePageRule get pageRule => context.read<PageConfig>().pageRule;

  PageTemplateList get template => pageRule.template as PageTemplateList;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (isInit) return;
    logger.i('ViewerListFragment<${pageRule.name}> 初始化');
    tabController =
        TabController(length: template.subPages.length, vsync: this);

    subListController = template.subPages.map((e) {
      return SubListController(
        siteRule: pageRule,
        subPageModel: e,
      );
    }).toList();
    tabController.addListener(() {
      subListController[tabController.index].requestFirstLoad();
    });
    subListController.first.requestFirstLoad();
    isInit = true;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CupertinoPageScaffold(
      child: isSingleTab
          ? _buildSingleViewer(context)
          : _buildMultiViewer(context),
    );
  }

  Widget _buildMultiViewer(BuildContext context) {
    return CupertinoAppBar(
      title: template.name,
      tabBar: CupertinoCustomTabBar(
        tabs: template.subPages.map((e) => CupertinoTab(e.name)).toList(),
        tabController: tabController,
      ),
      leading: _buildLeading(context),
      actions: _buildActions(context),
      child: TabBarView(
        controller: tabController,
        children: subListController.map((e) {
          return ChangeNotifierProvider.value(
            value: e,
            child: SubPageListFragment(
              controller: e,
              hasTabBar: !isSingleTab,
              hasToolBar: hasToolBar,
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildSingleViewer(BuildContext context) {
    return CupertinoAppBar(
      canHide: subListController.first.items.isNotEmpty,
      title: pageRule.name,
      leading: _buildLeading(context),
      actions: _buildActions(context),
      child: SubPageListFragment(
        controller: subListController.first,
        hasTabBar: !isSingleTab,
        hasToolBar: hasToolBar,
      ),
    );
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
      if (pageRule.url.contains('{search}'))
        CupertinoButton(
          padding: EdgeInsets.zero,
          minSize: 0,
          child: const Icon(CupertinoIcons.search),
          onPressed: () {
            Navigator.of(context).push(
                CupertinoPageRoute(builder: (context) => const SearchList()));
          },
        ),
      if (template.filters.isNotEmpty)
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

  @override
  void dispose() {
    super.dispose();
    for (var value in subListController) {
      value.dispose();
    }
  }
}
