import 'dart:convert';

import 'package:catweb/data/controller/db.dart';
import 'package:catweb/data/database/database.dart';
import 'package:catweb/data/site_runtime/site_compiler.dart';
import 'package:catweb/i18n.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_advanced_editor.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_editor_controller.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_endpoint_editor.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_form_fields.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_parser_editor.dart';
import 'package:catweb/ui/widgets/dialog.dart';
import 'package:catweb/ui/widgets/cupertino_divider.dart';
import 'package:catweb/ui/widgets/cupertino_input.dart';
import 'package:catweb/ui/widgets/tab_bar.dart';
import 'package:catweb/utils/context_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class RulesEditPage extends StatefulWidget {
  const RulesEditPage({super.key, this.db});

  final WebTableData? db;

  @override
  State<RulesEditPage> createState() => _RulesEditPageState();
}

class _RulesEditPageState extends State<RulesEditPage> {
  late final RulesEditorController editor;
  late final TextEditingController idController;
  late final TextEditingController nameController;
  late final TextEditingController baseUrlController;
  late final TextEditingController flagsController;
  late final TextEditingController loginUrlController;
  late final TextEditingController loginCookiePatternController;
  late final TextEditingController loginCookieDescriptionController;
  bool saving = false;

  @override
  void initState() {
    super.initState();
    editor = RulesEditorController.fromDatabase(widget.db);
    idController = TextEditingController(text: editor.definition.id);
    nameController = TextEditingController(text: editor.definition.name);
    baseUrlController = TextEditingController(text: editor.definition.baseUrl);
    final options = editor.definition.options;
    flagsController = TextEditingController(text: options.flags);
    loginUrlController = TextEditingController(text: options.loginUrl);
    loginCookiePatternController = TextEditingController(
      text: options.loginCookiePattern,
    );
    loginCookieDescriptionController = TextEditingController(
      text: options.loginCookieDescription,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: editor,
      child: PopScope(
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
          child: CupertinoTabBarView(
            tabs: [
              CupertinoTab(I.of(context).basic_setting),
              CupertinoTab(I.of(context).page_manager),
              CupertinoTab('解析器'),
              const CupertinoTab('高级'),
            ],
            children: [
              _buildBasicForm(),
              const RulesEndpointList(),
              const RulesParserList(),
              const RulesAdvancedEditor(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBasicForm() {
    return RuleFormPage(
      children: [
        if (editor.replacedInvalidRule)
          Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: CupertinoColors.systemOrange.withValues(alpha: 0.14),
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Text(
              '原规则不是当前 schema v2 格式。此处是一份新的空白规则，保存后将覆盖原记录。',
              style: TextStyle(fontSize: 13),
            ),
          ),
        TripleTextField(
          labelText: I.of(context).name,
          controller: nameController,
        ),
        TripleTextField(
          labelText: I.of(context).base_url,
          controller: baseUrlController,
          keyboardType: TextInputType.url,
        ),
        TripleTextField(labelText: '标志', controller: flagsController),
        const CupertinoDivider(height: 30),
        TripleTextField(
          labelText: I.of(context).login_url,
          controller: loginUrlController,
        ),
        TripleTextField(
          labelText: I.of(context).login_url_reg,
          controller: loginCookiePatternController,
        ),
        TripleTextField(
          labelText: 'Cookie 跨域说明',
          controller: loginCookieDescriptionController,
          minLine: 3,
        ),
        const CupertinoDivider(height: 30),
      ],
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
      editor.updateBasic(
        id: idController.text.trim(),
        name: nameController.text.trim(),
        baseUrl: baseUrlController.text.trim(),
      );
      editor.updateOptions(
        editor.definition.options.copyWith(
          flags: flagsController.text.trim(),
          loginUrl: loginUrlController.text.trim(),
          loginCookiePattern: loginCookiePatternController.text.trim(),
          loginCookieDescription: loginCookieDescriptionController.text.trim(),
        ),
      );
      final definition = const SiteCompiler()
          .compile(editor.definition)
          .definition;
      final serialized = const JsonEncoder.withIndent(
        '  ',
      ).convert(definition.toJson());

      setState(() => saving = true);
      final dbService = context.read<DbService>();
      final old = widget.db;
      if (old == null) {
        await dbService.webDao.insert(
          WebTableCompanion.insert(blueprint: serialized, env: '{}'),
        );
      } else {
        await dbService.webDao.replace(old.copyWith(blueprint: serialized));
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

  @override
  void dispose() {
    editor.dispose();
    idController.dispose();
    nameController.dispose();
    baseUrlController.dispose();
    flagsController.dispose();
    loginUrlController.dispose();
    loginCookiePatternController.dispose();
    loginCookieDescriptionController.dispose();
    super.dispose();
  }
}
