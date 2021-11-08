import 'package:catweb/data/protocol/model/selector.dart';
import 'package:catweb/gen/protobuf/selector.pbserver.dart';
import 'package:catweb/ui/components/checkbox_tile.dart';
import 'package:catweb/ui/components/dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dialog.dart';

Widget buildInputForm({
  required String labelText,
  required RxString value,
  int minLine = 1,
  String? hintText,
  bool padding = true,
}) {
  return TextFormField(
    initialValue: value.value,
    decoration: InputDecoration(
      labelText: labelText,
      isDense: true,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      hintText: hintText,
    ),
    onChanged: (v) => value.value = v,
    maxLines: minLine,
  );
}

Widget buildCardList(
  List<Widget> children, {
  EdgeInsets? padding,
}) {
  return Card(
    child: Padding(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 5),
      child: Column(mainAxisSize: MainAxisSize.min, children: children),
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
    final widget = Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (extraSelectorModel == null)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title!),
                const SizedBox(width: 5),
                if (field != null)
                  Text('(${field!})'),
              ],
            ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (extraSelectorModel != null) buildText(context, '名称'),
                  buildText(context, '选择器'),
                  buildText(context, '函数'),
                  Obx(() {
                    // 参数
                    if (selectorModel.function.value ==
                            SelectorFunction.STYLE ||
                        selectorModel.function.value == SelectorFunction.ATTR) {
                      return buildText(context, '参数');
                    }
                    return const SizedBox();
                  }),
                  buildText(context, '正则'),
                  buildText(context, '替换'),
                ],
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    if (extraSelectorModel != null)
                      buildForm(extraSelectorModel!.id),
                    buildForm(selectorModel.selector), // 选择器
                    buildFunction(context), // 函数
                    Obx(() {
                      // 参数
                      if (selectorModel.function.value ==
                              SelectorFunction.STYLE ||
                          selectorModel.function.value ==
                              SelectorFunction.ATTR) {
                        return buildForm(selectorModel.param);
                      }
                      return const SizedBox();
                    }),
                    buildForm(selectorModel.regex), // 正则
                    buildForm(selectorModel.replace), // 替换
                  ],
                ),
              ),
            ],
          ),
          if (extraSelectorModel != null)
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(() => CheckBoxTile(
                      text: '计算',
                      value: selectorModel.computed.value,
                      onChanged: (value) {
                        selectorModel.computed.value = value!;
                      },
                      textColor: Theme.of(context).textTheme.headline1!.color,
                    )),
                const SizedBox(width: 10),
                Obx(() => CheckBoxTile(
                      text: '全局',
                      value: extraSelectorModel!.global.value,
                      onChanged: (value) {
                        extraSelectorModel!.global.value = value!;
                      },
                      textColor: Theme.of(context).textTheme.headline1!.color,
                    )),
                const SizedBox(width: 10),
                Obx(() => CheckBoxTile(
                      text: 'Js脚本',
                      value: selectorModel.js.isNotEmpty,
                      onChanged: (value) {
                        // TODO js处理器
                      },
                      textColor: Theme.of(context).textTheme.headline1!.color,
                    )),
                const Expanded(child: SizedBox()),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () async {
                    final result = await showConfirmDialog(
                        context: context, text: '确认删除此字段?');
                    if (result == true) {
                      onDelete?.call();
                    }
                  },
                ),
              ],
            ),
        ],
      ),
    );
    return onTap != null
        ? InkWell(
            onTap: onTap,
            child: widget,
          )
        : widget;
  }

  Widget buildText(BuildContext context, String text) {
    return SizedBox(
      height: 30,
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: Theme.of(context).textTheme.headline1!.color),
        ),
      ),
    );
  }

  Widget buildForm(RxString value) {
    return SizedBox(
      height: 30,
      child: Center(
        child: Obx(() => TextFormField(
              initialValue: value.value,
              decoration: const InputDecoration(
                isDense: true,
                isCollapsed: true,
              ),
              onChanged: (v) {
                value.value = v;
              },
            )),
      ),
    );
  }

  Widget buildFunction(BuildContext context) {
    return InkWell(
      onTap: () {
        showSelectDialog<SelectorFunction>(
          context: context,
          items: [
            SelectTileItem(
              title: SelectorFunction.HTML.string,
              value: SelectorFunction.HTML,
            ),
            SelectTileItem(
              title: SelectorFunction.TEXT.string,
              value: SelectorFunction.TEXT,
            ),
            SelectTileItem(
              title: SelectorFunction.STYLE.string,
              value: SelectorFunction.STYLE,
            ),
            SelectTileItem(
              title: SelectorFunction.ATTR.string,
              value: SelectorFunction.ATTR,
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
      child: SizedBox(
        height: 30,
        child: Center(
          child: Obx(() => TextFormField(
                controller: TextEditingController(
                    text: selectorModel.function.value.string),
                decoration: const InputDecoration(
                  isDense: true,
                  isCollapsed: true,
                  enabled: false,
                ),
              )),
        ),
      ),
    );
  }

  Widget buildFormItem(
    BuildContext context, {
    required String title,
    required RxString value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          SizedBox(
            width: textWidth,
            child: Text(
              title,
              style: TextStyle(
                color: Theme.of(context).textTheme.headline1!.color,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Obx(() => TextFormField(
                  initialValue: value.value,
                  decoration: const InputDecoration(
                    isDense: true,
                    isCollapsed: true,
                  ),
                  onChanged: (v) {
                    value.value = v;
                  },
                )),
          )
        ],
      ),
    );
  }
}
