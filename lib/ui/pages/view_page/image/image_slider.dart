import 'package:catweb/ui/pages/view_page/image/controller/image_read_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

class CupertinoImageSlider extends HookWidget {
  const CupertinoImageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final isChanging = useState(false);
    final changeValue = useState(0);
    final ReaderNotifier controller = context.watch();

    final pageCount = controller.imageLoadNotifier.readerInfo.items.length;
    final currentDisplay =
        isChanging.value ? changeValue.value : controller.currentPage;

    return Row(
      children: [
        Text(
          (currentDisplay + 1).toString(),
          style: const TextStyle(
            color: CupertinoColors.white,
          ),
        ),
        Expanded(
          child: CupertinoSlider(
            value:
                (isChanging.value ? changeValue.value : controller.currentPage)
                    .toDouble(),
            min: 0,
            max: pageCount - 1,
            onChanged: (value) {
              changeValue.value = value.toInt();
            },
            onChangeStart: (value) {
              changeValue.value = value.toInt();
              isChanging.value = true;
            },
            onChangeEnd: (value) {
              isChanging.value = false;
              controller.jumpToPage(value.toInt());
            },
          ),
        ),
        Text(
          pageCount.toString(),
          style: const TextStyle(
            color: CupertinoColors.white,
          ),
        ),
      ],
    );
  }
}
