import 'package:catweb/data/controller/site_service.dart';
import 'package:catweb/gen/protobuf/template.pbenum.dart';
import 'package:catweb/utils/helper.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:catweb/i18n.dart';

import '../../ui/pages/view_page/viewer_subpage_scaffold.dart';
import '../models/site_env_model.dart';

/// 路由管理器，通过管理预览的深度进行状态管理
class NavigatorService extends GetxService {
  static NavigatorService get to => Get.find();

  var _depth = 0;

  static String get depth => 'NavStack-${to._depth}';

  /// 打开一个新的界面
  /// [target] 新界面的uuid索引
  /// [envModel] 环境
  static Future<void> push({
    required String targetName,
    SiteEnvModel? envModel,
    Object? model,
  }) async {
    final target = SiteService.to.website.configModel.pageList
        .get((e) => e.uuid == targetName);
    if (target == null) {
      throw Exception('NavigatorService: $targetName not exist');
    }

    var add = [Template.TEMPLATE_IMAGE_LIST, Template.TEMPLATE_IMAGE_WATERFALL]
        .contains(target.template.value);

    if (add) {
      to._depth += 1;
    }

    await Navigator.of(I.context).push(CupertinoPageRoute(
        builder: (context) => ViewerPage(
              model: model,
              env: envModel,
              target: target,
            )));
    if (add) {
      to._depth -= 1;
    }
  }
}
