import 'package:catweb/data/constant.dart';
import 'package:catweb/ui/components/cupertino_app_bar.dart';
import 'package:catweb/ui/components/setting_tile.dart';
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
            SettingGroupWidget(
              children: [
                SettingTile(
                  title: '阅读',
                  color: CupertinoColors.systemBlue.resolveFrom(context),
                  icon: CupertinoIcons.book,
                ),
                const SettingDivider(),
                SettingTile(
                  title: '下载',
                  color: CupertinoColors.systemGreen.resolveFrom(context),
                  icon: CupertinoIcons.cloud_download,
                ),
                const SettingDivider(),
                SettingTile(
                  title: '安全',
                  color: CupertinoColors.systemRed.resolveFrom(context),
                  icon: CupertinoIcons.lock,
                ),
                const SettingDivider(),
                SettingTile(
                  title: '高级',
                  color: CupertinoColors.systemTeal.resolveFrom(context),
                  icon: CupertinoIcons.chevron_left_slash_chevron_right,
                ),
                const SettingDivider(),
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
