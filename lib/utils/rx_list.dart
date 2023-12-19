import 'package:flutter/cupertino.dart';

class RxList<T> extends ChangeNotifier {
  RxList([List<T>? initial]) : _value = initial ?? [];

  var _value = <T>[];

  set value(List<T> newValue) {
    _value = newValue;
    notifyListeners();
  }

  Map<int, T> asMap() {
    return _value.asMap();
  }

  void add(T value) {
    _value.add(value);
    notifyListeners();
  }

  void removeAt(int index) {
    _value.removeAt(index);
    notifyListeners();
  }

  void remove(T value) {
    _value.remove(value);
    notifyListeners();
  }

  void insert(int index, T value) {
    _value.insert(index, value);
    notifyListeners();
  }

  T operator [](int index) {
    return _value[index];
  }

  void operator []=(int index, T value) {
    _value[index] = value;
    notifyListeners();
  }

  List<E> map<E>(E Function(T e) f) {
    return _value.map(f).toList();
  }

  T? get(bool Function(T element) test) {
    for (final e in _value) {
      if (test(e)) return e;
    }
    return null;
  }

  Iterable<T> where(bool Function(T element) test) {
    return _value.where(test);
  }
}

class RxMap<K, V> extends ChangeNotifier {
  RxMap([Map<K, V>? initial]) : _value = initial ?? {};

  var _value = <K, V>{};

  Map<K, V> get value => _value;

  set value(Map<K, V> newValue) {
    _value = newValue;
    notifyListeners();
  }

  void add(K key, V value) {
    _value[key] = value;
    notifyListeners();
  }

  void remove(K key) {
    _value.remove(key);
    notifyListeners();
  }
}
