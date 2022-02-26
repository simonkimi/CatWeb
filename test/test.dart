import 'dart:io';

import 'package:catweb/test/site/eh/eh_rules.dart';

void main() async {
  File('test/eh.catweb').writeAsBytesSync(ehTestSite.writeToBuffer());
}
