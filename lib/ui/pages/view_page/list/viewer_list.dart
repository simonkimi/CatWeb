import 'package:catweb/data/models/site/page.dart';
import 'package:catweb/data/models/site/template.dart';
import 'package:catweb/ui/pages/view_page/viewer_provider.dart';
import 'package:catweb/ui/widgets/cupertino_app_bar.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_manager.dart';
import 'package:catweb/ui/pages/view_page/list/search_list.dart';
import 'package:catweb/ui/pages/view_page/list/subpage_list.dart';
import 'package:cupertino_modal_sheet/cupertino_modal_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'notifier/subpage_notifier.dart';

class ViewerListFragment extends StatefulWidget {
  const ViewerListFragment({super.key});

  @override
  State<ViewerListFragment> createState() => _ViewerListFragmentState();
}

class _ViewerListFragmentState extends State<ViewerListFragment>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChangeNotifierProvider(
      create: (_) => SubListNotifier(
        siteRule: pageRule,
        subPageModel: template.subPages.first,
      ),
      child: CupertinoPageScaffold(
        child: CupertinoAppBar(
          canHide: context.watch<SubListNotifier>().items.isNotEmpty,
          title: pageRule.name,
          leading: _buildLeading(context),
          actions: _buildActions(context),
          child: SubPageListFragment(
            hasTabBar: false,
            hasToolBar: viewerConfig.hasToolBar,
          ),
        ),
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
            Navigator.of(context).push(CupertinoPageRoute(
                builder: (context) => const SearchPage(searchKey: searchKey)));
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

  ViewerConfigProvider get viewerConfig => context.read<ViewerConfigProvider>();

  SitePageRule get pageRule => context.read<PageConfigProvider>().pageRule;

  PageTemplateList get template => pageRule.template as PageTemplateList;

  @override
  void dispose() {
    super.dispose();
    for (var value in subListNotifierList) {
      value.dispose();
    }
  }
}
