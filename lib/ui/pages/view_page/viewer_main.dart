import 'package:bot_toast/bot_toast.dart';
import 'package:catweb/data/controller/site.dart';
import 'package:catweb/data/database/database.dart';
import 'package:catweb/data/loading/load_failure.dart';
import 'package:catweb/data/models/site_render_model.dart';
import 'package:catweb/i18n.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_add_page.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_manager.dart';
import 'package:catweb/ui/pages/view_page/empty/empty.dart';
import 'package:catweb/ui/pages/view_page/viewer_provider.dart';
import 'package:catweb/ui/pages/view_page/viewer_subpage_scaffold.dart';
import 'package:catweb/utils/context_helper.dart';
import 'package:catweb/utils/icons.dart';
import 'package:cupertino_modal_sheet/cupertino_modal_sheet.dart';
import 'package:flutter/cupertino.dart';
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

    return CupertinoTabScaffold(
      resizeToAvoidBottomInset: true,
      tabBar: CupertinoTabBar(
        items: website.displayPage.map((e) {
          return BottomNavigationBarItem(
            icon: Icon(
              cupertinoIcons[e.icon] ?? CupertinoIcons.circle,
              size: 22,
            ),
            label: e.name,
          );
        }).toList(),
      ),
      tabBuilder: (BuildContext context, int index) {
        return ViewerPage(
          endpoint: website.displayPage[index],
          website: website,
        );
      },
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
