import 'package:bot_toast/bot_toast.dart';
import 'package:catweb/data/controller/site_service.dart';
import 'package:catweb/data/models/site_model/pages/site_page.dart';
import 'package:catweb/i18n.dart';
import 'package:catweb/ui/pages/view_page/empty/empty.dart';
import 'package:catweb/ui/pages/view_page/viewer_subpage_scaffold.dart';
import 'package:catweb/utils/icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ViewerMain extends GetView<SiteService> {
  const ViewerMain({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (controller.lastClickBack + 1000 <
            DateTime.now().millisecondsSinceEpoch) {
          controller.lastClickBack = DateTime.now().millisecondsSinceEpoch;
          BotToast.showText(text: I.of(context).press_again_to_exist);
          return false;
        }
        return true;
      },
      child: Obx(() => _buildBody(context)),
    );
  }

  Widget _buildBody(BuildContext context) {
    if (controller.site.value == null) {
      return const EmptyFragment();
    }

    final website = controller.website;

    if (website.displayPage.length <= 1) {
      return _buildSitePage(context, website.displayPage.first);
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
            label: e.name.value,
          );
        }).toList(),
      ),
      tabBuilder: (BuildContext context, int index) {
        return _buildSitePage(context, website.displayPage[index]);
      },
    );
  }

  Widget _buildSitePage(BuildContext context, SitePage target) {
    return ViewerPage(
      target: target,
      model: controller.website.displayPage.length > 1 ? Object() : null,
    );
  }
}
