import 'dart:convert';

import 'package:catweb/app.dart';
import 'package:catweb/data/controller/db.dart';
import 'package:catweb/data/controller/site.dart';
import 'package:catweb/data/database/database.dart';
import 'package:catweb/data/site_runtime/site_compiler.dart';
import 'package:catweb/i18n.dart';
import 'package:catweb/ui/widgets/dialog.dart';
import 'package:catweb/utils/context_helper.dart';
import 'package:flutter/cupertino.dart';

class RulesEditPage extends StatefulWidget {
  const RulesEditPage({super.key, this.db});

  final WebTableData? db;

  @override
  State<RulesEditPage> createState() => _RulesEditPageState();
}

class _RulesEditPageState extends State<RulesEditPage> {
  late final TextEditingController controller;
  bool saving = false;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(
      text: widget.db?.blueprint ?? _newDefinitionJson(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) async {
        if (didPop) return;
        if (await _confirmExit() && context.mounted) context.pop();
      },
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: CupertinoButton(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            onPressed: () async {
              if (await _confirmExit() && context.mounted) context.pop();
            },
            child: const Icon(CupertinoIcons.back),
          ),
          middle: Text(I.of(context).rule_edit),
          trailing: CupertinoButton(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            onPressed: saving ? null : _save,
            child: saving
                ? const CupertinoActivityIndicator()
                : Text(I.of(context).save),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: CupertinoTextField(
              controller: controller,
              expands: true,
              minLines: null,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              textAlignVertical: TextAlignVertical.top,
              placeholder: 'Schema v2 JSON',
              style: const TextStyle(fontFamily: 'monospace', fontSize: 13),
              padding: const EdgeInsets.all(12),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _confirmExit() async =>
      (await showCupertinoConfirmDialog(
        context: context,
        title: I.of(context).exit,
        content: I.of(context).exit_not_save,
        showCancel: true,
      )) ==
      true;

  Future<void> _save() async {
    try {
      final decoded = jsonDecode(controller.text);
      if (decoded is! Map) {
        throw const FormatException('站点规则必须是 JSON object');
      }
      final json = decoded.map<String, Object?>(
        (key, value) => MapEntry(key.toString(), value),
      );
      final definition = const SiteCompiler().compileJson(json).definition;
      final canonical = const JsonEncoder.withIndent(
        '  ',
      ).convert(definition.toJson());

      setState(() => saving = true);
      final dbService = getIt.get<DbService>();
      final siteService = getIt.get<SiteService>();
      final old = widget.db;
      if (old == null) {
        await dbService.webDao.insert(
          WebTableCompanion.insert(blueprint: canonical, env: '{}'),
        );
      } else {
        final replacement = old.copyWith(blueprint: canonical);
        await dbService.webDao.replace(replacement);
        if (siteService.id == old.id) {
          await siteService.setNewSite(replacement);
        }
      }
      if (mounted) context.pop();
    } catch (error) {
      if (!mounted) return;
      await showCupertinoConfirmDialog(
        context: context,
        title: '规则校验失败',
        content: error.toString(),
        showCancel: false,
      );
    } finally {
      if (mounted) setState(() => saving = false);
    }
  }

  String _newDefinitionJson() {
    final id = 'site-${DateTime.now().microsecondsSinceEpoch}';
    return const JsonEncoder.withIndent('  ').convert({
      'schemaVersion': 2,
      'id': id,
      'name': 'New site',
      'baseUrl': 'https://example.com/',
      'parsers': <Object?>[],
      'endpoints': <Object?>[],
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
