import 'package:flutter/cupertino.dart';

class CupertinoImageSlider extends StatefulWidget {
  const CupertinoImageSlider({
    Key? key,
    required this.value,
    required this.pageCount,
    this.onChanged,
  }) : super(key: key);

  final int value;
  final int pageCount;
  final ValueChanged<int>? onChanged;

  @override
  State<CupertinoImageSlider> createState() => _CupertinoImageSliderState();
}

class _CupertinoImageSliderState extends State<CupertinoImageSlider> {
  var _changeValue = 0;
  var _isChanging = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          ((_isChanging ? _changeValue : widget.value) + 1).toString(),
          style: const TextStyle(
            color: CupertinoColors.white,
          ),
        ),
        Expanded(
          child: CupertinoSlider(
            value: (_isChanging ? _changeValue : widget.value).toDouble(),
            min: 0,
            max: widget.pageCount.toDouble() - 1,
            onChanged: (value) {
              setState(() {
                _changeValue = value.toInt();
              });
            },
            onChangeStart: (value) {
              setState(() {
                _changeValue = value.toInt();
                _isChanging = true;
              });
            },
            onChangeEnd: (value) {
              setState(() {
                _isChanging = false;
              });
              widget.onChanged?.call(value.toInt());
            },
          ),
        ),
        Text(
          widget.pageCount.toString(),
          style: const TextStyle(
            color: CupertinoColors.white,
          ),
        ),
      ],
    );
  }
}
