import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'cupertino_input.dart';

class SelectorTextField<T extends ChangeNotifier> extends StatelessWidget {
  const SelectorTextField({
    super.key,
    required this.labelText,
    required this.selector,
    required this.save,
    this.minLine,
    this.hintText,
    this.description,
    this.prefix,
    this.inputFormatters,
    this.keyboardType,
  });

  final String labelText;
  final String Function(T) selector;
  final void Function(String) Function(T) save;

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
            save(context.read<T>())(newValue);
          },
        );
      },
    );
  }
}
