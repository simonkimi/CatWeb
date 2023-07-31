import 'package:catweb/data/controller/setting_service.dart';
import 'package:catweb/i18n.dart';
import 'package:catweb/ui/widgets/cupertino_obs_swiitch.dart';
import 'package:catweb/ui/widgets/dialog.dart';
import 'package:catweb/ui/widgets/setting_group.dart';
import 'package:catweb/ui/pages/setting_page/widgets/setting_base.dart';
import 'package:catweb/ui/pages/setting_page/widgets/setting_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SecuritySettingPage extends GetView<SettingService> {
  const SecuritySettingPage({
    super.key,
    this.fromSetting = true,
  });

  final bool fromSetting;

  @override
  Widget build(BuildContext context) {
    return SettingScaffold(
      title: I.of(context).security,
      children: [
        CupertinoListSection.insetGrouped(
          children: [
            SettingTile(
              title: '切到后台后模糊',
              trailing: CupertinoObxSwitch(
                scale: 0.9,
                value: controller.blurWhenBackground,
                onChange: (value) async {
                  if (GetPlatform.isAndroid && value) {
                    showCupertinoConfirmDialog(
                      context: context,
                      title: '提示',
                      content: I.of(context).blur_android_warning,
                      showCancel: false,
                    );
                  }
                  return value;
                },
              ),
            ),
          ],
        ),
        CupertinoListSection.insetGrouped(
          header: const SettingGroupTitle('Cookie保护'),
          footer: const SettingGroupTitle('安全模式将保护您登录令牌不被恶意规则窃取, 若您想为某规则单独关闭, 请前往网站设置'),
          children: [
            SettingTile(
              title: '启用安全模式',
              trailing: CupertinoObxSwitch(
                scale: 0.9,
                value: controller.protectCookie,
                onChange: (value) async {
                  if (!value) {
                    return (await showCupertinoConfirmDialog(
                      context: context,
                      content: '此开关为全局安全模式开关, 若您想为莫规则单独关闭, 请前往设置主页',
                      confineText: '关闭',
                      confineTextColor:
                      CupertinoColors.systemRed.resolveFrom(context),
                    ) !=
                        true);
                  } else {
                    return value;
                  }
                },
              ),
            )
          ],
        ),
      ],
    );
  }

  SettingTile _buildSecuritySwitch(BuildContext context) {
    return SettingTile(
      title: '启用安全模式',
      trailing: CupertinoObxSwitch(
        scale: 0.9,
        value: controller.protectCookie,
        onChange: (value) async {
          if (!value) {
            return (await showCupertinoConfirmDialog(
                  context: context,
                  content: '此开关为全局安全模式开关, 若您想为莫规则单独关闭, 请前往设置主页',
                  confineText: '关闭',
                  confineTextColor:
                      CupertinoColors.systemRed.resolveFrom(context),
                ) !=
                true);
          } else {
            return value;
          }
        },
      ),
    );
  }
}
