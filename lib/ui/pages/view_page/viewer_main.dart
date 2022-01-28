import 'package:catweb/data/controller/site_controller.dart';
import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/data/protocol/model/page.dart';
import 'package:catweb/gen/protobuf/page.pbserver.dart';

import 'package:catweb/ui/pages/view_page/viewer_scaffold.dart';
import 'package:catweb/ui/pages/view_page/viewer_subpage/empty/empty.dart';
import 'package:catweb/ui/pages/view_page/viewer_subpage/list/viewer_list.dart';
import 'package:catweb/utils/utils.dart';
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

class ViewerPage extends StatelessWidget {
  const ViewerPage({
    Key? key,
    required this.target,
    required this.model,
    required this.env,
    required this.to,
  }) : super(key: key);

  final SitePageModel target;
  final OpenPageModel to;
  final SiteEnvModel env;
  final dynamic model;

  @override
  Widget build(BuildContext context) {
    switch (target.template.value) {
      case Template.TEMPLATE_IMAGE_WATERFALL:
      case Template.TEMPLATE_IMAGE_LIST:
        return ViewerListFragment(
          model: model,
          hasToolBar: false,
        );
      case Template.TEMPLATE_DETAIL:
        // return ViewerDetail(
        //   model: target,
        // );
        // TODO 详情页面加载
      default:
        throw UnimplementedError(
            'ViewerPage can not handle ${model.template.value}');
    }
  }
}

Future<dynamic> pushNewPage({
  required OpenPageModel to,
  required SiteEnvModel envModel,
  dynamic model,
}) async {
  final controller = Get.find<SiteController>();
  final target = controller.website.configModel.pageList
      .get((e) => e.uuid == to.target.value);
  if (target == null) throw Exception('${to.target.value} not exist');
  Get.to(() => ViewerPage(
        model: model,
        env: envModel,
        target: target,
        to: to,
      ));
}
