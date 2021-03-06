import 'package:catweb/gen/protobuf/selector.pbserver.dart';
import 'package:catweb/utils/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'interface.dart';

class SelectorModel implements PbAble {
  SelectorModel([Selector? pb])
      : selector = sobs(pb?.selector),
        function = df(pb?.function, SelectorFunction.SELECTOR_FUNCTION_AUTO,
                pb?.hasFunction)
            .obs,
        param = sobs(pb?.param),
        regex = sobs(pb?.regex),
        replace = sobs(pb?.replace),
        script = sobs(pb?.script),
        computed = pb?.computed.obs ?? false.obs,
        defaultValue = sobs(pb?.defaultValue);

  final RxString selector;

  final Rx<SelectorFunction> function;
  final RxString param;
  final RxString regex;
  final RxString replace;
  final RxString script;
  final RxBool computed;
  final RxString defaultValue;

  @override
  Selector toPb() => Selector(
        selector: selector.value,
        function: function.value,
        param: param.value,
        regex: regex.value,
        replace: replace.value,
        script: script.value,
        computed: computed.value,
        defaultValue: defaultValue.value,
      );
}

class ExtraSelectorModel implements PbAble {
  ExtraSelectorModel([ExtraSelector? pb, ExtraSelectorType? type])
      : id = sobs(pb?.id),
        selector = SelectorModel(pb?.selector),
        global = pb?.global.obs ?? false.obs,
        type = type?.obs ??
            pb?.type.obs ??
            ExtraSelectorType.EXTRA_SELECTOR_TYPE_NONE.obs;

  final RxString id;
  final SelectorModel selector;
  final RxBool global;
  final Rx<ExtraSelectorType> type;

  @override
  ExtraSelector toPb() => ExtraSelector(
        selector: selector.toPb(),
        global: global.value,
        id: id.value,
        type: type.value,
      );
}

class ImageSelectorModel implements PbAble {
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

  @override
  ImageSelector toPb() => ImageSelector(
        imgHeight: imgHeight.toPb(),
        imgUrl: imgUrl.toPb(),
        imgWidth: imgWidth.toPb(),
        imgX: imgX.toPb(),
        imgY: imgY.toPb(),
      );
}

class CommentSelectorModel implements PbAble {
  CommentSelectorModel([CommentSelector? pb])
      : username = SelectorModel(pb?.username),
        time = SelectorModel(pb?.time),
        score = SelectorModel(pb?.score),
        content = SelectorModel(pb?.content),
        avatar = ImageSelectorModel(pb?.avatar);

  final SelectorModel username;
  final SelectorModel time;
  final SelectorModel score;
  final SelectorModel content;
  final ImageSelectorModel avatar;

  @override
  CommentSelector toPb() => CommentSelector(
        username: username.toPb(),
        time: time.toPb(),
        score: score.toPb(),
        content: content.toPb(),
        avatar: avatar.toPb(),
      );
}

extension SelectorFunctionE on SelectorFunction {
  String get string {
    switch (this) {
      case SelectorFunction.SELECTOR_FUNCTION_ATTR:
        return 'attr';
      case SelectorFunction.SELECTOR_FUNCTION_RAW:
        return 'raw';
      case SelectorFunction.SELECTOR_FUNCTION_TEXT:
        return 'text';
      case SelectorFunction.SELECTOR_FUNCTION_AUTO:
        return '';
    }
    return '';
  }
}

extension ExtraSelectorTypeTr on ExtraSelectorType {
  String string(BuildContext context) {
    switch (this) {
      case ExtraSelectorType.EXTRA_SELECTOR_TYPE_GALLERY_BADGE:
        return '??????';
      case ExtraSelectorType.EXTRA_SELECTOR_TYPE_GALLERY_CHAPTER:
        return '??????';
      case ExtraSelectorType.EXTRA_SELECTOR_TYPE_GALLERY_COMMENT:
        return '??????';
      case ExtraSelectorType.EXTRA_SELECTOR_TYPE_GALLERY_THUMBNAIL:
        return '?????????';
      case ExtraSelectorType.EXTRA_SELECTOR_TYPE_LIST_ITEM:
        return '??????';
      case ExtraSelectorType.EXTRA_SELECTOR_TYPE_NONE:
        return '??????';
    }
    return '';
  }
}
