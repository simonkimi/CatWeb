import 'package:catweb/data/models/site/page.dart';
import 'package:catweb/data/models/site/template.dart';
import 'package:catweb/ui/pages/view_page/viewer_provider.dart';
import 'package:catweb/ui/widgets/cupertino_app_bar.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_manager.dart';
import 'package:catweb/ui/pages/view_page/list/search_list.dart';
import 'package:catweb/ui/pages/view_page/list/subpage_list.dart';
import 'package:cupertino_modal_sheet/cupertino_modal_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

import 'subpage_notifier.dart';

class ViewerListFragment extends HookWidget {
  const ViewerListFragment({super.key});

  @override
  Widget build(BuildContext context) {
    useAutomaticKeepAlive();
    ViewerConfigProvider viewerConfig = context.read();
    SitePageRule pageRule = context.read<PageConfigProvider>().pageRule;
    PageTemplateList template = pageRule.template as PageTemplateList;

    return ChangeNotifierProvider(
      create: (_) => SubListNotifier(
        siteRule: pageRule,
        subPageModel: template.subPages.first,
      ),
      builder: (context, _) {
        return CupertinoPageScaffold(
          child: Selector<SubListNotifier, bool>(
            selector: (_, n) => n.items.isNotEmpty,
            builder: (context, value, child) {
              return CupertinoAppBar(
                canHide: value,
                title: pageRule.name,
                leading: _buildLeading(context),
                actions: _buildActions(
                  context,
                  viewerConfig,
                  pageRule,
                  template,
                ),
                child: child!,
              );
            },
            child: SubPageListFragment(
              hasTabBar: false,
              hasToolBar: viewerConfig.hasToolBar,
            ),
          ),
        );
      },
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
            return Navigator(
              observers: [HeroController()],
              onGenerateRoute: (settings) {
                return CupertinoPageRoute(builder: ((_) {
                  return const SiteManager();
                }));
              },
            );
          },
        );
      },
    );
  }

  List<Widget> _buildActions(
    BuildContext context,
    ViewerConfigProvider viewerConfig,
    SitePageRule pageRule,
    PageTemplateList template,
  ) {
    return [
      if (pageRule.url.contains('{search}'))
        CupertinoButton(
          padding: EdgeInsets.zero,
          minSize: 0,
          child: const Icon(CupertinoIcons.search),
          onPressed: () {
            Navigator.of(context).push(CupertinoPageRoute(builder: (_) {
              return MultiProvider(
                providers: [
                  Provider.value(value: pageRule),
                  Provider.value(value: viewerConfig),
                  ChangeNotifierProvider.value(
                      value: context.read<SubListNotifier>())
                ],
                child: const SearchPage(),
              );
            }));
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
}
