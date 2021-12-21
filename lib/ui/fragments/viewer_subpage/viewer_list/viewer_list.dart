import 'package:catweb/data/protocol/model/page.dart';
import 'package:catweb/ui/components/tab_bar.dart';
import 'package:catweb/ui/fragments/viewer_subpage/viewer_list/viewer_controller.dart';
import 'package:flutter/cupertino.dart';

class ViewerList extends StatelessWidget {
  ViewerList({
    Key? key,
    required this.model,
  })  : controller = ViewerListController(model),
        super(key: key);

  final SitePageModel model;

  final ViewerListController controller;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return CupertinoTabBarView(
      tabs: [

      ],
      children: [

      ],
    );
  }
}
