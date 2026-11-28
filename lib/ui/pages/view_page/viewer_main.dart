import 'package:bot_toast/bot_toast.dart';
import 'package:catweb/data/controller/site.dart';
import 'package:catweb/data/database/database.dart';
import 'package:catweb/data/loading/load_failure.dart';
import 'package:catweb/data/models/site_render_model.dart';
import 'package:catweb/i18n.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_add_page.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_manager.dart';
import 'package:catweb/ui/layout/window_size.dart';
import 'package:catweb/ui/pages/view_page/empty/empty.dart';
import 'package:catweb/ui/pages/view_page/viewer_provider.dart';
import 'package:catweb/ui/pages/view_page/viewer_subpage_scaffold.dart';
import 'package:catweb/ui/widgets/side_navigation.dart';
import 'package:catweb/utils/context_helper.dart';
import 'package:catweb/utils/icons.dart';
import 'package:cupertino_modal_sheet/cupertino_modal_sheet.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

class ViewerMain extends HookWidget {
  const ViewerMain({required this.siteService, super.key});

  final SiteService siteService;

  @override
  Widget build(BuildContext context) {
    final lastClickBack = useState<int>(0);

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (lastClickBack.value + 1000 <
            DateTime.now().millisecondsSinceEpoch) {
          lastClickBack.value = DateTime.now().millisecondsSinceEpoch;
          BotToast.showText(text: I.of(context).press_again_to_exist);
          return;
        }
        context.pop();
      },
      child: ValueListenableBuilder(
        valueListenable: siteService.currentSiteNotifier,
        builder: (BuildContext context, SiteRenderConfigModel? website, _) {
          if (website == null) {
            return ValueListenableBuilder<LoadFailure?>(
              valueListenable: siteService.loadFailureNotifier,
              builder: (_, failure, _) => failure == null
                  ? const EmptyFragment()
                  : _SiteLoadFailure(
                      message: failure.toString(),
                      failedSite: siteService.failedSite,
                    ),
            );
          }
          return Provider(
            create: (_) => ViewerConfigProvider(website: website),
            child: _buildBody(context, website),
          );
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context, SiteRenderConfigModel website) {
    if (website.displayPage.isEmpty) {
      return const EmptyFragment();
    }
    if (website.displayPage.length <= 1) {
      return ViewerPage(endpoint: website.displayPage.first, website: website);
    }

    return _SiteNavigationShell(website: website);
  }
}

class _SiteNavigationShell extends StatefulWidget {
  const _SiteNavigationShell({required this.website});

  final SiteRenderConfigModel website;

