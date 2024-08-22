import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'cupertino_input.dart';
import 'dialog.dart';

class NotifierTripleTextField<T extends ChangeNotifier>
    extends StatelessWidget {
  const NotifierTripleTextField({
    super.key,
    required this.labelText,
    required this.selector,
    this.save,
    this.onChanged,
    this.minLine,
    this.hintText,
    this.description,
    this.prefix,
    this.inputFormatters,
    this.keyboardType,
  });

  final String labelText;
  final String Function(T) selector;
  final void Function(String) Function(T)? save;
  final void Function(T, String)? onChanged;

  final int? minLine;
  final String? hintText;
  final String? description;
  final Widget? prefix;

  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Selector<T, String>(
      selector: (_, notifier) => selector(notifier),
      builder: (context, value, __) {
        return TripleTextField(
          labelText: labelText,
          initialValue: value,
          minLine: minLine,
          hintText: hintText,
          description: description,
          prefix: prefix,
          inputFormatters: inputFormatters,
          keyboardType: keyboardType,
          onSubmitted: (newValue) {
            if (save != null) {
              save!(context.read<T>())(newValue);
            }
            if (onChanged != null) {
              onChanged!(context.read<T>(), newValue);
            }
          },
        );
      },
    );
  }
}

class NotifierTripleNumberField<T extends ChangeNotifier>
    extends StatelessWidget {
  const NotifierTripleNumberField({
    super.key,
    required this.labelText,
    required this.selector,
    this.save,
    this.onChanged,
    this.minLine,
    this.hintText,
    this.description,
    this.prefix,
  });

  final String labelText;
  final int Function(T) selector;
  final void Function(int) Function(T)? save;
  final void Function(T, int)? onChanged;

  final int? minLine;
  final String? hintText;
  final String? description;
  final Widget? prefix;

  @override
  Widget build(BuildContext context) {
    return Selector<T, int>(
      selector: (_, notifier) => selector(notifier),
      builder: (context, value, __) {
        return TripleIntField(
          labelText: labelText,
          initialValue: value,
          hintText: hintText,
          description: description,
          prefix: prefix,
          onSubmitted: (newValue) {
            if (save != null) {
              save!(context.read<T>())(newValue);
            }
            if (onChanged != null) {
              onChanged!(context.read<T>(), newValue);
            }
          },
        );
      },
    );
  }
}

class NotifierTripleEnumField<TNotifier extends ChangeNotifier, TModel>
    extends StatelessWidget {
  const NotifierTripleEnumField({
    super.key,
    required this.selector,
    required this.labelText,
    this.description,
    this.enumToString,
    required this.items,
    this.save,
    this.onChanged,
  });

  final TModel Function(TNotifier) selector;

  final String labelText;
  final String? description;
  final String Function(TModel)? enumToString;
  final Iterable<SelectTileItem<TModel>> items;

  final void Function(TModel) Function(TNotifier)? save;
  final void Function(TNotifier, TModel)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Selector<TNotifier, TModel>(
      selector: (_, n) => selector(n),
      builder: (_, value, __) {
        return TripleReadonlyTextField(
          labelText: labelText,
          description: description,
          value: enumToString?.call(value) ?? value.toString(),
          onTap: () async {
            final result = await showCupertinoSelectDialog<TModel>(
              title: labelText,
              items: items,
              context: context,
            );
            if (result == null) return;
            if (save != null) {
              save!(context.read<TNotifier>())(result);
            }
            if (onChanged != null) {
              onChanged!(context.read<TNotifier>(), result);
            }
          },
        );
      },
    );
  }
}

class NotifierSwitchField<T extends ChangeNotifier> extends StatelessWidget {
  const NotifierSwitchField({
    super.key,
    required this.selector,
    this.scale,
    this.save,
    this.onChanged,
  });

  final bool Function(T) selector;
  final double? scale;
  final void Function(bool) Function(T)? save;
  final void Function(T, bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    final child = SizedBox(
      height: 20,
      child: CupertinoSwitch(
        value: selector(context.read<T>()),
        onChanged: (value) async {
          if (save != null) {
            save!(context.read<T>())(value);
          }
          if (onChanged != null) {
            onChanged!(context.read<T>(), value);
          }
        },
      ),
    );
    if (scale != null) {
      return Transform.scale(
        alignment: Alignment.centerRight,
        scale: scale,
        child: child,
      );
    }
    return child;
  }
}
