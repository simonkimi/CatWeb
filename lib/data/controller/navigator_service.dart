import 'package:catweb/data/controller/site_service.dart';
import 'package:catweb/data/models/site_model/pages/template.dart';
import 'package:catweb/utils/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:catweb/i18n.dart';
import 'package:catweb/ui/pages/view_page/viewer_subpage_scaffold.dart';
import 'package:catweb/data/models/site_env_model.dart';

import 'package:catweb/navigator.dart';

/// 路由管理器，通过管理预览的深度进行状态管理
class NavigatorService {
  var _depth = 0;

  String get depth => 'NavStack-$_depth';

  /// 打开一个新的界面
  /// [target] 新界面的uuid索引
  /// [envModel] 环境
  Future<void> push({
    required String targetName,
    SiteEnvStore? envModel,
    Object? model,
  }) async {
    final target = get<SiteService>()
        .website
        .blueMap
        .pageList
        .get((e) => e.uuid == targetName);
    if (target == null) {
      throw Exception('NavigatorService: $targetName not exist');
    }

    var add = [TemplateType.imageList, TemplateType.imageWaterFall]
        .contains(target.template.type);

    if (add) {
      _depth += 1;
    }

    await Navigator.of(I.context).push(CupertinoPageRoute(
        builder: (context) => ViewerPage(
              model: model,
              env: envModel,
              target: target,
            )));
    if (add) {
      _depth -= 1;
    }
  }
}
