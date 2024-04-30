import 'package:catweb/data/models/site/field.dart';
import 'package:catweb/data/models/site/selector.dart';
import 'package:catweb/ui/widgets/cupertino_divider.dart';
import 'package:catweb/ui/widgets/dialog.dart';
import 'package:catweb/utils/enum_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'editor/selector_editor_notifier.dart';

class SelectorEditor extends StatelessWidget {
  const SelectorEditor({
    super.key,
    SelectorModel? selector,
    this.onlySelector = false,
    required this.title,
  }) : selector = selector ?? const SelectorModel();

  final bool onlySelector;
  final String title;
  final SelectorModel selector;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SelectorEditorNotifier(selector: selector),
      child: CupertinoPageScaffold(
        navigationBar: _buildAppbar(context),
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(10),
            children: [
              ..._buildMainSelector(context),
              ..._otherSelector(context),
              ..._extraSelector(context),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildMainSelector(BuildContext context) {
    return [
      _SelectorText(
        prefix: '选择器',
        selector: (n) => n.selector.selector,
        save: (n) => (v) => n.setSelectorValue,
      ),
      const CupertinoDivider(height: 1),
      _SelectorFactoryPopup<SelectorQuery, SelectorQueryType>(
        prefix: '类型',
        selector: (n) => n.selector.type,
        onChanged: (n) => (v) => n.setSelectorQuery(v),
        factory: SelectorQuery.fromType,
        toEnum: (e) => e.toType(),
        items: SelectorQueryType.values.map((e) {
          return SelectTileItem(
            title: e.getDescription(context),
            value: e,
          );
        }),
      ),
    ];
  }

  Iterable<Widget> _extraSelector(BuildContext context) sync* {}

  List<Widget> _otherSelector(BuildContext context) {
    if (onlySelector) return [];

    return [
      const CupertinoDivider(height: 1),
      _SelectorFactoryPopup<SelectorFunction, SelectorFunctionType>(
        prefix: '函数',
        selector: (n) => n.selector.function,
        onChanged: (n) => (v) => n.setSelectorFunction,
        factory: SelectorFunction.fromType,
        toEnum: (e) => e.toType(),
        items: SelectorFunctionType.values.map((e) {
          return SelectTileItem(
            title: e.getDescription(context),
            value: e,
          );
        }),
      ),
      Selector<SelectorEditorNotifier, SelectorFunction>(
        selector: (_, n) => n.selector.function,
        builder: (context, value, __) {
          switch (value) {
            case SelectorFunctionAttr(:final attr):
              return _CupertinoTextField(
                value: attr,
                prefix: '属性',
                onChanged: (value) {
                  context.read<SelectorEditorNotifier>().setSelectorFunction(
                        SelectorFunction.attr(attr: value),
                      );
                },
              );
            default:
              return const SizedBox();
          }
        },
      ),
      const CupertinoDivider(height: 1),
      _SelectorText(
        prefix: '正则',
        selector: (n) => n.selector.regex,
        save: (n) => (v) => n.setSelectorRegex,
      ),
      const CupertinoDivider(height: 1),
      _SelectorText(
        prefix: '替换',
        selector: (n) => n.selector.replace,
        save: (n) => (v) => n.setSelectorReplace,
      ),
      const CupertinoDivider(height: 1),
      _SelectorFactoryPopup<ScriptField, ScriptFieldType>(
        prefix: '脚本',
        selector: (n) => n.selector.script,
        onChanged: (n) => (v) => n.setSelectorScript,
        factory: ScriptField.fromType,
        toEnum: (e) => e.toType(),
        items: ScriptFieldType.values.map((e) {
          return SelectTileItem(
            title: e.getDescription(context),
            value: e,
          );
        }),
      ),
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
        padding: const EdgeInsets.only(right: 10),
        minSize: 0,
        child: const Text('保存'),
        onPressed: () {
          final model = context.read<SelectorEditorNotifier>().selector;
          Navigator.of(context).pop(model);
        },
      ),
    );
  }
}

class _CupertinoTextField extends StatelessWidget {
  const _CupertinoTextField({
    required this.prefix,
    required this.value,
    required this.onChanged,
  });

  final String prefix;
  final String value;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return CupertinoTextField(
      controller: controller..text = value,
      prefix: Text(
        prefix,
        style: TextStyle(
          color: CupertinoColors.secondaryLabel.resolveFrom(context),
          fontSize: 12,
        ),
      ),
      padding: const EdgeInsets.all(10),
      onEditingComplete: () {
        onChanged(controller.text);
      },
    );
  }
}

class _SelectorText extends StatelessWidget {
  const _SelectorText({
    required this.prefix,
    required this.selector,
    required this.save,
  });

  final String prefix;
  final String Function(SelectorEditorNotifier) selector;
  final void Function(String) Function(SelectorEditorNotifier) save;

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return Selector<SelectorEditorNotifier, String>(
      selector: (_, n) => selector(n),
      builder: (_, value, __) {
        return CupertinoTextField(
          controller: controller..text = value,
          prefix: Text(
            prefix,
            style: TextStyle(
              color: CupertinoColors.secondaryLabel.resolveFrom(context),
              fontSize: 12,
            ),
          ),
          padding: const EdgeInsets.all(10),
          onEditingComplete: () {
            save(context.read<SelectorEditorNotifier>())(controller.text);
          },
        );
      },
    );
  }
}

class _SelectorFactoryPopup<T, E extends IEnumDescription>
    extends StatelessWidget {
  const _SelectorFactoryPopup({
    super.key,
    required this.prefix,
    required this.selector,
    required this.onChanged,
    required this.items,
    required this.factory,
    required this.toEnum,
  });

  final T Function(SelectorEditorNotifier) selector;
  final void Function(T) Function(SelectorEditorNotifier) onChanged;

  final T Function(E) factory;
  final E Function(T) toEnum;

  final Iterable<SelectTileItem<E>> items;
  final String prefix;

  @override
  Widget build(BuildContext context) {
    return Selector<SelectorEditorNotifier, T>(
      selector: (_, n) => selector(n),
      builder: (_, value, __) {
        return _ReadonlyTextField(
          prefix: prefix,
          value: toEnum(value).getDescription(context),
          onTap: () {
            showCupertinoSelectDialog<E>(
              context: context,
              items: items,
              selectedValue: toEnum(value),
              onSelected: (e) {
                if (e == null) return;
                onChanged(context.read<SelectorEditorNotifier>())(factory(e));
              },
            );
          },
        );
      },
    );
  }
}

class _ReadonlyTextField extends StatelessWidget {
  const _ReadonlyTextField({
    required this.prefix,
    required this.value,
    required this.onTap,
  });

  final String prefix;
  final String value;
  final GestureTapCallback onTap;

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
      controller: TextEditingController()..text = value,
      padding: const EdgeInsets.all(10),
      readOnly: true,
      onTap: onTap,
    );
  }
}
