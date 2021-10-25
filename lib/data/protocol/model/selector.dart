import 'package:cat_web/gen/protobuf/selector.pbserver.dart';
import 'package:cat_web/utils/utils.dart';
import 'package:get/get.dart';

class SelectorModel {
  SelectorModel([Selector? pb, bool computed = false])
      : selector = sobs(pb?.selector),
        function = pb?.function.obs ?? SelectorFunction.NONE.obs,
        param = sobs(pb?.param),
        regex = sobs(pb?.regex),
        replace = sobs(pb?.replace),
        js = sobs(pb?.js),
        computed = pb?.computed.obs ?? computed.obs;

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
  ExtraSelectorModel([ExtraSelector? pb])
      : id = sobs(pb?.id),
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
        imgWidth = SelectorModel(pb?.imgWidth, true),
        imgHeight = SelectorModel(pb?.imgHeight, true),
        imgX = SelectorModel(pb?.imgX, true),
        imgY = SelectorModel(pb?.imgY, true);

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

class CommentSelectorModel {
  CommentSelectorModel([CommentSelector? pb])
      : username = SelectorModel(pb?.username),
        postTime = SelectorModel(pb?.postTime),
        vote = SelectorModel(pb?.vote, true),
        content = SelectorModel(pb?.content);

  final SelectorModel username;
  final SelectorModel postTime;
  final SelectorModel vote;
  final SelectorModel content;

  CommentSelector toPb() => CommentSelector(
        username: username.toPb(),
        postTime: postTime.toPb(),
        vote: vote.toPb(),
        content: content.toPb(),
      );
}

extension SelectorFunctionE on SelectorFunction {
  String get string {
    switch (this) {
      case SelectorFunction.ATTR:
        return 'attr';
      case SelectorFunction.HTML:
        return 'html';
      case SelectorFunction.STYLE:
        return 'style';
      case SelectorFunction.TEXT:
        return 'text';
      case SelectorFunction.NONE:
        return '';
    }
    return '';
  }
}
