import 'package:catweb/data/controller/setting_controller.dart';
import 'package:catweb/data/controller/setting_enum.dart';
import 'package:catweb/ui/components/cupertino_obs_swiitch.dart';
import 'package:catweb/ui/components/dialog.dart';
import 'package:catweb/ui/pages/setting_page/setting_group.dart';
import 'package:catweb/ui/pages/setting_page/setting_selection.dart';
import 'package:catweb/ui/pages/setting_page/setting_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DisplaySettingPage extends StatelessWidget {
  const DisplaySettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final setting = Get.find<SettingController>();

    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      navigationBar: const CupertinoNavigationBar(
        middle: Text('显示'),
        backgroundColor: CupertinoColors.systemGroupedBackground,
        previousPageTitle: '设置',
        padding: EdgeInsetsDirectional.zero,
        border: null,
      ),
      child: ListView(
        children: [
          const SizedBox(height: 16),
          const SettingGroupTitle('预览'),
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
              SettingSelectionTile(
                title: '同时加载图片数量',
                value: setting.concurrencyCount,
                items: [
                  const SelectTileItem(value: 0, title: '不限制'),
                  for (var i = 1; i <= 10; i += 2)
                    SelectTileItem(value: i, title: '$i'),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          const SettingGroupTitle('阅读'),
          SettingGroupWidget(
            children: [
              SettingSelectionTile(
                title: '预加载数量',
                value: setting.preloadCount,
                items: [
                  const SelectTileItem(value: 0, title: '不预加载'),
                  for (var i = 1; i <= 17; i += 2)
                    SelectTileItem(value: i, title: '$i'),
                ],
              ),
              const SettingDivider(),
              SettingSelectionTile<int>(
                title: '阅读方向',
                previousPageTitle: '显示',
                value: setting.readerDirectory,
                items: const [
                  SelectTileItem(value: ReaderDirection.ltr, title: '从左到右'),
                  SelectTileItem(value: ReaderDirection.rtl, title: '从右到左'),
                  SelectTileItem(value: ReaderDirection.ttb, title: '从上到下'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
