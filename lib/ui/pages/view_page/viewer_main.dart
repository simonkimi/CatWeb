import 'package:catweb/data/controller/site_controller.dart';

import 'package:catweb/ui/pages/view_page/viewer_scaffold.dart';
import 'package:catweb/ui/pages/view_page/viewer_subpage/empty/empty.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ViewerMain extends GetView<SiteController> {
  const ViewerMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => _buildBody(context));
  }

  Widget _buildBody(BuildContext context) {
    if (controller.site.value == null) {
      return const EmptyFragment();
    }

    return ViewerScaffold(website: controller.website);
  }
}
