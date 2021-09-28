import 'package:flutter/material.dart';

AppBar buildAppBar(
  BuildContext context, {
  String? title,
  PreferredSizeWidget? bottom,
}) {
  return AppBar(
    centerTitle: true,
    title: title != null
        ? Text(title, style: const TextStyle(fontSize: 18, color: Colors.white))
        : null,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios),
      iconSize: 18,
      color: Colors.white,
      onPressed: () {
        Navigator.of(context).pop();
      },
    ),
    bottom: bottom,
  );
}
