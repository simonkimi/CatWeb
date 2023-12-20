import 'package:catweb/data/models/site_model/parser/field.dart';
import 'package:catweb/data/models/site_model/parser/selector.dart';
import 'package:catweb/ui/widgets/cupertino_divider.dart';
import 'package:catweb/ui/widgets/dialog.dart';
import 'package:catweb/utils/widget.dart';
import 'package:flutter/cupertino.dart';

class SelectorEditor extends StatelessWidget {
  SelectorEditor({
    super.key,
    Selector? selector,
    this.onlySelector = false,
    required this.title,
    this.extraSelector,
  })  : selector = selector ?? Selector();

  final bool onlySelector;
  final String title;
  final ExtraSelector? extraSelector;
  final Selector selector;

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
              value: selector.selector,
            ),
            const CupertinoDivider(height: 1),
            selector.type.obx((v) => _SelectorSelectPopup<SelectorType>(
                  text: v.value,
                  prefix: '类型',
                  items: SelectorType.values
                      .map((e) => SelectTileItem(
                            title: e.value,
                            value: e,
                          ))
                      .toList(),
                  value: selector.type,
                )),
            if (!onlySelector) ..._otherSelector(),
            if (extraSelector != null) ..._extraSelector(),
          ],
        ),
      ),
    );
  }

  List<Widget> _extraSelector() {
    return [];
  }

  List<Widget> _otherSelector() {
    return [
      const CupertinoDivider(height: 1),
      selector.function.obx((v) => _SelectorSelectPopup<SelectorFunctionType>(
            text: v.value,
            prefix: '函数',
            items: SelectorFunctionType.values
                .map((e) => SelectTileItem(
                      title: e.value,
                      value: e,
                    ))
                .toList(),
            value: selector.function,
          )),
      const CupertinoDivider(height: 1),
      selector.function.obx((v) {
        if (v.value != SelectorFunctionType.attr) {
          return const SizedBox();
        }
        return Column(
          children: [
            _SelectorText(
              prefix: '参数',
              value: selector.param,
            ),
            const CupertinoDivider(height: 1),
          ],
        );
      }),
      _SelectorText(
        prefix: '正则',
        value: selector.regex,
      ),
      const CupertinoDivider(height: 1),
      _SelectorText(
        prefix: '替换',
        value: selector.replace,
      ),
      const CupertinoDivider(height: 1),
      selector.script.type.obx((v) => _SelectorSelectPopup<ScriptFieldType>(
            text: v.value,
            prefix: '输出',
            items: ScriptFieldType.values
                .map((e) => SelectTileItem(
                      title: e.value,
                      value: e,
                    ))
                .toList(),
            value: selector.script.type,
          )),
      selector.script.type.obx((v) {
        if (v == ScriptFieldType.output) {
          return const SizedBox();
        }
        return Column(
          children: [
            const CupertinoDivider(height: 1),
            _SelectorText(
              prefix: '脚本',
              value: selector.script.script,
              multiline: true,
            ),
          ],
        );
      }),
      const CupertinoDivider(height: 1),
    ];
  }

  CupertinoNavigationBar _buildAppbar(BuildContext context) {
    return CupertinoNavigationBar(
      leading: null,
      automaticallyImplyLeading: false,
      padding: const EdgeInsetsDirectional.only(start: 10),
      middle: Text('规则: $title'),
      transitionBetweenRoutes: false,
      trailing: CupertinoButton(
        onPressed: () {
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
    required this.value,
    this.multiline = false,
  }) : super(key: key);

  final ValueNotifier<String> value;
  final String prefix;
  final bool multiline;

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController()..text = value.value;
    return CupertinoTextField.borderless(
      controller: controller,
      prefix: Text(
        prefix,
        style: TextStyle(
          color: CupertinoColors.secondaryLabel.resolveFrom(context),
          fontSize: 12,
        ),
      ),
      maxLines: multiline ? 5 : null,
      padding: const EdgeInsets.all(10),
      onEditingComplete: () {
        value.value = controller.text;
      },
      onTapOutside: (_) {
        value.value = controller.text;
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
    required this.value,
  }) : super(key: key);

  final ValueNotifier<T> value;
  final String prefix;
  final List<SelectTileItem<T>> items;
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
          selectedValue: value.value,
          onSelected: (e) {
            if (e == null) return;
            value.value = e;
          },
        );
      },
    );
  }
}
