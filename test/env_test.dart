import 'package:catweb/env.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('loads the bundled env file without required keys', () async {
    await AppEnv.load();

    expect(AppEnv.maybeGet('MY_API_KEY'), isNull);
    expect(AppEnv.maybeGet('DOES_NOT_EXIST'), isNull);
  });
}
