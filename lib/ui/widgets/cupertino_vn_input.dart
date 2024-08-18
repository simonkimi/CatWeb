import 'dart:async';

import 'package:catweb/ui/theme/colors.dart';
import 'package:catweb/ui/widgets/dialog.dart';
import 'package:catweb/utils/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'cupertino_input.dart';

class TripleVnTextField extends StatelessWidget {
  const TripleVnTextField({
    super.key,
    required this.labelText,
    required this.value,
    this.minLine = 1,
    this.hintText,
    this.padding = true,
    this.description,
    this.prefix,
    this.inputFormatters,
    this.keyboardType,
  });

  final String labelText;
  final ValueNotifier<String> value;

  final int minLine;
  final String? hintText;
  final bool padding;
  final String? description;
  final Widget? prefix;

  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: TextStyle(
              color: FixColor.title.resolveFrom(context),
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 3),
          CupertinoTextField(
            controller: TextEditingController(text: value.value)
              ..selection = TextSelection.collapsed(
                offset: value.value.length,
              ),
            decoration: BoxDecoration(
              border: const Border(),
              color: CupertinoColors.systemGrey6,
              borderRadius: BorderRadius.circular(5),
            ),
            minLines: minLine,
            maxLines: minLine,
            onChanged: (v) => value.value = v,
            prefix: prefix,
            inputFormatters: inputFormatters,
            keyboardType: keyboardType,
          ),
          if (description != null)
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                description!,
                style: TextStyle(
                  color: CupertinoColors.secondaryLabel.resolveFrom(context),
                  fontSize: 13,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class TripleVnEnumField<T> extends StatelessWidget {
  const TripleVnEnumField({
    super.key,
    required this.field,
    required this.labelText,
    required this.items,
    this.selectionConverter,
  });

  final ValueNotifier<T> field;
  final String labelText;
  final String Function(T)? selectionConverter;
  final Iterable<T> items;

  @override
  Widget build(BuildContext context) {
    return field.obx((value) => TripleReadonlyTextField(
          labelText: labelText,
          value: selectionConverter?.call(value) ?? value.toString(),
          onTap: () async {
            final result = await showCupertinoSelectDialog<T>(
              title: labelText,
              items: items.map((e) => SelectTileItem(
                    title: selectionConverter?.call(e) ?? e.toString(),
                    value: e,
                  )),
              context: context,
            );
            if (result != null) {
              field.value = result;
            }
          },
        ));
  }
}

class TripleVnNumberField extends StatelessWidget {
  const TripleVnNumberField({
    super.key,
    required this.labelText,
    required this.value,
    this.hintText,
    this.padding = true,
    this.description,
    this.prefix,
    this.onSubmitted,
  });

  final String labelText;
  final int value;

  final String? hintText;
  final bool padding;
  final String? description;
  final Widget? prefix;
  final ValueChanged<int>? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return TripleTextField(
      labelText: labelText,
      value: value.toString(),
      prefix: prefix,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      keyboardType: TextInputType.number,
      description: description,
      onSubmitted: (v) => onSubmitted?.call(int.parse(v)),
    );
  }
}

class VnSwitchField extends StatelessWidget {
  const VnSwitchField({
    super.key,
    required this.value,
    this.scale,
    this.onChanged,
  });

  final ValueNotifier<bool> value;
  final double? scale;
  final FutureOr<bool> Function(bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    final child = SizedBox(
      height: 20,
      child: CupertinoSwitch(
        value: value.value,
        onChanged: (v) async {
          final result = await onChanged?.call(v);
          value.value = result ?? v;
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
