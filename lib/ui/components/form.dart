import 'dart:math';

import 'package:catweb/data/protocol/model/selector.dart';
import 'package:catweb/gen/protobuf/selector.pbserver.dart';
import 'package:catweb/utils/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:get/get.dart';

import 'dialog.dart';

Widget buildCardList(
  List<Widget> children, {
  EdgeInsets? padding,
}) {
  return Padding(
    padding: padding ?? const EdgeInsets.symmetric(horizontal: 5),
    child: Column(mainAxisSize: MainAxisSize.min, children: children),
  );
}

class StickyClassifyList extends StatelessWidget {
  const StickyClassifyList({
    Key? key,
    required this.title,
    required this.children,
  }) : super(key: key);

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return SliverStickyHeader(
      header: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.blue[100],
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.blue[800],
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      sliver: SliverList(delegate: SliverChildListDelegate(children)),
    );
  }
}

Widget buildCupertinoInput({
  required String label,
  required RxString value,
   double? width,
}) {
  return CupertinoTextField(
    controller: TextEditingController(text: value.value),
    decoration: const BoxDecoration(
      border: Border(),
    ),
    onChanged: (v) => value.value = v,
    style: const TextStyle(fontSize: 14),
    prefix: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        width: width,
        child: Text(
          label,
          style: const TextStyle(
            color: CupertinoColors.label,
            fontSize: 12,
          ),
        ),
      ),
    ),
  );
}

class RulesForm extends StatelessWidget {
  const RulesForm({
    Key? key,
    this.title,
    required this.selectorModel,
    this.onTap,
    this.extraSelectorModel,
    this.onDelete,
    this.field,
  })  : assert(title != null || extraSelectorModel != null),
        super(key: key);

  final String? title;
  final String? field;
  final SelectorModel selectorModel;
  final ExtraSelectorModel? extraSelectorModel;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;

  static const textWidth = 80.0;
  static final Color filledColor = Colors.grey[300]!;
  static const radius = 3.0;

  @override
  Widget build(BuildContext context) {
    final labelWidth = ['选择器', '函数', '参数', '正则', '替换']
        .map((e) => boundingTextSize(
            context: context,
            text: e,
            style: const TextStyle(
              color: CupertinoColors.label,
              fontSize: 12,
            )).width)
        .reduce(max);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        decoration: BoxDecoration(
          color: CupertinoColors.systemGrey6,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          children: [
            if (title != null)
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  title!,
                  style: const TextStyle(
                      color: CupertinoColors.label, fontSize: 12),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                decoration: BoxDecoration(
                  color: CupertinoColors.systemBackground,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    buildCupertinoInput(
                      label: '选择器',
                      value: selectorModel.selector,
                      width: labelWidth,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3),
                      child: Divider(height: 1, thickness: 0.3),
                    ),
                    buildFunction(
                      context: context,
                      width: labelWidth,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3),
                      child: Divider(height: 1, thickness: 0.3),
                    ),
                    buildCupertinoInput(
                      label: '参数',
                      value: selectorModel.param,
                      width: labelWidth,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3),
                      child: Divider(height: 1, thickness: 0.3),
                    ),
                    buildCupertinoInput(
                      label: '正则',
                      value: selectorModel.regex,
                      width: labelWidth,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3),
                      child: Divider(height: 1, thickness: 0.3),
                    ),
                    buildCupertinoInput(
                      label: '替换',
                      value: selectorModel.replace,
                      width: labelWidth,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildFunction({
    required BuildContext context,
    required double width,
  }) {
    return Obx(() {
      return CupertinoTextField(
        controller: TextEditingController(
          text: selectorModel.function.value.string,
        ),
        decoration: const BoxDecoration(
          border: Border(),
        ),
        style: const TextStyle(fontSize: 14),
        readOnly: true,
        onTap: () {
          showCupertinoSelectDialog<SelectorFunction>(
            context: context,
            items: [
              const SelectTileItem(
                title: 'auto',
                value: SelectorFunction.auto,
              ),
              SelectTileItem(
                title: SelectorFunction.raw.string,
                value: SelectorFunction.raw,
              ),
              SelectTileItem(
                title: SelectorFunction.text.string,
                value: SelectorFunction.text,
              ),
              SelectTileItem(
                title: SelectorFunction.attr.string,
                value: SelectorFunction.attr,
              ),
            ],
            selectedValue: selectorModel.function.value,
            title: '函数类型',
          ).then((v) {
            if (v != null) {
              selectorModel.function.value = v;
            }
          });
        },
        prefix: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
            width: width,
            child: const Text(
              '函数',
              style: TextStyle(
                color: CupertinoColors.label,
                fontSize: 12,
              ),
            ),
          ),
        ),
      );
    });
  }
}
