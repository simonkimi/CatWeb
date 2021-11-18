import 'package:catweb/gen/protobuf/selector.pbserver.dart';
import 'package:catweb/utils/utils.dart';
import 'package:get/get.dart';
import 'package:universal_html/html.dart';

import 'interface.dart';

class SelectorModel implements PbAble {
  SelectorModel([Selector? pb, bool computed = false])
      : selector = sobs(pb?.selector),
        function = pb?.function.obs ?? SelectorFunction.disable.obs,
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

  String? select(Element parent) {
    final dfv = defaultValue.value.isNotEmpty ? defaultValue.value : null;

    if (function.value == SelectorFunction.disable) {
      return dfv; // 禁用状态
    }
    final List<Element> elements =
        selector.isEmpty ? [parent] : parent.querySelectorAll(selector.value);
    for (final element in elements) {
      final param = callFunction(element);
      if (param != null) {
        final reg = callReg(param);
        // TODO js处理器
        return reg;
      }
    }
  }



  String? callReg(String param) {
    if (regex.value.isNotEmpty) {
      final RegExp reg = RegExp(regex.value);
      final match = reg.allMatches(param).toList();
      if (match.isEmpty) return null;
      if (replace.value.isEmpty) {
        return match[0][1]!;
      } else {
        var rep = replace.value;
        for (var i = match.length; i >= 1; i--) {
          rep = rep.replaceAll('\$$i', match[i - 1][1]!);
        }
        return rep;
      }
    } else {
      return param;
    }
  }

  String? callFunction(Element element) {
    switch (function.value) {
      case SelectorFunction.text:
        return element.text;
      case SelectorFunction.html:
        return element.innerHtml;
      case SelectorFunction.attr:
        if (param.value.contains(',')) {
          for (final p in param.value.split(',')) {
            final rv = element.attributes[p.trim()];
            if (rv != null) return rv;
          }
        } else {
          return element.attributes[param.value];
        }
        return null;
      case SelectorFunction.style:
        return element.style.toString();
      default:
        return null;
    }
  }
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
}

class CommentSelectorModel implements PbAble {
  CommentSelectorModel([CommentSelector? pb])
      : username = SelectorModel(pb?.username),
        postTime = SelectorModel(pb?.postTime),
        vote = SelectorModel(pb?.vote, true),
        content = SelectorModel(pb?.content);

  final SelectorModel username;
  final SelectorModel postTime;
  final SelectorModel vote;
  final SelectorModel content;

  @override
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
      case SelectorFunction.attr:
        return 'attr';
      case SelectorFunction.html:
        return 'html';
      case SelectorFunction.style:
        return 'style';
      case SelectorFunction.text:
        return 'text';
      case SelectorFunction.disable:
        return '';
    }
    return '';
  }
}
