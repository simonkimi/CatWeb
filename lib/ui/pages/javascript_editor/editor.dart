import 'package:catweb/ui/components/dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/a11y-dark.dart';
import 'package:flutter_highlight/themes/a11y-light.dart';
import 'package:get/get.dart';

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

  late final inputController = TextEditingController(text: widget.js.value);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.isDarkMode ? const Color(0xff2b2b2b) : null,
      appBar: buildAppBar(context),
      floatingActionButton: buildFloatingActionButton(),
      body: isEdit ? buildInput(context) : buildHighlightView(),
    );
  }

  FloatingActionButton buildFloatingActionButton() {
    return FloatingActionButton(
      child: isEdit ? const Icon(Icons.check) : const Icon(Icons.edit),
      onPressed: () {
        setState(() {
          isEdit = !isEdit;
        });
      },
    );
  }

  Widget buildHighlightView() {
    return Obx(() => HighlightView(
          widget.js.value,
          language: 'javascript',
          theme: Get.isDarkMode ? a11yDarkTheme : a11yLightTheme,
        ));
  }

  Widget buildInput(BuildContext context) {
    return TextFormField(
      controller: inputController,
      minLines: 99999,
      maxLines: 99999,
      keyboardType: TextInputType.multiline,
      onChanged: (value) {
        widget.js.value = value;
      },
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: const Text('Javascript脚本',
          style: TextStyle(fontSize: 18, color: Colors.white)),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        iconSize: 18,
        color: Colors.white,
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      actions: [
        IconButton(
            onPressed: () {
              showConfirmDialog(context: context, text: '确定清除脚本?')
                  .then((value) {
                if (value == true) {
                  widget.js.value = '';
                  inputController.clear();
                }
              });
            },
            icon: const Icon(Icons.clear)),
      ],
    );
  }
}
