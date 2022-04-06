import 'package:catweb/utils/icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SelectTileItem<T> {
  const SelectTileItem({
    required this.title,
    required this.value,
    this.destructive = false,
  });

  final String title;
  final T value;
  final bool destructive;
}

Future<T?> showCupertinoSelectDialog<T>({
  required BuildContext context,
  required List<SelectTileItem<T>> items,
  T? selectedValue,
  String? title,
  String? message,
  String? cancelText,
  bool barrierDismissible = true,
}) {
  return showCupertinoModalPopup(
    barrierDismissible: barrierDismissible,
    context: context,
    builder: (context) {
      return CupertinoActionSheet(
        title: title != null ? Text(title) : null,
        message: message != null ? Text(message) : null,
        actions: items.map((item) {
          return CupertinoActionSheetAction(
            child: Text(item.title),
            isDefaultAction: item.value == selectedValue,
            isDestructiveAction: item.destructive,
            onPressed: () {
              Navigator.pop(context, item.value);
            },
          );
        }).toList(),
        cancelButton: cancelText != null
            ? CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(cancelText),
              )
            : null,
      );
    },
  );
}

Future<bool?> showConfirmDialog({
  required BuildContext context,
  required String text,
}) async {
  return await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Text(text),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text('取消'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: const Text('确认'),
          ),
        ],
      );
    },
  );
}

Future<bool?> showCupertinoConfirmDialog({
  required BuildContext context,
  String? title,
  String? content,
  bool showCancel = false,
  String? confineText = '确认',
  String? cancelText = '取消',
}) {
  return showCupertinoDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return CupertinoAlertDialog(
        title: title != null ? Text(title) : null,
        content: content != null ? Text(content) : null,
        actions: [
          if (showCancel)
            CupertinoDialogAction(
              child: Text(cancelText ?? '取消'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
          CupertinoDialogAction(
            child: Text(confineText ?? '确认'),
            onPressed: () {
              Navigator.of(context).pop(true);
            },
          ),
        ],
      );
    },
  );
}

Future<T?> showSelectDialog<T>({
  required BuildContext context,
  required List<SelectTileItem<T>> items,
  T? selectedValue,
  required String title,
  bool displayRadio = true,
}) async {
  return await showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              const Divider(height: 0),
              ...items.map(
                (e) {
                  if (!displayRadio) {
                    return ListTile(
                      title: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Text(e.title),
                      ),
                      onTap: () {
                        Navigator.of(context).pop(e.value);
                      },
                    );
                  }
                  return RadioListTile<T>(
                    value: e.value,
                    groupValue: selectedValue,
                    onChanged: Navigator.of(context).pop,
                    title: Text(e.title),
                  );
                },
              )
            ],
          ),
        );
      });
}

Future<String?> showCupertinoIconDialog(BuildContext context) async {
  var filter = '';
  return showCupertinoDialog(
    barrierDismissible: true,
    context: context,
    builder: (context) {
      return CupertinoAlertDialog(
        title: const Text('图标'),
        content: StatefulBuilder(
          builder: (context, setState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 5),
                CupertinoTextField(
                  prefix: Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Icon(
                      CupertinoIcons.search,
                      color: CupertinoColors.inactiveGray.resolveFrom(context),
                      size: 15,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      filter = value;
                    });
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: GridView.extent(
                    maxCrossAxisExtent: 50,
                    padding: EdgeInsets.zero,
                    children: cupertinoIcons.entries
                        .where((e) => filter.isEmpty || e.key.contains(filter))
                        .map((e) => AspectRatio(
                              aspectRatio: 1,
                              child: CupertinoButton(
                                padding: EdgeInsets.zero,
                                child: Icon(e.value),
                                onPressed: () {
                                  Get.back(result: e.key);
                                },
                              ),
                            ))
                        .toList(),
                  ),
                )
              ],
            );
          },
        ),
      );
    },
  );
}

Future<String?> showCupertinoInputDialog(
  BuildContext context, {
  String? initialValue,
  String? title,
  TextInputType? keyboardType,
  List<TextInputFormatter>? inputFormatters,
}) async {
  final controller = TextEditingController(text: initialValue);
  return await showCupertinoDialog(
    barrierDismissible: true,
    context: context,
    builder: (context) {
      return CupertinoAlertDialog(
        title: Text(title ?? '请输入'),
        content: CupertinoTextField(
          controller: controller,
          autofocus: true,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
        ),
        actions: [
          CupertinoButton(
            child: const Text('取消'),
            onPressed: () {
              Get.back();
            },
          ),
          CupertinoButton(
            child: const Text('确定'),
            onPressed: () {
              Navigator.of(context).pop(controller.text);
            },
          ),
        ],
      );
    },
  );
}
