import 'package:catweb/ui/pages/view_page/image/controller/image_read_notifier.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

class CupertinoImageSlider extends HookWidget {
  const CupertinoImageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final isChanging = useState(false);
    final changeValue = useState(0);
    final ReaderNotifier controller = context.watch();

    final pageCount = controller.imageLoadNotifier.readerInfo.itemCount;
    final currentDisplay = isChanging.value
        ? changeValue.value
        : controller.currentPage;

    return Row(
      children: [
        Text(
          (currentDisplay + 1).toString(),
          style: const TextStyle(color: CupertinoColors.white),
        ),
        Expanded(
          child: CupertinoSlider(
            value: pageCount > 1
                ? currentDisplay.clamp(0, pageCount - 1).toDouble()
                : 0,
            min: 0,
            max: pageCount > 1 ? pageCount - 1 : 1,
            onChanged: pageCount > 1
                ? (value) {
                    changeValue.value = value.toInt();
                  }
                : null,
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
          style: const TextStyle(color: CupertinoColors.white),
        ),
      ],
    );
  }
}
