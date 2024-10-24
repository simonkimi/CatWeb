import 'package:catweb/data/constant.dart';
import 'package:catweb/i18n.dart';
import 'package:catweb/ui/widgets/dialog.dart';
import 'package:catweb/utils/context_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/a11y-dark.dart';
import 'package:flutter_highlight/themes/a11y-light.dart';

class JavaScriptEditor extends StatefulWidget {
  const JavaScriptEditor({
    super.key,
    required this.script,
  });

  final ValueNotifier<String> script;

  @override
  State<JavaScriptEditor> createState() => _JavaScriptEditorState();
}

class _JavaScriptEditorState extends State<JavaScriptEditor> {
  var isEditor = false;
  late final TextEditingController inputController;
  late var currentScript = widget.script.value;

  @override
  void initState() {
    inputController = TextEditingController(text: widget.script.value);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    inputController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: !isEditor,
      onPopInvoked: (didPop) {
        if (!didPop && isEditor) {
          setState(() {
            isEditor = false;
          });
        }
      },
      child: CupertinoPageScaffold(
        navigationBar: _buildAppbar(context),
        child: SafeArea(
          child: isEditor ? _buildInput(context) : _buildHighlightView(),
        ),
      ),
    );
  }

  CupertinoNavigationBar _buildAppbar(BuildContext context) {
    return CupertinoNavigationBar(
      leading: CupertinoButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        padding: EdgeInsets.zero,
        minSize: 0,
        child: const Icon(CupertinoIcons.back),
      ),
      middle: Text(I.of(context).script),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CupertinoButton(
            onPressed: () {
              showCupertinoConfirmDialog(
                context: context,
                content: I.of(context).script_clear,
              ).then((value) {
                if (value == true) {
                  widget.script.value = '';
                  inputController.clear();
                }
              });
            },
            padding: EdgeInsets.zero,
            minSize: 0,
            child: const Icon(CupertinoIcons.clear),
          ),
          const SizedBox(width: 10),
          CupertinoButton(
            onPressed: () {
              setState(() {
                isEditor = !isEditor;
              });
            },
            padding: EdgeInsets.zero,
            minSize: 0,
            child: isEditor ? const Icon(Icons.check) : const Icon(Icons.edit),
          ),
        ],
      ),
    );
  }

  Widget _buildHighlightView() {
    return ValueListenableBuilder(
        valueListenable: widget.script,
        builder: (context, value, child) {
          return SizedBox(
            width: double.infinity,
            child: HighlightView(
              value,
              language: 'javascript',
              theme: context.isDarkMode ? a11yDarkTheme : a11yLightTheme,
              tabSize: 2,
            ),
          );
        });
  }

  void _onTextChange(String _) {
    final selection = inputController.selection;
    final offset = selection.baseOffset;

    final preText = inputController.text.substring(0, offset);
    final nextText = inputController.text.substring(offset);

    if (preText.isNotEmpty &&
        preText.codeUnits.last == 10 &&
        inputController.text.length > currentScript.length) {
      final reg = RegExp(r'[\n\r]');
      final preLines = reg.allMatches(preText).toList();
      final nextLines = reg.allMatches(nextText).toList();

      // 当前输入行的上一行
      var lineCode = preText.substring(
        preLines.length == 1 ? 0 : preLines[preLines.length - 2].start,
        preLines.last.start,
      );

      // 去除换行符
      if (lineCode.codeUnitAt(0) == 10) lineCode = lineCode.substring(1);

      // 上一行空格数
      final space = lineCode.codeUnits.indexWhere((element) => element != 32);

      // 是否以{(开头, 如果是的话, 再加4个空格
      final isChar = '{('.codeUnits.contains(preText.trim().codeUnits.last);

      // 是否以})结尾, 如果是, 加一个换行符
      final nextLineCode = nextText
          .substring(0, nextLines.isNotEmpty ? nextLines.first.end : 0)
          .trim();
      final useNewLine =
          nextLineCode.endsWith('}') || nextLineCode.endsWith(')');

      // 生成补全
      var insert = ' ' * space;
      if (isChar) {
        insert += ' ' * 4 + (useNewLine ? '\n' : '') + ' ' * space;
      }

      // 设置文本
      final raw = inputController.text;
      inputController.text =
          raw.substring(0, offset) + insert + raw.substring(offset);
      inputController.selection = TextSelection.collapsed(
        offset: offset + (isChar ? space + 4 : space),
      );
    }

    currentScript = inputController.text;
    widget.script.value = inputController.text;
  }

  Widget _buildInput(BuildContext context) {
    return Stack(
      children: [
        CupertinoTextField(
          controller: inputController,
          minLines: 99999,
          maxLines: 99999,
          keyboardType: TextInputType.multiline,
          onChanged: _onTextChange,
        ),
        Positioned(
          bottom: 1,
          child: _buildToolBar(context),
        ),
      ],
    );
  }

  Widget _buildToolBar(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: kSuggestInputHeight,
      child: ColoredBox(
        color: CupertinoColors.systemGrey6.resolveFrom(context),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            _buildInputHint(
              context: context,
              child: const Icon(CupertinoIcons.arrow_turn_down_left),
              input: '\n',
            ),
            _buildInputHint(
              context: context,
              child: const Icon(CupertinoIcons.arrow_right_to_line_alt),
              input: '    ',
            ),
            _buildInputHint(context: context, display: '('),
            _buildInputHint(context: context, display: ')'),
            _buildInputHint(context: context, display: '{'),
            _buildInputHint(context: context, display: '}'),
            _buildInputHint(context: context, display: '['),
            _buildInputHint(context: context, display: ']'),
            _buildInputHint(context: context, display: "'"),
            _buildInputHint(context: context, display: '"'),
            _buildInputHint(context: context, display: ';'),
            _buildInputHint(context: context, display: '!'),
          ],
        ),
      ),
    );
  }

  Widget _buildInputHint({
    required BuildContext context,
    String? display,
    String? input,
    Widget? child,
    int? position,
  }) {
    assert(child != null || display != null);
    assert(display != null || input != null);
    return CupertinoButton(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      minSize: 0,
      child: child ?? Text(display!),
      onPressed: () {
        final offset = inputController.selection.baseOffset == -1
            ? inputController.text.length
            : inputController.selection.baseOffset;

        final text = inputController.text;
        inputController.text = text.substring(0, offset) +
            (input ?? display!) +
            text.substring(offset);
        inputController.selection = TextSelection.collapsed(
            offset:
                offset + (input?.length ?? display!.length) + (position ?? 0));
        _onTextChange('');
      },
    );
  }
}
