import 'package:bot_toast/bot_toast.dart';
import 'package:catweb/data/controller/site_service.dart';
import 'package:catweb/data/models/site_model/pages/site_page.dart';
import 'package:catweb/data/models/site_render_model.dart';
import 'package:catweb/i18n.dart';
import 'package:catweb/navigator.dart';
import 'package:catweb/ui/pages/view_page/empty/empty.dart';
import 'package:catweb/ui/pages/view_page/viewer_subpage_scaffold.dart';
import 'package:catweb/utils/context_helper.dart';
import 'package:catweb/utils/icons.dart';
import 'package:catweb/utils/widget.dart';
import 'package:flutter/cupertino.dart';

class ViewerMain extends StatelessWidget {
  const ViewerMain({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = get<SiteService>();
    return PopScope(
      canPop: false,
      onPopInvoked: (canPop) {
        if (controller.lastClickBack + 1000 <
            DateTime.now().millisecondsSinceEpoch) {
          controller.lastClickBack = DateTime.now().millisecondsSinceEpoch;
          BotToast.showText(text: I.of(context).press_again_to_exist);
          return;
        }
        context.pop();
      },
      child: controller.site.obx((site) => _buildBody(context, site)),
    );
  }

  Widget _buildBody(BuildContext context, SiteRenderConfigModel? website) {
    if (website == null) {
      return const EmptyFragment();
    }

    if (website.displayPage.length <= 1) {
      return _buildSitePage(context, website, website.displayPage.first);
    }

    return CupertinoTabScaffold(
      resizeToAvoidBottomInset: true,
      tabBar: CupertinoTabBar(
        items: website.displayPage.map((e) {
          return BottomNavigationBarItem(
            icon: Icon(
              cupertinoIcons[e.icon.value] ?? CupertinoIcons.circle,
              size: 22,
            ),
            label: e.name.value,
          );
        }).toList(),
      ),
      tabBuilder: (BuildContext context, int index) {
        return _buildSitePage(context, website, website.displayPage[index]);
      },
    );
  }

  Widget _buildSitePage(
      BuildContext context, SiteRenderConfigModel website, SitePage target) {
    return ViewerPage(
      target: target,
      model: website.displayPage.length > 1 ? Object() : null,
    );
  }
}
