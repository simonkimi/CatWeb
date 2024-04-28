import 'package:catweb/ui/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'cupertino_input.dart';

class SelectorTextField<T extends ChangeNotifier> extends StatelessWidget {
  const SelectorTextField({
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
      builder: (_, value, __) {
        return CupertinoTextInput(
          labelText: labelText,
          value: value,
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

class SelectorNumberField<T extends ChangeNotifier> extends StatelessWidget {
  const SelectorNumberField({
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
      builder: (_, value, __) {
        return CupertinoNumberInput(
          labelText: labelText,
          value: value,
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
