import 'package:cat_web/gen/protobuf/actions.pbserver.dart';
import 'package:cat_web/utils/utils.dart';
import 'package:get/get.dart';

class ActionModel {
  ActionModel([Action? pb])
      : name = sobs(pb?.name),
        label = sobs(pb?.label),
        url = sobs(pb?.url),
        data = sobs(pb?.data),
        icon = sobs(pb?.icon);

  final RxString name;
  final RxString label;
  final RxString url;
  final RxString data;
  final RxString icon;
}
