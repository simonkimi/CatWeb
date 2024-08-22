import 'dart:async';

import 'package:flutter/cupertino.dart';


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
