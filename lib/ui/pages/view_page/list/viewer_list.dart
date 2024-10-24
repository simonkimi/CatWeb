import 'package:catweb/data/models/site/page.dart';
import 'package:catweb/data/models/site/template.dart';
import 'package:catweb/ui/pages/view_page/viewer_provider.dart';
import 'package:catweb/ui/widgets/cupertino_app_bar.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_manager.dart';
import 'package:catweb/ui/pages/view_page/list/search_list.dart';
import 'package:catweb/ui/pages/view_page/list/subpage_list.dart';
import 'package:catweb/ui/widgets/tab_bar.dart';
import 'package:cupertino_modal_sheet/cupertino_modal_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:catweb/app.dart';
import 'subpage_notifier.dart';

class ViewerListFragment extends StatefulWidget {
  const ViewerListFragment({super.key});

  @override
  State<ViewerListFragment> createState() => _ViewerListFragmentState();
}

class _ViewerListFragmentState extends State<ViewerListFragment>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  TabController? tabController;
  late List<SubListNotifier> sublistNotifiers;

  @override
  void initState() {
    super.initState();
    if (isSingleTab) {
      sublistNotifiers = [SubListNotifier(siteRule: pageConfig.pageRule)];
    } else {
      tabController =
          TabController(length: template.subPages.length, vsync: this);
      sublistNotifiers = template.subPages
          .map((e) =>
              SubListNotifier(siteRule: pageConfig.pageRule, subPageModel: e))
          .toList();
    }
    sublistNotifiers.first.requireFirstLoad();
    tabController?.addListener(() {
      sublistNotifiers[tabController!.index].requireFirstLoad();
    });
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

  Widget _buildLeading(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      minSize: 0,
      child: const Icon(CupertinoIcons.layers_alt),
      onPressed: () {
        showCupertinoModalSheet(
          context: context,
          builder: (_) {
            return const SiteManager();
          },
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
            context.to(const SearchPage(), [
              Provider.value(value: pageRule),
              Provider.value(value: viewerConfig),
              Provider.value(value: context.read<PageConfigProvider>()),
              ChangeNotifierProvider.value(
                  value: context.read<SubListNotifier>())
            ]);
          },
        ),
      // if (template.filter.items.isNotEmpty)
      //   ListFilterButton(
      //     initFilter: context.read<SubListNotifier>().currentFilter,
      //     onFilterChanged: (filter) {
      //       context.read<SubListNotifier>().setNewFilter(filter);
      //     },
      //   )
    ];
  }

  Widget _buildMultiViewer(BuildContext context) {
    return CupertinoAppBar(
      title: pageRule.name,
      tabBar: CupertinoCustomTabBar(
        tabs: template.subPages.map((e) => CupertinoTab(e.name)).toList(),
        tabController: tabController!,
      ),
      leading: _buildLeading(context),
      actions: _buildActions(context),
      child: TabBarView(
        controller: tabController,
        children: sublistNotifiers.map((notifier) {
          return ChangeNotifierProvider.value(
            value: notifier,
            builder: (context, child) {
              return SubPageListFragment(
                hasTabBar: true,
                hasToolBar: viewerConfig.hasToolBar,
              );
            },
          );
        }).toList(),
      ),
    );
  }

  Widget _buildSingleViewer(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: sublistNotifiers.first,
      builder: (context, child) {
        return Selector<SubListNotifier, bool>(
          selector: (context, n) => n.items.isNotEmpty,
          builder: (context, hasItem, child) {
            return CupertinoAppBar(
              canHide: hasItem,
              leading: _buildLeading(context),
              actions: _buildActions(context),
              child: SubPageListFragment(
                hasTabBar: false,
                hasToolBar: viewerConfig.hasToolBar,
              ),
            );
          },
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;

  SitePageRule get pageRule => pageConfig.pageRule;

  PageConfigProvider get pageConfig => context.read();

  ViewerConfigProvider get viewerConfig => context.read();

  PageTemplateList get template =>
      pageConfig.pageRule.template as PageTemplateList;

  bool get isSingleTab =>
      template.subPages.length == 1 || template.subPages.isEmpty;

  @override
  void dispose() {
    super.dispose();
    tabController?.dispose();
    for (var element in sublistNotifiers) {
      element.dispose();
    }
  }
}
