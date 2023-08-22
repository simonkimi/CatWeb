import 'dart:convert';
import 'dart:io';

import 'package:catweb/data/models/site_model/pages/site_page.dart';
import 'package:catweb/data/models/site_model/pages/template.dart';
import 'package:catweb/test/site/eh/eh_rules.dart';
import 'package:catweb/test/site/eh/parser/list_parser.dart';

void main() {
  final displays = ehTestSite.pageList
      .where((p0) => p0.displayType.value == SiteDisplayType.show)
      .where((e) => true)
      .where((e) => [TemplateType.imageList, TemplateType.imageWaterFall]
          .contains(e.template.type))
      .toList();
  print(displays.length);
}
