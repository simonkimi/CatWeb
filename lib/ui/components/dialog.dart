import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectTileItem<T> {
  const SelectTileItem({required this.title, required this.value});

  final String title;
  final T value;
}

Future<T?> showCupertinoSelectDialog<T>({
  required BuildContext context,
  required List<SelectTileItem<T>> items,
  T? selectedValue,
  String? title,
  String? message,
  String? cancelText,
}) {
  return showCupertinoModalPopup(
    context: context,
    builder: (context) {
      return CupertinoActionSheet(
        title: title != null ? Text(title) : null,
        message: message != null ? Text(message) : null,
        actions: items.map((item) {
          return CupertinoActionSheetAction(
            child: Text(item.title),
            isDefaultAction: item.value == selectedValue,
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
}) {
  return showCupertinoDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return CupertinoAlertDialog(
        title: title != null ? Text(title) : null,
        content: content != null ? Text(content) : null,
        actions: [
          CupertinoDialogAction(
            child: const Text('取消'),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
          ),
          CupertinoDialogAction(
            child: const Text('确认'),
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
