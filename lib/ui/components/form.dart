import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget buildInputForm({required String labelText, required RxString value}) {
  return TextFormField(
    initialValue: value.value,
    decoration: InputDecoration(
      labelText: labelText,
      isDense: true,
      floatingLabelBehavior: FloatingLabelBehavior.always,
    ),
    onChanged: (v) => value.value = v,
  );
}

Widget buildCardList(List<Widget> children) {
  return Card(
    child: Column(mainAxisSize: MainAxisSize.min, children: children),
  );
}
