import 'package:catweb/data/models/site_render_model.dart';
import 'package:catweb/data/protocol/model/page.dart';
import 'package:catweb/gen/protobuf/page.pbserver.dart';
import 'package:catweb/ui/fragments/viewer_subpage/list/viewer_list.dart';
import 'package:catweb/utils/icons.dart';
import 'package:flutter/cupertino.dart';

class ViewerScaffold extends StatelessWidget {
  const ViewerScaffold({Key? key, required this.website}) : super(key: key);

  final SiteRenderConfigModel website;

  @override
  Widget build(BuildContext context) {
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

  Widget _buildSitePage(BuildContext context, SitePageModel model) {
    switch (model.template.value) {
      case PageTemplate.detail:
        // TODO: Handle this case.
        break;
      case PageTemplate.imageWaterfall:
      case PageTemplate.imageList:
        return ViewerListFragment(
          model: model,
          hasToolBar: website.displayPage.length > 1,
        );
    }
    throw UnimplementedError('TODO!');
  }
}
