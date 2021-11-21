import 'dart:math';
import 'package:catweb/data/protocol/model/selector.dart';
import 'package:catweb/gen/protobuf/selector.pbserver.dart';
import 'package:catweb/ui/pages/javascript_editor/editor.dart';
import 'package:catweb/utils/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:get/get.dart';
import '../../themes.dart';
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
            color: isDarkMode(context) ? Colors.blue[800] : Colors.blue[100],
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
                    color: isDarkMode(context)
                        ? Colors.blue[100]
                        : Colors.blue[800],
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
  required BuildContext context,
  String? label,
  required RxString value,
  double? width,
  BoxDecoration? decoration,
}) {
  return CupertinoTextField(
    controller: TextEditingController(text: value.value),
    decoration: decoration ??
        const BoxDecoration(
          border: Border(),
        ),
    onChanged: (v) => value.value = v,
    style: const TextStyle(fontSize: 14),
    prefix: label != null
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              width: width,
              child: Text(
                label,
                style: TextStyle(
                  color: isDarkMode(context)
                      ? CupertinoColors.label.darkColor
                      : CupertinoColors.label,
                  fontSize: 12,
                ),
              ),
            ),
          )
        : null,
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
          color: isDarkMode(context)
              ? CupertinoColors.systemGrey6.darkColor
              : CupertinoColors.systemGrey6.color,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          children: [
            if (title != null)
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  title!,
                  style: TextStyle(
                    color: isDarkMode(context)
                        ? CupertinoColors.label.darkColor
                        : CupertinoColors.label,
                    fontSize: 12,
                  ),
                ),
              ),
            if (extraSelectorModel != null)
              Padding(
                padding: const EdgeInsets.only(top: 5, right: 100, left: 100),
                child: buildCupertinoInput(
                  context: context,
                  label: 'id',
                  value: extraSelectorModel!.id,
                  decoration: BoxDecoration(
                      border: const Border(),
                      color: CupertinoColors.systemBackground,
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                decoration: BoxDecoration(
                  color: isDarkMode(context)
                      ? CupertinoColors.systemBackground.darkColor
                      : CupertinoColors.systemBackground,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    buildCupertinoInput(
                      context: context,
                      label: '选择器',
                      value: selectorModel.selector,
                      width: labelWidth,
                    ),
                    buildDivider(context),
                    buildFunction(
                      context: context,
                      width: labelWidth,
                    ),
                    buildDivider(context),
                    buildCupertinoInput(
                      context: context,
                      label: '参数',
                      value: selectorModel.param,
                      width: labelWidth,
                    ),
                    buildDivider(context),
                    buildCupertinoInput(
                      context: context,
                      label: '正则',
                      value: selectorModel.regex,
                      width: labelWidth,
                    ),
                    buildDivider(context),
                    buildCupertinoInput(
                      context: context,
                      label: '替换',
                      value: selectorModel.replace,
                      width: labelWidth,
                    ),
                    if (extraSelectorModel != null) ...[
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3),
                        child: Divider(height: 1, thickness: 0.3),
                      ),
                      buildExtraController(context),
                    ],
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildDivider(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: Divider(
        height: 1,
        thickness: 0.3,
        color: isDarkMode(context)
            ? CupertinoColors.systemGrey6.darkColor
            : CupertinoColors.systemGrey6,
      ),
    );
  }

  Widget buildExtraController(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Obx(
            () => buildCheckButton(
              label: '计算',
              value: selectorModel.computed.value,
              onPressed: () {
                selectorModel.computed.value = !selectorModel.computed.value;
              },
            ),
          ),
          const SizedBox(width: 10),
          Obx(() => buildCheckButton(
                label: '全局',
                value: extraSelectorModel!.global.value,
                onPressed: () {
                  extraSelectorModel!.global.value =
                      !extraSelectorModel!.global.value;
                },
              )),
          const SizedBox(width: 10),
          Obx(() => buildCheckButton(
                label: 'Js脚本',
                value: selectorModel.js.isNotEmpty,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => JavaScriptEditor(
                            js: selectorModel.js,
                          )));
                },
              )),
          const Expanded(child: SizedBox()),
          CupertinoButton(
            minSize: 0,
            padding: EdgeInsets.zero,
            child: const Icon(
              Icons.delete,
              color: CupertinoColors.label,
              size: 18,
            ),
            onPressed: () async {
              final result =
                  await showConfirmDialog(context: context, text: '确认删除此字段?');
              if (result == true) {
                onDelete?.call();
              }
            },
          ),
        ],
      ),
    );
  }

  Widget buildCheckButton({
    required String label,
    required bool value,
    required VoidCallback onPressed,
  }) {
    return CupertinoButton(
      color: value ? CupertinoColors.activeBlue : CupertinoColors.inactiveGray,
      minSize: 0,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      child: Row(
        children: [
          if (value)
            const Icon(
              CupertinoIcons.check_mark,
              size: 12,
            ),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
            ),
          )
        ],
      ),
      onPressed: onPressed,
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
            child: Text(
              '函数',
              style: TextStyle(
                color: isDarkMode()
                    ? CupertinoColors.label.darkColor
                    : CupertinoColors.label,
                fontSize: 12,
              ),
            ),
          ),
        ),
      );
    });
  }
}
