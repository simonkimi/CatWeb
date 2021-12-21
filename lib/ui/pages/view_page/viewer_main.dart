import 'package:catweb/data/controller/site_controller.dart';
import 'package:catweb/data/protocol/model/page.dart';
import 'package:catweb/gen/protobuf/page.pbserver.dart';
import 'package:catweb/ui/fragments/viewer_subpage/test/test_fragment.dart';
import 'package:catweb/ui/fragments/viewer_subpage/viewer_list/viewer_list.dart';
import 'package:catweb/utils/icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class SubViewer {}

class ViewerMain extends GetView<SiteController> {
  const ViewerMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (controller.site.value == null) {
      return const TestFragment();
    }

    if (controller.website.displayPage.length == 1) {
      return _buildSitePage(context, controller.website.displayPage.first);
    }

    return CupertinoTabScaffold(
      resizeToAvoidBottomInset: true,
      tabBar: CupertinoTabBar(
        items: controller.website.displayPage.map((e) {
          return BottomNavigationBarItem(
            icon: Icon(cupertinoIcons[e.icon.value] ?? CupertinoIcons.circle),
            label: e.name.value,
          );
        }).toList(),
      ),
      tabBuilder: (BuildContext context, int index) {
        return _buildSitePage(context, controller.website.displayPage[index]);
      },
    );
  }

  Widget _buildSitePage(BuildContext context, SitePageModel model) {
    switch (model.template.value) {
      case PageTemplate.detail:
        // TODO: Handle this case.
        break;
      case PageTemplate.imageList:
        return ViewerList(model: model);
      case PageTemplate.imageWaterfall:
        // TODO: Handle this case.
        break;
    }
    throw UnimplementedError('TODO!');
  }
}
