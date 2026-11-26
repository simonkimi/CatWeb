import 'dart:async';
import 'package:cupertino_ui/cupertino_ui.dart';

class DelayTask {
  Timer? _timer;

  void post(Duration delay, VoidCallback callback) {
    _timer?.cancel();
    _timer = Timer(delay, callback);
  }

  void cancel() => _timer?.cancel();

  bool get isCanceled => _timer?.isActive == false;
}
