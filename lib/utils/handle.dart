import 'dart:async';
import 'package:flutter/cupertino.dart';

class Handler {
  Timer? _timer;

  void call(dynamic delay, VoidCallback callback) => post(delay, callback);

  void post(dynamic delay, VoidCallback callback) {
    assert(delay is num || delay is Duration);

    Duration duration;
    if (delay is num) {
      duration = Duration(seconds: delay.toInt());
    } else {
      duration = delay as Duration;
    }

    _timer?.cancel();
    _timer = Timer(duration, callback);
  }

  void cancel() => _timer?.cancel();

  bool get isCanceled => _timer?.isActive == false;
}

Handler post(dynamic delay, VoidCallback callback) {
  return Handler()..post(delay, callback);
}
