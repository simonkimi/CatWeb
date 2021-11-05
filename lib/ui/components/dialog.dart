import 'package:flutter/material.dart';

class SelectTileItem<T> {
  const SelectTileItem({required this.title, required this.value});

  final String title;
  final T value;
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
