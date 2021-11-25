import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class CupertinoInput extends StatelessWidget {
  const CupertinoInput({
    Key? key,
    required this.labelText,
    required this.value,
    this.minLine = 1,
    this.hintText,
    this.padding = true,
  }) : super(key: key);

  final String labelText;
  final RxString value;

  final int minLine;
  final String? hintText;
  final bool padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: TextStyle(
                color: CupertinoColors.label.resolveFrom(context),
                fontSize: 12),
          ),
          const SizedBox(height: 3),
          CupertinoTextField(
            decoration: BoxDecoration(
              border: const Border(),
              color: CupertinoColors.systemGrey6,
              borderRadius: BorderRadius.circular(5),
            ),
            minLines: minLine,
            maxLines: minLine,
          ),
        ],
      ),
    );
  }
}
