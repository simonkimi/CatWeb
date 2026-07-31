import 'package:catweb/data/database/tables/web_table.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('lastOpen default is an epoch timestamp in milliseconds', () {
    final before = DateTime.now().millisecondsSinceEpoch;
    final timestamp = currentTimestampMillis();
    final after = DateTime.now().millisecondsSinceEpoch;

    expect(timestamp, greaterThanOrEqualTo(before));
    expect(timestamp, lessThanOrEqualTo(after));
    expect(timestamp, greaterThan(1000000000000));
  });
}
