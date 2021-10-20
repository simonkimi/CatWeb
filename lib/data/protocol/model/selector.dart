import 'package:cat_web/gen/protobuf/selector.pbserver.dart';
import 'package:get/get.dart';

class SelectorModel {
  SelectorModel([Selector? pb])
      : selector = pb?.selector.obs ?? ''.obs,
        function = pb?.function.obs ?? SelectorFunction.HTML.obs,
        param = pb?.param.obs ?? ''.obs,
        regex = pb?.regex.obs ?? ''.obs,
        replace = pb?.replace.obs ?? ''.obs,
        js = pb?.js.obs ?? ''.obs,
        computed = pb?.computed.obs ?? false.obs;

  final RxString selector;

  final Rx<SelectorFunction> function;
  final RxString param;
  final RxString regex;
  final RxString replace;
  final RxString js;
  final RxBool computed;

  Selector toPb() => Selector(
        selector: selector.value,
        function: function.value,
        param: param.value,
        regex: regex.value,
        replace: replace.value,
        js: js.value,
        computed: computed.value,
      );
}

class ExtraSelectorModel {
  ExtraSelectorModel(ExtraSelector? pb)
      : id = pb?.id.obs ?? ''.obs,
        selector = SelectorModel(pb?.selector),
        global = pb?.global.obs ?? false.obs;

  final RxString id;
  final SelectorModel selector;
  final RxBool global;

  ExtraSelector toPb() => ExtraSelector(
        selector: selector.toPb(),
        global: global.value,
        id: id.value,
      );
}

class ImageSelectorModel {
  ImageSelectorModel([ImageSelector? pb])
      : imgUrl = SelectorModel(pb?.imgUrl),
        imgWidth = SelectorModel(pb?.imgWidth),
        imgHeight = SelectorModel(pb?.imgHeight),
        imgX = SelectorModel(pb?.imgX),
        imgY = SelectorModel(pb?.imgY);

  final SelectorModel imgUrl;
  final SelectorModel imgWidth;
  final SelectorModel imgHeight;
  final SelectorModel imgX;
  final SelectorModel imgY;

  ImageSelector toPb() => ImageSelector(
        imgHeight: imgHeight.toPb(),
        imgUrl: imgUrl.toPb(),
        imgWidth: imgWidth.toPb(),
        imgX: imgX.toPb(),
        imgY: imgY.toPb(),
      );
}

extension SelectorFunctionE on SelectorFunction {
  String get string {
    switch (this) {
      case SelectorFunction.ATTR:
        return 'Attr';
      case SelectorFunction.HTML:
        return 'Html';
      case SelectorFunction.STYLE:
        return 'Style';

      case SelectorFunction.TEXT:
      default:
        return 'Text';
    }
  }
}
