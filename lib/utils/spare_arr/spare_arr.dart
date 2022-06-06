import 'package:catweb/utils/spare_arr/rx_override.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' as raw_get;

class RxSpareArr<T>
    with NotifyManager<List<T?>>, RxObjectMixin<List<T?>>
    implements raw_get.RxInterface<List<T?>> {
  RxSpareArr() {
    innerValue = <T?>[];
  }

  int get length => value.length;

  int get size => value.whereType<T>().length;

  T? operator [](int index) {
    value[index];
    if (index >= length) {
      return null;
    }
    return value[index];
  }

  bool isNull(int index) => value[index] == null;
  bool isNotNull(int index) => !(value[index] == null);

  void operator []=(int index, T value) {
    if (index >= length) {
      innerValue.length = index + 1;
    }
    innerValue[index] = value;
    refresh();
  }

  void add(T item) {
    innerValue.add(item);
    refresh();
  }

  void addAll(Iterable<T> item) {
    innerValue.addAll(item);
    refresh();
  }

  void removeWhere(bool Function(T? element) test) {
    innerValue.removeWhere(test);
    refresh();
  }

  void retainWhere(bool Function(T? element) test) {
    innerValue.retainWhere(test);
    refresh();
  }

  void addAllFrom(int index, Iterable<T> items) {
    final list = items.toList();
    for (var i = 0; i < index; i++) {
      innerValue[index + i] = list[i];
    }
    refresh();
  }

  @override
  @protected
  List<T?> get value {
    raw_get.RxInterface.proxy?.addListener(subject);
    return innerValue;
  }

  void insertAll(int index, Iterable<T> iterable) {
    innerValue.insertAll(index, iterable);
    refresh();
  }

  Iterable<T?> get reversed => value.reversed;

  Iterable<T?> where(bool Function(T?) test) => value.where(test);

  Iterable<E> whereType<E>() => value.whereType<E>();

  Iterable<E> map<E>(E Function(T? e) toElement) => value.map(toElement);

  void sort([int Function(T? a, T? b)? compare]) {
    innerValue.sort(compare);
    refresh();
  }
}
