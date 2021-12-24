import 'package:catweb/ui/components/dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/a11y-dark.dart';
import 'package:flutter_highlight/themes/a11y-light.dart';
import 'package:get/get.dart';

import 'package:catweb/theme/colors.dart';

class JavaScriptEditor extends StatefulWidget {
  const JavaScriptEditor({
    Key? key,
    required this.js,
  }) : super(key: key);

  final RxString js;

  @override
  _JavaScriptEditorState createState() => _JavaScriptEditorState();
}

class _JavaScriptEditorState extends State<JavaScriptEditor> {
  var isEdit = false;
  late final TextEditingController inputController;
  late var lastInput = widget.js.value;

  @override
  void initState() {
    inputController = TextEditingController(text: widget.js.value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (isEdit) {
          setState(() {
            isEdit = false;
          });
          return false;
        }
        return true;
      },
      child: CupertinoPageScaffold(
        navigationBar: _buildAppbar(context),
        child: SafeArea(
          child: isEdit ? _buildInput(context) : _buildHighlightView(),
        ),
      ),
    );
  }

  CupertinoNavigationBar _buildAppbar(BuildContext context) {
    return CupertinoNavigationBar(
      leading: CupertinoButton(
        onPressed: () {
          Get.back();
        },
        child: const Icon(CupertinoIcons.back),
        padding: EdgeInsets.zero,
        minSize: 0,
      ),
      middle: const Text('Javascript脚本'),
      border: const Border(),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CupertinoButton(
            onPressed: () {
              showCupertinoConfirmDialog(
                context: context,
                content: '确定清除脚本?',
              ).then((value) {
                if (value == true) {
                  widget.js.value = '';
                  inputController.clear();
                }
              });
            },
            child: const Icon(CupertinoIcons.clear),
            padding: EdgeInsets.zero,
            minSize: 0,
          ),
          const SizedBox(width: 10),
          CupertinoButton(
            onPressed: () {
              setState(() {
                isEdit = !isEdit;
              });
            },
            child: isEdit ? const Icon(Icons.check) : const Icon(Icons.edit),
            padding: EdgeInsets.zero,
            minSize: 0,
          ),
        ],
      ),
    );
  }

  Widget _buildHighlightView() {
    return Obx(() => SizedBox(
          width: double.infinity,
          child: HighlightView(
            widget.js.value,
            language: 'javascript',
            theme: isDarkMode(context) ? a11yDarkTheme : a11yLightTheme,
            tabSize: 2,
          ),
        ));
  }

  void onTextChange(String _) {
    final selection = inputController.selection;
    final offset = selection.baseOffset;

    final preText = inputController.text.substring(0, offset);
    final nextText = inputController.text.substring(offset);

    if (preText.isNotEmpty &&
        preText.codeUnits.last == 10 &&
        inputController.text.length > lastInput.length) {
      final reg = RegExp(r'\n|\r');
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

    lastInput = inputController.text;
    widget.js.value = inputController.text;
  }

  Widget _buildInput(BuildContext context) {
    return Stack(
      children: [
        CupertinoTextField(
          controller: inputController,
          minLines: 99999,
          maxLines: 99999,
          keyboardType: TextInputType.multiline,
          onChanged: onTextChange,
        ),
        _buildToolBar(context),
      ],
    );
  }

  Positioned _buildToolBar(BuildContext context) {
    return Positioned(
      bottom: 1,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 40,
        child: ColoredBox(
          color: CupertinoColors.systemGrey6.resolveFrom(context),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildInputHint(
                context: context,
                child: const Icon(CupertinoIcons.layers),
                input: 'function hook(group) {\n    return group;\n}',
                position: -2,
              ),
              _buildInputHint(
                context: context,
                child: const Icon(CupertinoIcons.function),
                input: 'function () {}',
                position: 0 - '() {}'.length,
              ),
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
        onTextChange('');
      },
    );
  }
}
