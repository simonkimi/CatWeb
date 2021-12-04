import 'package:catweb/gen/protobuf/selector.pbserver.dart';
import 'package:catweb/utils/utils.dart';
import 'package:get/get.dart';

import 'interface.dart';

abstract class CombineSelector {
  Map<String, SelectorModel> get combine;
}

class SelectorModel implements PbAble {
  SelectorModel([Selector? pb, bool computed = false])
      : selector = sobs(pb?.selector),
        function = df(pb?.function, SelectorFunction.auto, pb?.hasFunction).obs,
        param = sobs(pb?.param),
        regex = sobs(pb?.regex),
        replace = sobs(pb?.replace),
        js = sobs(pb?.js),
        computed = pb?.computed.obs ?? computed.obs,
        defaultValue = sobs(pb?.defaultValue);

  final RxString selector;

  final Rx<SelectorFunction> function;
  final RxString param;
  final RxString regex;
  final RxString replace;
  final RxString js;
  final RxBool computed;
  final RxString defaultValue;

  @override
  Selector toPb() => Selector(
        selector: selector.value,
        function: function.value,
        param: param.value,
        regex: regex.value,
        replace: replace.value,
        js: js.value,
        computed: computed.value,
        defaultValue: defaultValue.value,
      );
}

class ExtraSelectorModel implements PbAble {
  ExtraSelectorModel([ExtraSelector? pb])
      : id = sobs(pb?.id),
        selector = SelectorModel(pb?.selector),
        global = pb?.global.obs ?? false.obs;

  final RxString id;
  final SelectorModel selector;
  final RxBool global;

  @override
  ExtraSelector toPb() => ExtraSelector(
        selector: selector.toPb(),
        global: global.value,
        id: id.value,
      );
}

class ImageSelectorModel implements PbAble {
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

  @override
  ImageSelector toPb() => ImageSelector(
        imgHeight: imgHeight.toPb(),
        imgUrl: imgUrl.toPb(),
        imgWidth: imgWidth.toPb(),
        imgX: imgX.toPb(),
        imgY: imgY.toPb(),
      );

  Map<String, SelectorModel> combine({String prefix = ''}) => {
        '${prefix}ImgUrl': imgUrl,
        '${prefix}ImgWidth': imgWidth,
        '${prefix}ImgHeight': imgHeight,
        '${prefix}ImgX': imgX,
        '${prefix}ImgY': imgY,
      };
}

class CommentSelectorModel implements PbAble, CombineSelector {
  CommentSelectorModel([CommentSelector? pb])
      : username = SelectorModel(pb?.username),
        postTime = SelectorModel(pb?.postTime),
        vote = SelectorModel(pb?.vote),
        content = SelectorModel(pb?.content),
        avatar = ImageSelectorModel(pb?.avatar);

  final SelectorModel username;
  final SelectorModel postTime;
  final SelectorModel vote;
  final SelectorModel content;
  final ImageSelectorModel avatar;

  @override
  CommentSelector toPb() => CommentSelector(
        username: username.toPb(),
        postTime: postTime.toPb(),
        vote: vote.toPb(),
        content: content.toPb(),
        avatar: avatar.toPb(),
      );

  @override
  Map<String, SelectorModel> get combine => {
        'username': username,
        'postTime': postTime,
        'vote': vote,
        'content': content,
      };
}

extension SelectorFunctionE on SelectorFunction {
  String get string {
    switch (this) {
      case SelectorFunction.attr:
        return 'attr';
      case SelectorFunction.raw:
        return 'raw';
      case SelectorFunction.text:
        return 'text';
      case SelectorFunction.auto:
        return '';
    }
    return '';
  }
}
