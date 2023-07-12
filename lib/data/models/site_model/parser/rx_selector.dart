import 'package:catweb/data/models/site_model/parser/rx_field.dart';
import 'package:catweb/data/models/site_model/parser/selector.dart';
import 'package:get/get.dart';

class RxSelector {
  final RxString selector;

  final Rx<SelectorType> type;
  final Rx<SelectorFunctionType> function;
  final RxString param;
  final RxString regex;
  final RxString replace;
  final RxScriptField script;
  final RxString defaultValue;

  RxSelector({
    String selector = '',
    SelectorType type = SelectorType.css,
    SelectorFunctionType function = SelectorFunctionType.text,
    String param = '',
    String regex = '',
    String replace = '',
    RxScriptField? script,
    String defaultValue = '',
  })  : selector = selector.obs,
        type = type.obs,
        function = function.obs,
        param = param.obs,
        regex = regex.obs,
        replace = replace.obs,
        script = script ?? RxScriptField(),
        defaultValue = defaultValue.obs;

  Map<String, dynamic> toJson() => {
        'selector': selector.value,
        'type': type.value.value,
        'function': function.value.value,
        'param': param.value,
        'regex': regex.value,
        'replace': replace.value,
        'script': script.toJson(),
        'defaultValue': defaultValue.value,
      };

  factory RxSelector.fromJson(Map<String, dynamic> json) => RxSelector(
        selector: json['selector'] as String,
        type: SelectorType.fromJson(json['type'] as String),
        function: SelectorFunctionType.fromValue(json['function'] as String),
        param: json['param'] as String,
        regex: json['regex'] as String,
        replace: json['replace'] as String,
        script: RxScriptField.fromJson(json['script']),
        defaultValue: json['defaultValue'] as String,
      );
}

class RxImageSelector {
  final RxSelector imgUrl;
  final RxSelector imgWidth;
  final RxSelector imgHeight;
  final RxSelector imgX;
  final RxSelector imgY;

  RxImageSelector({
    RxSelector? imgUrl,
    RxSelector? imgWidth,
    RxSelector? imgHeight,
    RxSelector? imgX,
    RxSelector? imgY,
  })  : imgUrl = imgUrl ?? RxSelector(),
        imgWidth = imgWidth ?? RxSelector(),
        imgHeight = imgHeight ?? RxSelector(),
        imgX = imgX ?? RxSelector(),
        imgY = imgY ?? RxSelector();

  Map<String, dynamic> toJson() => {
        'imgUrl': imgUrl.toJson(),
        'imgWidth': imgWidth.toJson(),
        'imgHeight': imgHeight.toJson(),
        'imgX': imgX.toJson(),
        'imgY': imgY.toJson(),
      };

  factory RxImageSelector.fromJson(Map<String, dynamic> json) =>
      RxImageSelector(
        imgUrl: RxSelector.fromJson(json['imgUrl']),
        imgWidth: RxSelector.fromJson(json['imgWidth']),
        imgHeight: RxSelector.fromJson(json['imgHeight']),
        imgX: RxSelector.fromJson(json['imgX']),
        imgY: RxSelector.fromJson(json['imgY']),
      );
}

class RxCommentSelector {
  final RxSelector username;
  final RxSelector time;
  final RxSelector score;
  final RxSelector content;
  final RxImageSelector avatar;

  RxCommentSelector({
    RxSelector? username,
    RxSelector? time,
    RxSelector? score,
    RxSelector? content,
    RxImageSelector? avatar,
  })  : username = username ?? RxSelector(),
        time = time ?? RxSelector(),
        score = score ?? RxSelector(),
        content = content ?? RxSelector(),
        avatar = avatar ?? RxImageSelector();

  Map<String, dynamic> toJson() => {
        'username': username.toJson(),
        'time': time.toJson(),
        'score': score.toJson(),
        'content': content.toJson(),
        'avatar': avatar.toJson(),
      };

  factory RxCommentSelector.fromJson(Map<String, dynamic> json) =>
      RxCommentSelector(
        username: RxSelector.fromJson(json['username']),
        time: RxSelector.fromJson(json['time']),
        score: RxSelector.fromJson(json['score']),
        content: RxSelector.fromJson(json['content']),
        avatar: RxImageSelector.fromJson(json['avatar']),
      );
}

class RxExtraSelector {
  final Selector selector;
  final String id;
  final bool global;

  RxExtraSelector({
    Selector? selector,
    String? id,
    bool? global,
  })  : selector = selector ?? const Selector(),
        id = id ?? '',
        global = global ?? false;

  Map<String, dynamic> toJson() => {
        'selector': selector.toJson(),
        'id': id,
        'global': global,
      };

  factory RxExtraSelector.fromJson(Map<String, dynamic> json) =>
      RxExtraSelector(
        selector: Selector.fromJson(json['selector']),
        id: json['id'],
        global: json['global'],
      );
}
