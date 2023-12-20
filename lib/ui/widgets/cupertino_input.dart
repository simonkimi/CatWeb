import 'package:catweb/ui/widgets/dialog.dart';
import 'package:catweb/utils/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'package:catweb/ui/theme/colors.dart';

class CupertinoReadOnlyInput extends StatelessWidget {
  final String labelText;
  final String value;

  final int minLine;
  final String? hintText;
  final bool padding;
  final String? description;

  final VoidCallback? onTap;

  const CupertinoReadOnlyInput({
    super.key,
    required this.labelText,
    required this.value,
    this.minLine = 1,
    this.hintText,
    this.padding = true,
    this.description,
    this.onTap,
  });

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
                color: FixColor.title.resolveFrom(context), fontSize: 13),
          ),
          const SizedBox(height: 3),
          CupertinoTextField(
            controller: TextEditingController(text: value),
            decoration: BoxDecoration(
              border: const Border(),
              color: CupertinoColors.systemGrey6,
              borderRadius: BorderRadius.circular(5),
            ),
            minLines: minLine,
            maxLines: minLine,
            readOnly: true,
            onTap: onTap,
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

class CupertinoInput extends StatelessWidget {
  const CupertinoInput({
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
                color: FixColor.title.resolveFrom(context), fontSize: 13),
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

class CupertinoFormInput extends StatelessWidget {
  const CupertinoFormInput({
    super.key,
    this.label,
    required this.value,
    this.width,
    this.decoration,
  });

  final BoxDecoration? decoration;
  final double? width;
  final ValueNotifier<String> value;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      controller: TextEditingController(text: value.value)
        ..selection = TextSelection(
          baseOffset: value.value.length,
          extentOffset: value.value.length,
        ),
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
                  label!,
                  style: TextStyle(
                    color: FixColor.title.resolveFrom(context),
                    fontSize: 12,
                  ),
                ),
              ),
            )
          : null,
    );
  }
}

class CupertinoSelectInput<T> extends StatelessWidget {
  const CupertinoSelectInput({
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
    return field.obx((value) => CupertinoReadOnlyInput(
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

class CupertinoNumberInput extends StatelessWidget {
  const CupertinoNumberInput({
    super.key,
    required this.labelText,
    required this.value,
    this.minLine = 1,
    this.hintText,
    this.padding = true,
    this.description,
    this.prefix,
  });

  final String labelText;
  final ValueNotifier<int> value;

  final int minLine;
  final String? hintText;
  final bool padding;
  final String? description;
  final Widget? prefix;

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
                color: FixColor.title.resolveFrom(context), fontSize: 13),
          ),
          const SizedBox(height: 3),
          CupertinoTextField(
            controller: TextEditingController(text: value.value.toString())
              ..selection = TextSelection.collapsed(
                offset: value.value.toString().length,
              ),
            decoration: BoxDecoration(
              border: const Border(),
              color: CupertinoColors.systemGrey6,
              borderRadius: BorderRadius.circular(5),
            ),
            minLines: minLine,
            maxLines: minLine,
            onChanged: (v) => value.value = int.tryParse(v) ?? 0,
            prefix: prefix,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            keyboardType: TextInputType.number,
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
