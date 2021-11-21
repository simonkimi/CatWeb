import 'package:catweb/ui/components/dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/a11y-dark.dart';
import 'package:flutter_highlight/themes/a11y-light.dart';
import 'package:get/get.dart';

import '../../../themes.dart';

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
        navigationBar: buildAppbar(context),
        child: SafeArea(
          child: isEdit ? buildInput(context) : buildHighlightView(),
        ),
      ),
    );
  }

  CupertinoNavigationBar buildAppbar(BuildContext context) {
    return CupertinoNavigationBar(
      leading: CupertinoButton(
        onPressed: () {
          Navigator.of(context).pop();
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

  Widget buildHighlightView() {
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
    final text = inputController.text.substring(0, offset);

    if (text.isNotEmpty &&
        text.codeUnits.last == 10 &&
        inputController.text.length > lastInput.length) {
      final reg = RegExp(r'\n|\r');
      final line = reg.allMatches(text).toList();

      final lineCode = text.substring(
          line.length == 1 ? 0 : line[line.length - 1].start, line.last.start);

      final spaceReg = RegExp(r'^(\s*)').firstMatch(lineCode);
      if (spaceReg != null && spaceReg.group(0) != null) {
        final space = spaceReg.group(0)!.length;
        final isChar = '{('.codeUnits.contains(text.trim().codeUnits.last);

        var insert = ' ' * space;
        if (isChar) {
          insert += ' ' * 4 + '\n' + ' ' * space;
        }
        final raw = inputController.text;
        inputController.text =
            raw.substring(0, offset) + insert + raw.substring(offset);
        inputController.selection = TextSelection.collapsed(
          offset: offset + (isChar ? space + 4 : space),
        );
      }
    }

    lastInput = inputController.text;
    widget.js.value = inputController.text;
  }

  Widget buildInput(BuildContext context) {
    return Stack(
      children: [
        CupertinoTextField(
          controller: inputController,
          minLines: 99999,
          maxLines: 99999,
          keyboardType: TextInputType.multiline,
          onChanged: onTextChange,
        ),
        Positioned(
          bottom: 1,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 40,
            child: ColoredBox(
              color: CupertinoColors.systemGrey6,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  buildInputHint(
                    context: context,
                    child: const Icon(CupertinoIcons.layers),
                    input: 'function hook(group) {\n    return group;\n}',
                    position: -2,
                  ),
                  buildInputHint(
                    context: context,
                    child: const Icon(CupertinoIcons.function),
                    input: 'function () {}',
                    position: 0 - '() {}'.length,
                  ),
                  buildInputHint(
                    context: context,
                    child: const Icon(CupertinoIcons.arrow_turn_down_left),
                    input: '\n',
                  ),
                  buildInputHint(
                    context: context,
                    child: const Icon(CupertinoIcons.arrow_right_to_line_alt),
                    input: '    ',
                  ),
                  buildInputHint(context: context, display: '('),
                  buildInputHint(context: context, display: ')'),
                  buildInputHint(context: context, display: '{'),
                  buildInputHint(context: context, display: '}'),
                  buildInputHint(context: context, display: '['),
                  buildInputHint(context: context, display: ']'),
                  buildInputHint(context: context, display: '\''),
                  buildInputHint(context: context, display: '"'),
                  buildInputHint(context: context, display: ';'),
                  buildInputHint(context: context, display: '!'),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildInputHint({
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
