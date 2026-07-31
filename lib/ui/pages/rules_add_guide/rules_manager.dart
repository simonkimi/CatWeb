import 'dart:convert';

import 'package:bot_toast/bot_toast.dart';
import 'package:catweb/app.dart';
import 'package:catweb/data/controller/db.dart';
import 'package:catweb/data/controller/site.dart';
import 'package:catweb/data/database/database.dart';
import 'package:catweb/data/site_runtime/site_compiler.dart';
import 'package:catweb/i18n.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_add_page.dart';
import 'package:catweb/ui/pages/setting_page/setting_page.dart';
import 'package:catweb/ui/widgets/cupertino_list_tile.dart';
import 'package:catweb/ui/widgets/dialog.dart';
import 'package:catweb/utils/context_helper.dart';
import 'package:catweb/utils/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

enum _MenuSelect { edit, exportJson, delete }

class SiteManager extends StatelessWidget {
  const SiteManager({super.key});

  static const routeName = 'SiteManager';

  @override
  Widget build(BuildContext context) {
    final dbService = context.read<DbService>();
    return CupertinoPageScaffold(
      navigationBar: _buildAppbar(context),
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                child: StreamBuilder<List<WebTableData>>(
                  initialData: const [],
                  stream: dbService.webDao.getAllStream(),
                  builder: (context, snapshot) =>
                      _buildListView(snapshot.data ?? const [], context),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CupertinoButton(
                  onPressed: () =>
                      Navigator.of(context).to(const RulesEditPage()),
                  child: const Icon(CupertinoIcons.add),
                ),
                const CupertinoButton(
                  onPressed: null,
                  child: Icon(CupertinoIcons.qrcode_viewfinder),
                ),
                CupertinoButton(
                  onPressed: () => context.to(const SettingsPage()),
                  child: const Icon(CupertinoIcons.settings),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSiteItem(BuildContext context, WebTableData db) {
    final summary = _summaryOf(db.blueprint);
    final siteService = context.read<SiteService>();
    return siteService.currentSiteNotifier.obx((site) {
      return CupertinoCardTile(
        selected: site?.id == db.id,
        title: Text(summary.name),
        subtitle: Text(
          summary.valid ? summary.baseUrl : '无效规则，仅支持 schemaVersion 2',
        ),
        trailing: const Icon(Icons.more_horiz),
        onTrailingTap: () => _onTrailingTap(context, db, summary),
        onTap: () async {
          await siteService.setNewSite(siteService.id == db.id ? null : db);
          final failure = siteService.loadFailureNotifier.value;
          if (failure != null) BotToast.showText(text: failure.toString());
        },
      );
    });
  }

  Widget _buildListView(List<WebTableData> sites, BuildContext context) {
    if (sites.isEmpty) {
      return Center(
        child: Text(
          '没有找到站点',
          style: TextStyle(color: CupertinoColors.label.resolveFrom(context)),
        ),
      );
    }
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: sites.map((site) => _buildSiteItem(context, site)).toList(),
    );
  }

  CupertinoNavigationBar _buildAppbar(BuildContext context) =>
      CupertinoNavigationBar(
        padding: const EdgeInsetsDirectional.only(start: 10),
        leading: CupertinoButton(
          onPressed: () => context.pop(),
          padding: EdgeInsets.zero,
          minimumSize: Size.zero,
          child: const Icon(CupertinoIcons.back),
        ),
        middle: const Text('站点管理'),
        transitionBetweenRoutes: false,
      );

  Future<void> _onTrailingTap(
    BuildContext context,
    WebTableData db,
    _SiteSummary summary,
  ) async {
    final navigator = Navigator.of(context);
    final result = await showCupertinoSelectDialog<_MenuSelect>(
      cancelText: I.of(context).cancel,
      context: context,
      items: [
        SelectTileItem(title: I.of(context).edit, value: _MenuSelect.edit),
        const SelectTileItem(title: '导出 JSON', value: _MenuSelect.exportJson),
        SelectTileItem(
          title: I.of(context).delete,
          value: _MenuSelect.delete,
          destructive: true,
        ),
      ],
    );
    switch (result) {
      case null:
        return;
      case _MenuSelect.exportJson:
        await _exportJson(db);
        return;
      case _MenuSelect.edit:
        await navigator.to(RulesEditPage(db: db));
        return;
      case _MenuSelect.delete:
        await _onDelete(context, db, summary.name);
    }
  }

  Future<void> _exportJson(WebTableData db) async {
    try {
      final decoded = jsonDecode(db.blueprint);
      if (decoded is! Map) throw const FormatException('规则格式无效');
      final json = decoded.map<String, Object?>(
        (key, value) => MapEntry(key.toString(), value),
      );
      final definition = const SiteCompiler().compileJson(json).definition;
      final output = const JsonEncoder.withIndent(
        '  ',
      ).convert(definition.toJson());
      await Clipboard.setData(ClipboardData(text: output));
      BotToast.showText(text: '规则 JSON 已复制到剪贴板');
    } catch (error) {
      BotToast.showText(text: '导出失败: $error');
    }
  }

  Future<void> _onDelete(
    BuildContext context,
    WebTableData db,
    String name,
  ) async {
    if (await showCupertinoConfirmDialog(
          context: context,
          content: I.of(context).delete_confirm(name),
          title: I.of(context).delete,
          confineText: I.of(context).delete,
          confineTextColor: CupertinoColors.systemRed.resolveFrom(context),
        ) ==
        true) {
      await context.read<DbService>().webDao.remove(db);
    }
  }

  _SiteSummary _summaryOf(String source) {
    try {
      final decoded = jsonDecode(source);
      if (decoded is! Map) throw const FormatException();
      final json = decoded.map<String, Object?>(
        (key, value) => MapEntry(key.toString(), value),
      );
      final site = const SiteCompiler().compileJson(json).definition;
      return _SiteSummary(site.name, site.baseUrl, true);
    } catch (_) {
      return const _SiteSummary('Invalid site', '', false);
    }
  }
}

final class _SiteSummary {
  const _SiteSummary(this.name, this.baseUrl, this.valid);

  final String name;
  final String baseUrl;
  final bool valid;
}
