import 'package:bot_toast/bot_toast.dart';
import 'package:catweb/data/controller/site.dart';
import 'package:catweb/data/models/site/page.dart';
import 'package:catweb/data/models/site_render_model.dart';
import 'package:catweb/get.dart';
import 'package:catweb/i18n.dart';
import 'package:catweb/ui/pages/view_page/empty/empty.dart';
import 'package:catweb/ui/pages/view_page/viewer_provider.dart';
import 'package:catweb/ui/pages/view_page/viewer_subpage_scaffold.dart';
import 'package:catweb/utils/context_helper.dart';
import 'package:catweb/utils/icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

class ViewerMain extends HookWidget {
  const ViewerMain({super.key});

  @override
  Widget build(BuildContext context) {
    final lastClickBack = useState<int>(0);

    return PopScope(
      canPop: false,
      onPopInvoked: (canPop) {
        if (lastClickBack.value + 1000 <
            DateTime.now().millisecondsSinceEpoch) {
          lastClickBack.value = DateTime.now().millisecondsSinceEpoch;
          BotToast.showText(text: I.of(context).press_again_to_exist);
          return;
        }
        context.pop();
      },
      child: ValueListenableBuilder(
        valueListenable: inject<SiteService>().currentSiteNotifier,
        builder: (BuildContext context, SiteRenderConfigModel? website, _) {
          if (website == null) {
            return const EmptyFragment();
          }
          return Provider(
            create: (_) => ViewerConfig(website: website),
            child: _buildBody(context, website),
          );
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context, SiteRenderConfigModel website) {
    if (website.displayPage.length <= 1) {
      return _buildSitePage(context, website, website.displayPage.first);
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
        return _buildSitePage(context, website, website.displayPage[index]);
      },
    );
  }

  Widget _buildSitePage(
    BuildContext context,
    SiteRenderConfigModel website,
    SitePageRule target,
  ) {
    return Provider(
      create: (_) => PageConfig(pageRule: target),
      child: const ViewerPage(),
    );
  }
}
