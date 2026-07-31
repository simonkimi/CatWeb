import 'package:catweb/data/controller/settings.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('direct notifier changes are persisted', () async {
    SharedPreferences.setMockInitialValues({});
    final service = await SettingService().init();
    addTearDown(service.dispose);

    service.concurrencyCountNotifier.value = 7;
    await Future<void>.delayed(Duration.zero);

    final preferences = await SharedPreferences.getInstance();
    expect(preferences.getInt('concurrencyCount'), 7);
  });
}
