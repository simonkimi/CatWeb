import 'package:catweb/data/protocol/model/interface.dart';
import 'package:catweb/gen/protobuf/page.pbserver.dart';
import 'package:catweb/utils/utils.dart';
import 'package:get/get.dart';

class SitePageModel implements PbAble {
  SitePageModel(SitePage? pb)
      : name = sobs(pb?.name),
        url = sobs(pb?.url),
        type = pb?.type.obs ?? SitePageType.imageList.obs,
        rule = sobs(pb?.rule);

  final RxString name;
  final RxString url;
  final Rx<SitePageType> type;

  final RxString rule;

  @override
  SitePage toPb() => SitePage(
        name: name.value,
        type: type.value,
        url: url.value,
        rule: rule.value,
      );
}
