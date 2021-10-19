import 'package:cat_web/data/protocol/model/selector.dart';
import 'package:cat_web/gen/protobuf/selector.pbserver.dart';
import 'package:cat_web/ui/components/select_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RulesForm extends StatelessWidget {
  const RulesForm({
    Key? key,
    required this.title,
    required this.selectorModel,
  }) : super(key: key);

  final String title;
  final SelectorModel selectorModel;

  @override
  Widget build(BuildContext context) {
    const height = 8.0;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title, style: const TextStyle(fontSize: 14)),
          buildFormItem(context, title: '选择器', value: selectorModel.selector),
          const SizedBox(height: height),
          buildFunction(context),
          Obx(() {
            if (selectorModel.function.value == SelectorFunction.STYLE ||
                selectorModel.function.value == SelectorFunction.ATTR) {
              return const SizedBox(height: height);
            }
            return const SizedBox();
          }),
          Obx(() {
            if (selectorModel.function.value == SelectorFunction.STYLE ||
                selectorModel.function.value == SelectorFunction.ATTR) {
              return buildFormItem(context,
                  title: '参数', value: selectorModel.param);
            }
            return const SizedBox();
          }),
          const SizedBox(height: height),
          buildFormItem(context, title: '正则', value: selectorModel.regex),
          const SizedBox(height: height),
          buildFormItem(context, title: '替换式', value: selectorModel.replace),
        ],
      ),
    );
  }

  Widget buildFunction(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 50,
          child: Text(
            '函数',
            style: TextStyle(
                fontSize: 13,
                color: Theme.of(context).textTheme.headline1!.color),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: InkWell(
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
        )
      ],
    );
  }

  Widget buildFormItem(
    BuildContext context, {
    required String title,
    required RxString value,
  }) {
    return Row(
      children: [
        SizedBox(
          width: 50,
          child: Text(
            title,
            style: TextStyle(
                fontSize: 13,
                color: Theme.of(context).textTheme.headline1!.color),
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
    );
  }
}
