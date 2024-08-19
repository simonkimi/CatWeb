import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'package:catweb/ui/theme/colors.dart';

class TripleReadonlyTextField extends StatelessWidget {
  final String labelText;
  final String value;

  final int minLine;
  final String? hintText;
  final bool padding;
  final String? description;

  final VoidCallback? onTap;

  const TripleReadonlyTextField({
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
              color: FixColor.title.resolveFrom(context),
              fontSize: 13,
            ),
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

class TripleTextField extends StatelessWidget {
  const TripleTextField({
    super.key,
    required this.labelText,
    this.value,
    this.minLine,
    this.hintText,
    this.description,
    this.prefix,
    this.inputFormatters,
    this.keyboardType,
    this.onSubmitted,
    this.controller,
  });

  final String labelText;
  final String? value;

  final int? minLine;
  final String? hintText;
  final String? description;
  final Widget? prefix;

  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onSubmitted;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    var c = controller ?? TextEditingController(text: value);
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
            controller: c,
            decoration: BoxDecoration(
              border: const Border(),
              color: CupertinoColors.systemGrey6,
              borderRadius: BorderRadius.circular(5),
            ),
            minLines: minLine ?? 1,
            maxLines: minLine,
            onEditingComplete: () {
              onSubmitted?.call(c.text);
            },
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

class TripleIntField extends StatelessWidget {
  const TripleIntField({
    super.key,
    required this.labelText,
    required this.value,
    this.hintText,
    this.description,
    this.prefix,
    this.onSubmitted,
    this.controller,
  });

  final String labelText;
  final int value;

  final String? hintText;
  final String? description;
  final Widget? prefix;

  final ValueChanged<int>? onSubmitted;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    var c = controller ?? TextEditingController(text: value.toString());
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
            controller: c,
            decoration: BoxDecoration(
              border: const Border(),
              color: CupertinoColors.systemGrey6,
              borderRadius: BorderRadius.circular(5),
            ),
            minLines: 1,
            onEditingComplete: () {
              onSubmitted?.call(int.parse(c.text));
            },
            prefix: prefix,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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

class TripleDoubleField extends StatelessWidget {
  const TripleDoubleField({
    super.key,
    required this.labelText,
    required this.value,
    this.hintText,
    this.description,
    this.prefix,
    this.onSubmitted,
    this.controller,
  });

  final String labelText;
  final double value;

  final String? hintText;
  final String? description;
  final Widget? prefix;

  final ValueChanged<double>? onSubmitted;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    var c = controller ?? TextEditingController(text: value.toString());
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
            controller: c,
            decoration: BoxDecoration(
              border: const Border(),
              color: CupertinoColors.systemGrey6,
              borderRadius: BorderRadius.circular(5),
            ),
            minLines: 1,
            onEditingComplete: () {
              onSubmitted?.call(double.tryParse(c.text) ?? 0);
            },
            prefix: prefix,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))
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

class TripleBoolField extends StatelessWidget {
  const TripleBoolField({
    super.key,
    required this.labelText,
    required this.value,
    this.description,
    this.onSubmitted,
  });

  final String labelText;
  final bool value;

  final String? description;
  final ValueChanged<bool>? onSubmitted;

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
          CupertinoSwitch(
            value: value,
            onChanged: (value) {
              onSubmitted?.call(value);
            },
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
