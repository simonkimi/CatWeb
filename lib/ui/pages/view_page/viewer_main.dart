import 'package:catweb/data/controller/site_controller.dart';
import 'package:catweb/data/protocol/model/page.dart';
import 'package:catweb/gen/protobuf/page.pbserver.dart';
import 'package:catweb/ui/fragments/viewer_subpage/empty/empty.dart';
import 'package:catweb/ui/fragments/viewer_subpage/list/viewer_list.dart';
import 'package:catweb/utils/icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ViewerMain extends GetView<SiteController> {
  const ViewerMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('构建总框架');
    return Obx(() => _buildBody(context));
  }

  Widget _buildBody(BuildContext context) {
    if (controller.site.value == null) {
      return const EmptyFragment();
    }

    if (controller.website.displayPage.length == 1) {
      return _buildSitePage(context, controller.website.displayPage.first);
    }

    print('构建网站');
    return CupertinoTabScaffold(
      resizeToAvoidBottomInset: true,
      tabBar: CupertinoTabBar(
        items: controller.website.displayPage.map((e) {
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
        print('_buildSitePage $index');
        return _buildSitePage(context, controller.website.displayPage[index]);
      },
    );
  }

  Widget _buildSitePage(BuildContext context, SitePageModel model) {
    switch (model.template.value) {
      case PageTemplate.detail:
        // TODO: Handle this case.
        break;
      case PageTemplate.imageWaterfall:
      case PageTemplate.imageList:
        return ViewerListFragment(
          model: model,
          hasTabBar: controller.website.displayPage.length > 1,
        );
    }
    throw UnimplementedError('TODO!');
  }
}
