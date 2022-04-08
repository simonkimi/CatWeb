import 'package:catweb/data/controller/setting_controller.dart';
import 'package:catweb/ui/components/cupertino_obs_swiitch.dart';
import 'package:catweb/ui/pages/setting_page/setting_group.dart';
import 'package:catweb/ui/pages/setting_page/setting_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ReadSettingPage extends StatelessWidget {
  const ReadSettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final setting = Get.find<SettingController>();

    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      navigationBar: const CupertinoNavigationBar(
        middle: Text('阅读'),
      ),
      child: ListView(
        children: [
          SettingGroupWidget(
            children: [
              SettingTile(
                title: '深色模式下预览图片变暗',
                trailing: CupertinoObxSwitch(
                  scale: 0.9,
                  value: setting.imageMaskInDarkMode,
                ),
              ),
              const SettingDivider(),
              SettingNumberTile(value: setting.preloadCount, title: '预加载数量'),
              const SettingDivider(),
              SettingNumberTile(
                value: setting.concurrencyCount,
                title: '同时加载图片数量',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
