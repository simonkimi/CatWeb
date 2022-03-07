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

class BufferStream<T, E> extends Stream<E> {
  BufferStream({
    required Stream<T> stream,
    required T initData,
    required this.transmission,
  }) : _stream = stream {
    buffer = transmission(initData);
  }

  final Stream<T> _stream;
  final E Function(T from) transmission;

  late E buffer;

  @override
  StreamSubscription<E> listen(void Function(E event)? onData,
      {Function? onError, void Function()? onDone, bool? cancelOnError}) {
    return _stream.map(transmission).listen(
      (event) {
        buffer = event;
        onData?.call(buffer);
      },
      onError: onError,
      onDone: onDone,
      cancelOnError: cancelOnError,
    );
  }
}
