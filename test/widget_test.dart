import 'dart:io';
import 'package:flutter_test/flutter_test.dart';

import 'package:catweb/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    print('In windows: ${Platform.isWindows}');

  });
}