  @override
  State<_SiteNavigationShell> createState() => _SiteNavigationShellState();
}

class _SiteNavigationShellState extends State<_SiteNavigationShell> {
  final _controller = CupertinoTabController();
  final Map<String, GlobalKey> _pageKeys = {};

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onTabChanged);
  }

  @override
  void didUpdateWidget(covariant _SiteNavigationShell oldWidget) {
    super.didUpdateWidget(oldWidget);
    final count = widget.website.displayPage.length;
    if (count > 0 && _controller.index >= count) {
      _controller.index = count - 1;
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_onTabChanged);
    _controller.dispose();
    super.dispose();
  }

  void _onTabChanged() {
    if (mounted) setState(() {});
  }

  GlobalKey _keyFor(String id) => _pageKeys.putIfAbsent(id, GlobalKey.new);

  Widget _pageAt(int index) {
    final endpoint = widget.website.displayPage[index];
    return ViewerPage(
      key: _keyFor(endpoint.id),
      endpoint: endpoint,
      website: widget.website,
    );
  }

  @override
  Widget build(BuildContext context) {
    final pages = widget.website.displayPage;
    return LayoutBuilder(
      builder: (context, constraints) {
        final wide = constraints.maxWidth >= WindowSize.medium;
        if (!wide) {
          return CupertinoTabScaffold(
            controller: _controller,
            resizeToAvoidBottomInset: true,
            tabBar: CupertinoTabBar(
              items: [
                for (final endpoint in pages)
                  BottomNavigationBarItem(
                    icon: Icon(
                      cupertinoIcons[endpoint.icon] ?? CupertinoIcons.circle,
                      size: 22,
                    ),
                    label: endpoint.name,
                  ),
              ],
            ),
            tabBuilder: (context, index) => _pageAt(index),
          );
        }

        final extended = constraints.maxWidth >= WindowSize.expanded;
        return ColoredBox(
          color: CupertinoTheme.of(context).scaffoldBackgroundColor,
          child: Row(
            children: [
              SideNavigation(
                extended: extended,
                selectedIndex: _controller.index,
                onDestinationSelected: (index) => _controller.index = index,
                destinations: [
                  for (final endpoint in pages)
                    SideNavigationDestination(
                      icon:
                          cupertinoIcons[endpoint.icon] ??
                          CupertinoIcons.circle,
                      label: endpoint.name,
                    ),
                ],
              ),
              Expanded(
                child: _LazyTabStack(
                  index: _controller.index,
                  itemCount: pages.length,
                  itemBuilder: _pageAt,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _LazyTabStack extends StatefulWidget {
  const _LazyTabStack({
    required this.index,
    required this.itemCount,
    required this.itemBuilder,
  });

  final int index;
  final int itemCount;
  final Widget Function(int index) itemBuilder;

  @override
  State<_LazyTabStack> createState() => _LazyTabStackState();
}

class _LazyTabStackState extends State<_LazyTabStack> {
  late List<bool> _built = List<bool>.filled(widget.itemCount, false);

  @override
  void didUpdateWidget(covariant _LazyTabStack oldWidget) {
    super.didUpdateWidget(oldWidget);
    final lengthDiff = widget.itemCount - _built.length;
    if (lengthDiff > 0) {
      _built.addAll(List<bool>.filled(lengthDiff, false));
    } else if (lengthDiff < 0) {
      _built.removeRange(widget.itemCount, _built.length);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.itemCount == 0) return const SizedBox.shrink();
    _built[widget.index] = true;
    return IndexedStack(
      index: widget.index,
      sizing: StackFit.expand,
      children: [
        for (var i = 0; i < widget.itemCount; i++)
          _built[i] ? widget.itemBuilder(i) : const SizedBox.shrink(),
      ],
    );
  }
}

class _SiteLoadFailure extends StatelessWidget {
  const _SiteLoadFailure({required this.message, required this.failedSite});

  final String message;
  final WebTableData? failedSite;

  Future<void> _openSiteManager(BuildContext context) {
    return showCupertinoModalSheet<void>(
      context: context,
      builder: (context) => const SiteManager(),
    );
  }

  Future<void> _openEditor(BuildContext context, WebTableData? site) {
    return Navigator.of(context).push<void>(
      CupertinoPageRoute(builder: (context) => RulesEditPage(db: site)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('CatWeb'),
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () => _openSiteManager(context),
          child: const Icon(CupertinoIcons.layers),
        ),
      ),
      child: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight - 48,
              ),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 520),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        CupertinoIcons.exclamationmark_triangle,
                        size: 40,
                        color: CupertinoColors.systemOrange,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        message,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 15),
                      ),
                      const SizedBox(height: 28),
                      if (failedSite != null) ...[
                        SizedBox(
                          width: double.infinity,
                          child: CupertinoButton.filled(
                            onPressed: () => _openEditor(context, failedSite),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(CupertinoIcons.pencil, size: 19),
                                SizedBox(width: 8),
                                Text('编辑规则'),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                      SizedBox(
                        width: double.infinity,
                        child: CupertinoButton(
                          onPressed: () => _openSiteManager(context),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(CupertinoIcons.layers, size: 19),
                              SizedBox(width: 8),
                              Text('站点管理'),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: CupertinoButton(
                          onPressed: () => _openEditor(context, null),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(CupertinoIcons.add, size: 19),
                              SizedBox(width: 8),
                              Text('新建站点'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
