import 'dart:convert';
import 'package:bot_toast/bot_toast.dart';
import 'package:catweb/data/controller/db.dart';
import 'package:catweb/data/controller/settings.dart';
import 'package:catweb/data/controller/site.dart';
import 'package:catweb/data/database/database.dart';
import 'package:catweb/data/models/site/site_bluemap.dart';
import 'package:catweb/get.dart';
import 'package:catweb/i18n.dart';
import 'package:catweb/ui/widgets/cupertino_list_tile.dart';
import 'package:catweb/ui/widgets/dialog.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_add_page.dart';
import 'package:catweb/ui/pages/setting_page/setting_page.dart';
import 'package:catweb/ui/pages/webview_login_in/webview_login_in.dart';
import 'package:catweb/utils/context_helper.dart';
import 'package:catweb/utils/debug.dart';
import 'package:catweb/utils/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

enum _MenuSelect {
  edit,
  share,
  delete,
  login,
}

class SiteManager extends StatelessWidget {
  const SiteManager({super.key});

  static const routeName = 'SiteManager';

  DbService get dbService => inject();

  SettingService get settingService => inject();

  SiteService get siteService => inject();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: _buildAppbar(context),
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  child: StreamBuilder<List<WebTableData>>(
                    initialData: const [],
                    stream: dbService.webDao.getAllStream(),
                    builder: (context, snapshot) {
                      return _buildListView(snapshot, context);
                    },
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CupertinoButton(
                  child: const Icon(CupertinoIcons.add),
                  onPressed: () => _toEditPage(Navigator.of(context),
                      entity: null, db: null),
                ),
                CupertinoButton(
                  child: const Icon(CupertinoIcons.qrcode_viewfinder),
                  onPressed: () {},
                ),
                CupertinoButton(
                  child: const Icon(CupertinoIcons.settings),
                  onPressed: () {
                    Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context) => const SettingsPage()));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSiteItem(BuildContext context, WebTableData e) {
    final model = SiteBlueprint.fromJson(jsonDecode(e.blueprint));
    return siteService.currentSiteNotifier.obx((site) {
      return CupertinoCardTile(
        selected: site?.id == e.id,
        title: Text(model.name),
        subtitle: Text(model.baseUrl),
        trailing: const Icon(Icons.more_horiz),
        onTrailingTap: () => _onTrailingTap(context, e, model),
        onTap: () => siteService.setNewSite(
          siteService.id == e.id ? null : e,
        ),
      );
    });
  }

  Widget _buildListView(
    AsyncSnapshot<List<WebTableData>> snapshot,
    BuildContext context,
  ) {
    if (snapshot.data!.isEmpty) {
      return Center(
        child: Text(
          '没有找到站点, 请点击下面的按钮添加',
          style: TextStyle(
            color: CupertinoColors.label.resolveFrom(context),
          ),
        ),
      );
    }
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: snapshot.data!.map((e) => _buildSiteItem(context, e)).toList(),
    );
  }

  CupertinoNavigationBar _buildAppbar(BuildContext context) {
    return CupertinoNavigationBar(
      padding: const EdgeInsetsDirectional.only(start: 10),
      leading: CupertinoButton(
        onPressed: () => context.pop(),
        padding: EdgeInsets.zero,
        minSize: 0,
        child: const Icon(CupertinoIcons.back),
      ),
      middle: const Text('站点管理'),
      transitionBetweenRoutes: false,
    );
  }

  Future<void> _onTrailingTap(
    BuildContext context,
    WebTableData db,
    SiteBlueprint entity,
  ) async {
    final navigator = Navigator.of(context);
    final result = await showCupertinoSelectDialog<_MenuSelect>(
      cancelText: I.of(context).cancel,
      context: context,
      items: [
        SelectTileItem(title: I.of(context).edit, value: _MenuSelect.edit),
        const SelectTileItem(title: '分享', value: _MenuSelect.share),
        SelectTileItem(
            title: db.loginCookies.isNotEmpty
                ? I.of(context).logout
                : I.of(context).login,
            value: _MenuSelect.login),
        SelectTileItem(
          title: I.of(context).delete,
          value: _MenuSelect.delete,
          destructive: true,
        ),
      ],
    );
    switch (result) {
      case null:
      case _MenuSelect.share:
        return _share();
      case _MenuSelect.edit:
        return _toEditPage(navigator, entity: entity, db: db);
      case _MenuSelect.delete:
        return _onDelete(context, db, entity);
      case _MenuSelect.login:
        return _loginIn(context, db, entity);
    }
  }

  Future<void> _loginIn(
    BuildContext context,
    WebTableData db,
    SiteBlueprint entity,
  ) async {
    if (db.loginCookies.isNotEmpty) {
      // 注销登录
      final isReload = await showCupertinoConfirmDialog(
        context: context,
        title: I.of(context).logout,
        content: I.of(context).logout_check,
      );
      if (isReload == true) {
        await dbService.webDao.replace(db.copyWith(loginCookies: ''));
        context.pop();
      }
    } else {
      // 登录
      if (Uri.tryParse(entity.baseUrl)?.host !=
          Uri.tryParse(entity.loginUrl)?.host) {
        if (!settingService.protectCookie || !db.securityModel) {
          final w = await showCupertinoConfirmDialog(
            context: context,
            title: I.of(context).login,
            content: I
                .of(context)
                .login_without_security(entity.loginCookieDescription),
          );
          if (w == false) {
            return;
          }
        } else {
          final w = await showCupertinoConfirmDialog(
            context: context,
            title: I.of(context).login,
            content: I.of(context).login_with_security,
          );
          if (w == false) {
            return;
          }
        }
      }

      final List<Cookie>? cookies = await Navigator.of(context).push(
        CupertinoPageRoute(
          builder: (context) => WebViewLoginIn(
            url: entity.loginUrl,
          ),
        ),
      );

      if (cookies != null) {
        final cookieStr = cookies.map((e) => '${e.name}=${e.value}').join('; ');
        await dbService.webDao.replace(db.copyWith(loginCookies: cookieStr));
        BotToast.showText(text: I.of(context).login_success);
        logger.i('Login success, cookies: $cookieStr');
      }
    }
  }

  Future<void> _share() async {}

  Future<void> _onDelete(
      BuildContext context, WebTableData db, SiteBlueprint entity) async {
    if (await showCupertinoConfirmDialog(
          context: context,
          content: I.of(context).delete_confirm(entity.name),
          title: I.of(context).delete,
          confineText: I.of(context).delete,
          confineTextColor: CupertinoColors.systemRed.resolveFrom(context),
        ) ==
        true) {
      dbService.webDao.remove(db);
    }
  }

  void _toEditPage(
    NavigatorState navigator, {
    SiteBlueprint? entity,
    WebTableData? db,
  }) =>
      navigator.push(CupertinoPageRoute(
        builder: (context) => RulesEditPage(blueprint: entity, db: db),
      ));
}
