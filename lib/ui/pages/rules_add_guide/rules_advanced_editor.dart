import 'package:catweb/data/site_runtime/site_definition.dart';
import 'package:catweb/i18n.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_editor_controller.dart';
import 'package:catweb/ui/widgets/cupertino_deletable_tile.dart';
import 'package:catweb/ui/widgets/cupertino_input.dart';
import 'package:catweb/ui/widgets/dialog.dart';
import 'package:catweb/utils/context_helper.dart';
import 'package:catweb/utils/hook_helper.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

class RulesAdvancedEditor extends HookWidget {
  const RulesAdvancedEditor({super.key});

  @override
  Widget build(BuildContext context) {
    final editor = context.watch<RulesEditorController>();
    final headerController = useSwipeActionController();
    final cookieController = useSwipeActionController();
    final options = editor.definition.options;

    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 10),
      children: [
        _SectionTitle('Headers'),
        Container(
          decoration: _decoration(context),
          child: Column(
            children: [
              for (final entry in options.headers.asMap().entries)
                CupertinoDeletableTile(
                  index: entry.key,
                  controller: headerController,
                  text: _ruleText(entry.value),
                  onDelete: (index) => _removeHeader(editor, index),
                  onTap: () => _editHeader(context, editor, entry.key),
                ),
              CupertinoClassicalListTile(
                icon: Icon(
                  CupertinoIcons.add_circled_solid,
                  color: CupertinoColors.systemGreen.resolveFrom(context),
                ),
                text: I.of(context).add,
                onTap: () => _addHeader(context, editor),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        _SectionTitle('Cookies'),
        Container(
          decoration: _decoration(context),
          child: Column(
            children: [
              for (final entry in options.cookies.asMap().entries)
                CupertinoDeletableTile(
                  index: entry.key,
                  controller: cookieController,
                  text: _ruleText(entry.value),
                  onDelete: (index) => _removeCookie(editor, index),
                  onTap: () => _editCookie(context, editor, entry.key),
                ),
              CupertinoClassicalListTile(
                icon: Icon(
                  CupertinoIcons.add_circled_solid,
                  color: CupertinoColors.systemGreen.resolveFrom(context),
                ),
                text: I.of(context).add,
                onTap: () => _addCookie(context, editor),
              ),
            ],
          ),
        ),
      ],
    );
  }

  BoxDecoration _decoration(BuildContext context) => BoxDecoration(
    color: CupertinoColors.systemBackground.resolveFrom(context),
    border: Border.symmetric(
      horizontal: BorderSide(
        width: 0.4,
        color: CupertinoColors.separator.resolveFrom(context),
      ),
    ),
  );

  Future<void> _addHeader(
    BuildContext context,
    RulesEditorController editor,
  ) async {
    final value = await _editRule(
      context,
      const DomainValueRule(mode: DomainMatchMode.all),
    );
    if (value == null) return;
    editor.updateOptions(
      editor.definition.options.copyWith(
        headers: [...editor.definition.options.headers, value],
      ),
    );
  }

  Future<void> _editHeader(
    BuildContext context,
    RulesEditorController editor,
    int index,
  ) async {
    final headers = [...editor.definition.options.headers];
    final value = await _editRule(context, headers[index]);
    if (value == null) return;
    headers[index] = value;
    editor.updateOptions(editor.definition.options.copyWith(headers: headers));
  }

  void _removeHeader(RulesEditorController editor, int index) {
    final headers = [...editor.definition.options.headers]..removeAt(index);
    editor.updateOptions(editor.definition.options.copyWith(headers: headers));
  }

  Future<void> _addCookie(
    BuildContext context,
    RulesEditorController editor,
  ) async {
    final value = await _editRule(
      context,
      const DomainValueRule(mode: DomainMatchMode.all),
    );
    if (value == null) return;
    editor.updateOptions(
      editor.definition.options.copyWith(
        cookies: [...editor.definition.options.cookies, value],
      ),
    );
  }

  Future<void> _editCookie(
    BuildContext context,
    RulesEditorController editor,
    int index,
  ) async {
    final cookies = [...editor.definition.options.cookies];
    final value = await _editRule(context, cookies[index]);
    if (value == null) return;
    cookies[index] = value;
    editor.updateOptions(editor.definition.options.copyWith(cookies: cookies));
  }

  void _removeCookie(RulesEditorController editor, int index) {
    final cookies = [...editor.definition.options.cookies]..removeAt(index);
    editor.updateOptions(editor.definition.options.copyWith(cookies: cookies));
  }

  Future<DomainValueRule?> _editRule(
    BuildContext context,
    DomainValueRule initialValue,
  ) {
    return showCupertinoDialog<DomainValueRule>(
      barrierDismissible: true,
      context: context,
      builder: (_) => _DomainValueDialog(initialValue: initialValue),
    );
  }
}

String _ruleText(DomainValueRule rule) {
  final scope = rule.mode == DomainMatchMode.all
      ? '全部'
      : '${_modeLabel(rule.mode)} ${rule.pattern}';
  return '$scope: ${rule.value}';
}

String _modeLabel(DomainMatchMode mode) {
  return switch (mode) {
    DomainMatchMode.all => '全部',
    DomainMatchMode.exact => '完整域名',
    DomainMatchMode.suffix => '域名后缀',
    DomainMatchMode.keyword => '域名关键字',
    DomainMatchMode.regex => '域名正则',
  };
}

String _patternLabel(DomainMatchMode mode) {
  return switch (mode) {
    DomainMatchMode.exact => '域名',
    DomainMatchMode.suffix => '域名后缀',
    DomainMatchMode.keyword => '关键字',
    DomainMatchMode.regex => '正则',
    DomainMatchMode.all => '匹配',
  };
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          color: CupertinoColors.secondaryLabel.resolveFrom(context),
        ),
      ),
    );
  }
}

class _DomainValueDialog extends HookWidget {
  const _DomainValueDialog({required this.initialValue});

  final DomainValueRule initialValue;

  @override
  Widget build(BuildContext context) {
    final mode = useState(initialValue.mode);
    final pattern = useTextEditingController(text: initialValue.pattern);
    final value = useTextEditingController(text: initialValue.value);
    return CupertinoAlertDialog(
      content: Column(
        children: [
          TripleReadonlyTextField(
            labelText: '匹配方式',
            value: _modeLabel(mode.value),
            onTap: () async {
              final selected = await showCupertinoSelectDialog<DomainMatchMode>(
                context: context,
                selectedValue: mode.value,
                cancelText: '取消',
                items: DomainMatchMode.values.map(
                  (item) =>
                      SelectTileItem(title: _modeLabel(item), value: item),
                ),
              );
              if (selected != null) mode.value = selected;
            },
          ),
          if (mode.value != DomainMatchMode.all)
            TripleTextField(
              labelText: _patternLabel(mode.value),
              controller: pattern,
            ),
          TripleTextField(labelText: '内容', controller: value),
        ],
      ),
      actions: [
        CupertinoDialogAction(
          onPressed: () => context.pop(),
          child: const Text('取消'),
        ),
        CupertinoDialogAction(
          onPressed: () => context.pop(
            DomainValueRule(
              mode: mode.value,
              pattern: mode.value == DomainMatchMode.all ? '' : pattern.text,
              value: value.text,
            ),
          ),
          child: const Text('确定'),
        ),
      ],
    );
  }
}
