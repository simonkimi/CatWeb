import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'package:catweb/ui/theme/colors.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

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
    final controller = useTextEditingController(text: value);
    useEffect(() {
      controller.text = value;
      return null;
    }, [value]);

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
            controller: controller,
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

class TripleTextField extends HookWidget {
  const TripleTextField({
    super.key,
    required this.labelText,
    this.initialValue,
    this.minLine,
    this.hintText,
    this.description,
    this.prefix,
    this.inputFormatters,
    this.keyboardType,
    this.onSubmitted,
    TextEditingController? controller,
  })  : outerController = controller,
        assert(initialValue == null || controller == null,
            'Cannot provide both value and controller'),
        assert(initialValue != null || controller != null,
            'Must provide either value or controller');

  final String labelText;
  final String? initialValue;

  final int? minLine;
  final String? hintText;
  final String? description;
  final Widget? prefix;

  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onSubmitted;
  final TextEditingController? outerController;

  @override
  Widget build(BuildContext context) {
    var controller = useMemoized(
        () => outerController ?? TextEditingController(text: initialValue),
        [outerController, initialValue]);

    useEffect(() {
      if (outerController == null) {
        controller.text = initialValue!;
      }

      return () {
        if (outerController == null) {
          controller.dispose();
        }
      };
    }, [outerController, initialValue]);

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
            controller: controller,
            decoration: BoxDecoration(
              border: const Border(),
              color: CupertinoColors.systemGrey6,
              borderRadius: BorderRadius.circular(5),
            ),
            minLines: minLine ?? 1,
            maxLines: minLine,
            onEditingComplete: () {
              onSubmitted?.call(controller.text);
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

class TripleIntField extends HookWidget {
  const TripleIntField({
    super.key,
    required this.labelText,
    required this.initialValue,
    this.hintText,
    this.description,
    this.prefix,
    this.onSubmitted,
  });

  final String labelText;
  final int initialValue;

  final String? hintText;
  final String? description;
  final Widget? prefix;

  final ValueChanged<int>? onSubmitted;

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController(text: initialValue.toString());
    useEffect(() {
      controller.text = initialValue.toString();
      return null;
    }, [initialValue]);

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
            controller: controller,
            decoration: BoxDecoration(
              border: const Border(),
              color: CupertinoColors.systemGrey6,
              borderRadius: BorderRadius.circular(5),
            ),
            minLines: 1,
            onEditingComplete: () {
              onSubmitted?.call(int.parse(controller.text));
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
    required this.initialValue,
    this.hintText,
    this.description,
    this.prefix,
    this.onSubmitted,
  });

  final String labelText;
  final double initialValue;

  final String? hintText;
  final String? description;
  final Widget? prefix;

  final ValueChanged<double>? onSubmitted;

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController(text: initialValue.toString());
    useEffect(() {
      controller.text = initialValue.toString();
      return null;
    }, [initialValue]);
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
            controller: controller,
            decoration: BoxDecoration(
              border: const Border(),
              color: CupertinoColors.systemGrey6,
              borderRadius: BorderRadius.circular(5),
            ),
            minLines: 1,
            onEditingComplete: () {
              onSubmitted?.call(double.tryParse(controller.text) ?? 0);
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
    required this.initialValue,
    this.description,
    this.onSubmitted,
  });

  final String labelText;
  final bool initialValue;

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
            value: initialValue,
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

class CupertinoText extends HookWidget {
  const CupertinoText({
    super.key,
    this.initialValue,
    TextEditingController? controller,
    this.decoration,
    this.padding,
    this.style,
    this.textDirection,
    this.onSubmitted,
    this.prefix,
    this.onEditingComplete,
  }) : outerController = controller;

  final String? initialValue;
  final TextEditingController? outerController;
  final BoxDecoration? decoration;
  final EdgeInsetsGeometry? padding;
  final TextStyle? style;
  final TextDirection? textDirection;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onEditingComplete;
  final Widget? prefix;

  @override
  Widget build(BuildContext context) {
    final controller = useMemoized(
        () => outerController ?? TextEditingController(text: initialValue),
        [outerController, initialValue]);
    useEffect(() {
      if (outerController == null) {
        controller.text = initialValue!;
      }

      return () {
        if (outerController == null) {
          controller.dispose();
        }
      };
    }, [outerController, initialValue]);

    return CupertinoTextField(
      controller: controller,
      decoration: decoration,
      padding: padding ?? const EdgeInsets.all(7.0),
      style: style,
      textDirection: textDirection,
      prefix: prefix,
      onEditingComplete: () {
        onEditingComplete?.call();
        onSubmitted?.call(controller.text);
      },
    );
  }
}

class CupertinoIntInput extends HookWidget {
  const CupertinoIntInput({
    super.key,
    required this.initialValue,
    required this.onSubmitted,
    this.decoration,
    this.height,
    this.width,
  });

  final int initialValue;
  final ValueChanged<int> onSubmitted;
  final BoxDecoration? decoration;
  final double? height;
  final double? width;

  Widget _buildTextField(ValueNotifier<bool> displayError) {
    final text = CupertinoText(
      initialValue: initialValue.toString(),
      onSubmitted: (value) {
        final parsed = int.tryParse(value);
        displayError.value = parsed == null;
        if (parsed != null) {
          onSubmitted(parsed);
        }
      },
      decoration: decoration,
    );
    if (height != null || width != null) {
      return SizedBox(
        width: width,
        height: height,
        child: text,
      );
    }
    return text;
  }

  @override
  Widget build(BuildContext context) {
    final displayError = useState(false);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildTextField(displayError),
        if (displayError.value)
          Text(
            '数字输入错误',
            style: TextStyle(
              color: CupertinoColors.systemRed.resolveFrom(context),
              fontSize: 13,
            ),
          ),
      ],
    );
  }
}

class CupertinoDoubleInput extends HookWidget {
  const CupertinoDoubleInput({
    super.key,
    required this.initialValue,
    required this.onSubmitted,
    this.decoration,
    this.height,
    this.width,
  });

  final double? height;
  final double? width;
  final double initialValue;
  final ValueChanged<double> onSubmitted;
  final BoxDecoration? decoration;

  Widget _buildTextField(ValueNotifier<bool> displayError) {
    final text = CupertinoText(
      initialValue: initialValue.toString(),
      onSubmitted: (value) {
        final parsed = double.tryParse(value);
        displayError.value = parsed == null;
        if (parsed != null) {
          onSubmitted(parsed);
        }
      },
      decoration: decoration,
    );
    if (height != null || width != null) {
      return SizedBox(
        width: width,
        height: height,
        child: text,
      );
    }
    return text;
  }

  @override
  Widget build(BuildContext context) {
    final displayError = useState(false);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildTextField(displayError),
        if (displayError.value)
          Text(
            '数字输入错误',
            style: TextStyle(
              color: CupertinoColors.systemRed.resolveFrom(context),
              fontSize: 13,
            ),
          ),
      ],
    );
  }
}
