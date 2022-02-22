import 'package:catweb/data/controller/site_controller.dart';
import 'package:catweb/data/protocol/model/page.dart';
import 'package:catweb/ui/pages/view_page/viewer_subpage/empty/empty.dart';
import 'package:catweb/ui/pages/view_page/viewer_subpage/viewer_subpage_scaffold.dart';
import 'package:catweb/utils/icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ViewerMain extends GetView<GlobalController> {
  const ViewerMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => _buildBody(context));
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
              cupertinoIcons[e.icon.value] ?? CupertinoIcons.circle,
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

  Widget _buildSitePage(BuildContext context, PageBlueprint target) {
    return ViewerPage(
      target: target,
      model: controller.website.displayPage.length > 1 ? Object() : null,
    );
  }
}
