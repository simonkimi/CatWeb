import 'package:catweb/data/models/site_model/fields/field.dart';
import 'package:catweb/data/models/site_model/parser/selector.dart';
import 'package:catweb/ui/widgets/cupertino_divider.dart';
import 'package:catweb/ui/widgets/dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SelectorEditor extends StatelessWidget {
  SelectorEditor({
    Key? key,
    this.onChanged,
    Selector? selector,
    this.onlySelector = false,
    required this.title,
  })  : rxSelector = (selector ?? const Selector()).obs,
        super(key: key);

  final Rx<Selector> rxSelector;
  final Function(Selector)? onChanged;
  final bool onlySelector;
  final String title;

  Selector get selector => rxSelector.value;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: _buildAppbar(context),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            _SelectorText(
              prefix: '选择器',
              text: selector.selector,
              onChanged: (value) {
                rxSelector(selector.copyWith(selector: value));
              },
            ),
            const CupertinoDivider(height: 1),
            Obx(() => _SelectorSelectPopup<SelectorType>(
                text: selector.type.value,
                prefix: '类型',
                items: SelectorType.values
                    .map((e) => SelectTileItem(
                          title: e.value,
                          value: e,
                        ))
                    .toList(),
                value: selector.type,
                onSelected: (value) {
                  if (value == null) return;
                  rxSelector(selector.copyWith(type: value));
                })),
            if (!onlySelector) ..._otherSelector(),
          ],
        ),
      ),
    );
  }

  List<Widget> _otherSelector() {
    return [
      const CupertinoDivider(height: 1),
      Obx(() => _SelectorSelectPopup<SelectorFunctionType>(
          text: selector.function.value,
          prefix: '函数',
          items: SelectorFunctionType.values
              .map((e) => SelectTileItem(
                    title: e.value,
                    value: e,
                  ))
              .toList(),
          value: selector.function,
          onSelected: (value) {
            if (value == null) return;
            rxSelector(selector.copyWith(function: value));
          })),
      const CupertinoDivider(height: 1),
      Obx(() {
        if (selector.function != SelectorFunctionType.attr) {
          return const SizedBox();
        }
        return Column(
          children: [
            _SelectorText(
              prefix: '参数',
              text: selector.param,
              onChanged: (value) {
                rxSelector(selector.copyWith(param: value));
              },
            ),
            const CupertinoDivider(height: 1),
          ],
        );
      }),
      _SelectorText(
        prefix: '正则',
        text: selector.regex,
        onChanged: (value) {
          rxSelector(selector.copyWith(regex: value));
        },
      ),
      const CupertinoDivider(height: 1),
      _SelectorText(
        prefix: '替换',
        text: selector.replace,
        onChanged: (value) {
          rxSelector(selector.copyWith(replace: value));
        },
      ),
      const CupertinoDivider(height: 1),
      Obx(() => _SelectorSelectPopup<ScriptFieldType>(
          text: selector.script.type.value,
          prefix: '输出',
          items: ScriptFieldType.values
              .map((e) => SelectTileItem(
                    title: e.value,
                    value: e,
                  ))
              .toList(),
          value: selector.script.type,
          onSelected: (value) {
            if (value == null) return;
            rxSelector(selector.copyWith(
              script: selector.script.copyWith(
                type: value,
              ),
            ));
          })),
      Obx(() {
        if (selector.script.type == ScriptFieldType.output ||
            selector.script.type == ScriptFieldType.computed) {
          return const SizedBox();
        }
        return Column(
          children: [
            const CupertinoDivider(height: 1),
            _SelectorText(
              prefix: '脚本',
              text: selector.script.script,
              multiline: true,
              onChanged: (value) {
                rxSelector(selector.copyWith(
                  script: selector.script.copyWith(
                    script: value,
                  ),
                ));
              },
            ),
          ],
        );
      }),
      const CupertinoDivider(height: 1),
    ];
  }

  CupertinoNavigationBar _buildAppbar(BuildContext context) {
    return CupertinoNavigationBar(
      padding: const EdgeInsetsDirectional.only(start: 10),
      leading: CupertinoButton(
        onPressed: () => Navigator.of(context).pop(),
        padding: const EdgeInsets.symmetric(horizontal: 5),
        minSize: 0,
        child: const Text('取消'),
      ),
      middle: Text('规则: $title'),
      transitionBetweenRoutes: false,
      trailing: CupertinoButton(
        onPressed: () {
          onChanged?.call(selector);
          Navigator.of(context).pop();
        },
        padding: const EdgeInsets.only(right: 10),
        minSize: 0,
        child: const Text('确定'),
      ),
    );
  }
}

class _SelectorText extends StatelessWidget {
  const _SelectorText({
    Key? key,
    required this.prefix,
    required this.text,
    this.onChanged,
    this.multiline = false,
  }) : super(key: key);

  final String text;
  final String prefix;
  final Function(String)? onChanged;
  final bool multiline;

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController()..text = text;
    return CupertinoTextField.borderless(
      controller: controller,
      prefix: Text(
        prefix,
        style: TextStyle(
          color: CupertinoColors.secondaryLabel.resolveFrom(context),
          fontSize: 12,
        ),
      ),
      maxLines: multiline ? 5: null,
      padding: const EdgeInsets.all(10),
      onEditingComplete: () {
        onChanged?.call(controller.text);
      },
      onTapOutside: (_) {
        onChanged?.call(controller.text);
      },
    );
  }
}

class _SelectorSelectPopup<T> extends StatelessWidget {
  const _SelectorSelectPopup({
    Key? key,
    required this.prefix,
    required this.items,
    required this.text,
    this.value,
    this.onSelected,
  }) : super(key: key);

  final T? value;
  final String prefix;
  final List<SelectTileItem<T>> items;
  final Function(T?)? onSelected;
  final String text;

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField.borderless(
      prefix: Text(
        prefix,
        style: TextStyle(
          color: CupertinoColors.secondaryLabel.resolveFrom(context),
          fontSize: 12,
        ),
      ),
      controller: TextEditingController()..text = text,
      padding: const EdgeInsets.all(10),
      readOnly: true,
      onTap: () {
        showCupertinoSelectDialog<T>(
          context: context,
          items: items,
          onSelected: onSelected,
          selectedValue: value,
        );
      },
    );
  }
}
