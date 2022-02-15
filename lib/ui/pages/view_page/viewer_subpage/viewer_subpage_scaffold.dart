import 'package:catweb/data/controller/site_controller.dart';
import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/data/protocol/model/page.dart';
import 'package:catweb/gen/protobuf/page.pb.dart';
import 'package:catweb/ui/pages/view_page/viewer_subpage/detail/viewer_detail.dart';
import 'package:catweb/ui/pages/view_page/viewer_subpage/list/viewer_list.dart';
import 'package:catweb/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ViewerPage extends StatelessWidget {
  const ViewerPage({
    Key? key,
    required this.target,
    this.model,
    this.env,
  }) : super(key: key);

  final SitePageModel target;
  final SiteEnvModel? env;
  final Object? model;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(child: _buildFragment(context));
  }

  Widget _buildFragment(BuildContext context) {
    switch (target.template.value) {
      case Template.TEMPLATE_IMAGE_WATERFALL:
      case Template.TEMPLATE_IMAGE_LIST:
        return ViewerListFragment(
          target: target,
          hasToolBar: model == false,
        );
      case Template.TEMPLATE_DETAIL:
        return ViewerDetailFragment(
          target: target,
          model: model,
          env: env ?? SiteEnvModel(),
        );
      default:
        throw UnimplementedError(
            'ViewerPage can not handle ${target.template.value}');
    }
  }
}

Future<void> pushNewPage({
  required String to,
  required SiteEnvModel envModel,
  Object? model,
}) async {
  final controller = Get.find<GlobalController>();
  final target =
      controller.website.configModel.pageList.get((e) => e.uuid == to);
  if (target == null) throw Exception('$to not exist');
  Get.to(() => ViewerPage(
        model: model,
        env: envModel,
        target: target,
      ));
}
