import 'package:flutter/material.dart';

class CheckBoxTile extends StatelessWidget {
  const CheckBoxTile({
    Key? key,
    required this.text,
    required this.value,
    required this.onChanged,
    this.textColor,
  }) : super(key: key);

  final String text;
  final bool value;
  final ValueChanged<bool?> onChanged;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: GestureDetector(
        onTap: () => onChanged(!value),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 18,
              width: 18,
              child: Checkbox(
                value: value,
                onChanged: onChanged,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),
            const SizedBox(width: 5),
            Text(
              text,
              style: TextStyle(color: textColor ?? Theme.of(context).primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
