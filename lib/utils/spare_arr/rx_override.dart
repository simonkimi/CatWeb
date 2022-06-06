import 'dart:async';

import 'package:get/get.dart';

mixin RxObjectMixin<T> on NotifyManager<T> {
  late T innerValue;

  void refresh() {
    subject.add(value);
  }

  T call([T? v]) {
    if (v != null) {
      value = v;
    }
    return value;
  }

  bool firstRebuild = true;
  bool sentToStream = false;

  String get string => value.toString();

  @override
  String toString() => value.toString();

  /// Returns the json representation of `value`.
  dynamic toJson() => value;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object o) {
    // Todo, find a common implementation for the hashCode of different Types.
    if (o is T) return value == o;
    if (o is RxObjectMixin<T>) return value == o.value;
    return false;
  }

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode => innerValue.hashCode;

  /// Updates the [value] and adds it to the stream, updating the observer
  /// Widget, only if it's different from the previous value.
  set value(T val) {
    if (subject.isClosed) return;
    sentToStream = false;
    if (innerValue == val && !firstRebuild) return;
    firstRebuild = false;
    innerValue = val;
    sentToStream = true;
    subject.add(innerValue);
  }

  /// Returns the current [value]
  T get value {
    RxInterface.proxy?.addListener(subject);
    return innerValue;
  }

  Stream<T> get stream => subject.stream;

  /// Returns a [StreamSubscription] similar to [listen], but with the
  /// added benefit that it primes the stream with the current [value], rather
  /// than waiting for the next [value]. This should not be called in [onInit]
  /// or anywhere else during the build process.
  StreamSubscription<T> listenAndPump(void Function(T event) onData,
      {Function? onError, void Function()? onDone, bool? cancelOnError}) {
    final subscription = listen(
      onData,
      onError: onError,
      onDone: onDone,
      cancelOnError: cancelOnError,
    );

    subject.add(value);

    return subscription;
  }

  /// Binds an existing `Stream<T>` to this Rx<T> to keep the values in sync.
  /// You can bind multiple sources to update the value.
  /// Closing the subscription will happen automatically when the observer
  /// Widget (`GetX` or `Obx`) gets unmounted from the Widget tree.
  void bindStream(Stream<T> stream) {
    final listSubscriptions =
        _subscriptions[subject] ??= <StreamSubscription>[];
    listSubscriptions.add(stream.listen((va) => value = va));
  }
}

mixin NotifyManager<T> {
  GetStream<T> subject = GetStream<T>();
  final _subscriptions = <GetStream, List<StreamSubscription>>{};

  bool get canUpdate => _subscriptions.isNotEmpty;

  /// This is an internal method.
  /// Subscribe to changes on the inner stream.
  void addListener(GetStream<T> rxGetx) {
    if (!_subscriptions.containsKey(rxGetx)) {
      final subs = rxGetx.listen((data) {
        if (!subject.isClosed) subject.add(data);
      });
      final listSubscriptions =
          _subscriptions[rxGetx] ??= <StreamSubscription>[];
      listSubscriptions.add(subs);
    }
  }

  StreamSubscription<T> listen(
    void Function(T) onData, {
    Function? onError,
    void Function()? onDone,
    bool? cancelOnError,
  }) =>
      subject.listen(
        onData,
        onError: onError,
        onDone: onDone,
        cancelOnError: cancelOnError ?? false,
      );

  /// Closes the subscriptions for this Rx, releasing the resources.
  void close() {
    _subscriptions.forEach((getStream, subscriptions) {
      for (final subscription in subscriptions) {
        subscription.cancel();
      }
    });

    _subscriptions.clear();
    subject.close();
  }
}
