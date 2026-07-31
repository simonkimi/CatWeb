import 'dart:typed_data';

import 'package:catweb/data/controller/site.dart';
import 'package:catweb/data/database/database.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('a null active site id never matches a database row', () {
    final row = WebTableData(
      id: 1,
      uuid: 'site-1',
      blueprint: '{}',
      env: '{}',
      favicon: Uint8List(0),
      lastOpen: 0,
      securityModel: true,
      loginCookies: '',
    );

    expect(findSiteById([row], null), isNull);
    expect(findSiteById([row], row.id), same(row));
  });
}
