import 'dart:async';

import 'package:catweb/utils/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class CupertinoObxSwitch extends StatelessWidget {
  const CupertinoObxSwitch({
    super.key,
    required this.value,
    this.scale,
    this.onChange,
  });

  final ValueNotifier<bool> value;
  final double? scale;
  final FutureOr<bool> Function(bool value)? onChange;

  @override
  Widget build(BuildContext context) {
    final child = value.obx((v) => SizedBox(
          height: 20,
          child: CupertinoSwitch(
            value: v,
            onChanged: (value) async {
              this.value.value =
                  onChange != null ? await onChange!(value) : value;
            },
          ),
        ));
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
