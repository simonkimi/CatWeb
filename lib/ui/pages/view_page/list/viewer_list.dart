import 'package:catweb/app.dart';
import 'package:catweb/data/site_runtime/site_definition.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_manager.dart';
import 'package:catweb/ui/pages/view_page/list/search_list.dart';
import 'package:catweb/ui/pages/view_page/list/subpage_list.dart';
import 'package:catweb/ui/pages/view_page/viewer_provider.dart';
import 'package:catweb/ui/widgets/cupertino_app_bar.dart';
import 'package:cupertino_modal_sheet/cupertino_modal_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'subpage_notifier.dart';

class ViewerListFragment extends StatefulWidget {
  const ViewerListFragment({super.key});

  @override
  State<ViewerListFragment> createState() => _ViewerListFragmentState();
}

class _ViewerListFragmentState extends State<ViewerListFragment>
    with AutomaticKeepAliveClientMixin {
  late final SubListNotifier notifier;

  @override
  void initState() {
    super.initState();
    final page = pageConfig;
    notifier = SubListNotifier(
      endpoint: page.endpoint,
      website: viewerConfig.website,
      requestContext: page.context,
    );
    notifier.requireFirstLoad();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChangeNotifierProvider.value(
      value: notifier,
      child: CupertinoPageScaffold(
        child: Selector<SubListNotifier, bool>(
          selector: (_, state) => state.pageSnapshot.loadedCount > 0,
          builder: (context, hasItem, _) => CupertinoAppBar(
            canHide: hasItem,
            title: endpoint.name,
            leading: _buildLeading(context),
            actions: _buildActions(context),
            child: SubPageListFragment(
              hasTabBar: false,
              hasToolBar: viewerConfig.hasToolBar,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLeading(BuildContext context) => CupertinoButton(
    padding: EdgeInsets.zero,
    onPressed: () {
      showCupertinoModalSheet(
        context: context,
        builder: (_) => const SiteManager(),
      );
    },
    minimumSize: Size.zero,
    child: const Icon(CupertinoIcons.layers_alt),
  );

  List<Widget> _buildActions(BuildContext context) {
    if (!_supportsSearch(endpoint)) return const [];
    return [
      CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: () async {
          final query = await context.to<String>(const SearchPage(), [
            Provider.value(value: pageConfig),
            Provider.value(value: viewerConfig),
            ChangeNotifierProvider.value(value: notifier),
          ]);
          if (query != null) await notifier.onNewSearch(query);
        },
        minimumSize: Size.zero,
        child: const Icon(CupertinoIcons.search),
      ),
    ];
  }

  bool _supportsSearch(EndpointRule rule) {
    if (rule.links.autocomplete != null ||
        rule.request.url.contains('{search}')) {
      return true;
    }
    return rule.request.query.values.any(
      (value) => value is String && value.contains('{search}'),
    );
  }

  EndpointRule get endpoint => pageConfig.endpoint;
  PageConfigProvider get pageConfig => context.read();
  ViewerConfigProvider get viewerConfig => context.read();

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    notifier.dispose();
    super.dispose();
  }
}
