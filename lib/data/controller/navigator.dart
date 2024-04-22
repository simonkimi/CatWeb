import 'package:catweb/data/controller/site_provider.dart';
import 'package:catweb/data/models/site_model/pages/template.dart';
import 'package:flutter/cupertino.dart';
import 'package:catweb/i18n.dart';
import 'package:catweb/ui/pages/view_page/viewer_subpage_scaffold.dart';
import 'package:catweb/data/models/site_env_model.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

final navigatorProvider = StateNotifierProvider<NavigatorNotifier, int>(
    (ref) => NavigatorNotifier(site: ref.watch(siteProvider.notifier)));

/// 路由管理器，通过管理预览的深度进行状态管理
class NavigatorNotifier extends StateNotifier<int> {
  NavigatorNotifier({required this.site}) : super(0);

  final SiteNotifier site;

  String get depth => 'NavStack-$state';

  /// 打开一个新的界面
  /// [target] 新界面的uuid索引
  /// [envModel] 环境
  Future<void> push({
    required String targetName,
    SiteEnvStore? envModel,
    Object? model,
  }) async {
    final target = site.state!
        .blueMap
        .pageList
        .get((e) => e.uuid == targetName);
    if (target == null) {
      throw Exception('NavigatorService: $targetName not exist');
    }

    var add = [TemplateType.imageList, TemplateType.imageWaterFall]
        .contains(target.template.type);

    if (add) {
      state += 1;
    }

    await Navigator.of(I.context).push(CupertinoPageRoute(
        builder: (context) => ViewerPage(
              model: model,
              env: envModel,
              target: target,
            )));
    if (add) {
      state -= 1;
    }
  }
}
