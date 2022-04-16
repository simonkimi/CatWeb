import 'package:catweb/data/constant.dart';
import 'package:catweb/i18n.dart';
import 'package:catweb/ui/components/cupertino_app_bar.dart';
import 'package:catweb/ui/components/cupertino_router.dart';
import 'package:catweb/ui/pages/setting_page/setting_subpage/display_setting.dart';
import 'package:catweb/ui/pages/setting_page/setting_subpage/security_setting.dart';
import 'package:catweb/ui/pages/setting_page/widgets/setting_tile.dart';
import 'package:catweb/ui/pages/setting_page/widgets/setting_group.dart';
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
            CupertinoSliverNavigationBar(
              padding: kAppbarPadding,
              backgroundColor: CupertinoColors.systemGroupedBackground,
              leading: const CupertinoBackLeading(),
              largeTitle: Text(I.of(context).setting),
              border: null,
            ),
            SettingGroupSliver(
              children: [
                SettingTile(
                  title: I.of(context).display,
                  color: CupertinoColors.systemBlue.resolveFrom(context),
                  icon: CupertinoIcons.book,
                  onTap: () {
                    Navigator.of(context).push(CupertinoWithModalsPageRoute(
                        builder: (context) => const DisplaySettingPage()));
                  },
                ),
                const SettingIconDivider(),
                SettingTile(
                  title: I.of(context).download,
                  color: CupertinoColors.systemGreen.resolveFrom(context),
                  icon: CupertinoIcons.cloud_download,
                ),
                const SettingIconDivider(),
                SettingTile(
                  title: I.of(context).security,
                  color: CupertinoColors.systemRed.resolveFrom(context),
                  icon: CupertinoIcons.lock,
                  onTap: () => Navigator.of(context).push(
                      CupertinoWithModalsPageRoute(
                          builder: (context) => const SecuritySettingPage())),
                ),
                const SettingIconDivider(),
                SettingTile(
                  title: I.of(context).advanced,
                  color: CupertinoColors.systemTeal.resolveFrom(context),
                  icon: CupertinoIcons.chevron_left_slash_chevron_right,
                ),
                const SettingIconDivider(),
                SettingTile(
                  title: I.of(context).about,
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
