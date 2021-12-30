import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

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
    Key? key,
    required this.labelText,
    required this.value,
    this.minLine = 1,
    this.hintText,
    this.padding = true,
    this.description,
    this.onTap,
  }) : super(key: key);

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
    Key? key,
    required this.labelText,
    required this.value,
    this.minLine = 1,
    this.hintText,
    this.padding = true,
    this.description,
  }) : super(key: key);

  final String labelText;
  final RxString value;

  final int minLine;
  final String? hintText;
  final bool padding;
  final String? description;

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
            controller: TextEditingController(text: value.value),
            decoration: BoxDecoration(
              border: const Border(),
              color: CupertinoColors.systemGrey6,
              borderRadius: BorderRadius.circular(5),
            ),
            minLines: minLine,
            maxLines: minLine,
            onChanged: (text) {
              value.value = text;
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

class CupertinoFormInput extends StatelessWidget {
  const CupertinoFormInput({
    Key? key,
    this.label,
    required this.value,
    this.width,
    this.decoration,
  }) : super(key: key);

  final BoxDecoration? decoration;
  final double? width;
  final RxString value;
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
