import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CupertinoObxSwitch extends StatelessWidget {
  const CupertinoObxSwitch({
    Key? key,
    required this.value,
    this.scale,
  }) : super(key: key);

  final RxBool value;
  final double? scale;

  @override
  Widget build(BuildContext context) {
    final child = Obx(() => SizedBox(
      height: 20,
      child: CupertinoSwitch(
        value: value.value,
        onChanged: (value) => this.value.value = value,
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
