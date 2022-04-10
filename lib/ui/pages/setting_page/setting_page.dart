import 'package:catweb/data/constant.dart';
import 'package:catweb/ui/components/cupertino_app_bar.dart';
import 'package:catweb/ui/components/cupertino_router.dart';
import 'package:catweb/ui/pages/setting_page/setting_subpage/display_setting.dart';
import 'package:catweb/ui/pages/setting_page/setting_tile.dart';
import 'package:catweb/ui/pages/setting_page/setting_group.dart';
import 'package:flutter/cupertino.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      child: CupertinoScrollbar(
        child: CustomScrollView(
          slivers: [
            const CupertinoSliverNavigationBar(
              padding: kAppbarPadding,
              backgroundColor: CupertinoColors.systemGroupedBackground,
              leading: CupertinoBackLeading(),
              largeTitle: Text('设置'),
              border: null,
            ),
            SettingGroupSliver(
              children: [
                SettingTile(
                  title: '显示',
                  color: CupertinoColors.systemBlue.resolveFrom(context),
                  icon: CupertinoIcons.book,
                  onTap: () {
                    Navigator.of(context).push(CupertinoWithModalsPageRoute(
                        builder: (context) => const DisplaySettingPage()));
                  },
                ),
                const SettingIconDivider(),
                SettingTile(
                  title: '下载',
                  color: CupertinoColors.systemGreen.resolveFrom(context),
                  icon: CupertinoIcons.cloud_download,
                ),
                const SettingIconDivider(),
                SettingTile(
                  title: '安全',
                  color: CupertinoColors.systemRed.resolveFrom(context),
                  icon: CupertinoIcons.lock,
                ),
                const SettingIconDivider(),
                SettingTile(
                  title: '高级',
                  color: CupertinoColors.systemTeal.resolveFrom(context),
                  icon: CupertinoIcons.chevron_left_slash_chevron_right,
                ),
                const SettingIconDivider(),
                SettingTile(
                  title: '关于',
                  color: CupertinoColors.systemBlue.resolveFrom(context),
                  icon: CupertinoIcons.info,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
