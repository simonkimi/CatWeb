import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_notifier/state_notifier.dart';

final pref = FutureProvider((ref) async {
  return await SharedPreferences.getInstance();
});

class IntPrefValue extends StateNotifier<int> with LocatorMixin {
  IntPrefValue(this.key, super.value);

  final String key;

  int get value => super.state;

  void setValue() {
    final prefs = read<SharedPreferences>();
    prefs.setInt(key, value);
  }
}


