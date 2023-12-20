import 'package:catweb/utils/rx_list.dart';
import 'package:flutter/cupertino.dart';

extension AnyObs<T> on T {
  ValueNotifier<T> get obs => ValueNotifier(this);
}

extension ListObs<T> on List<T> {
  RxList<T> get obs => RxList<T>(this);
}

extension MapObs<K, V> on Map<K, V> {
  RxMap<K, V> get obs => RxMap<K, V>(this);
}

extension ObsStringHelper on ValueNotifier<String> {
  bool contains(String value) => value.contains(value);

  bool get isNotEmpty => value.isNotEmpty;

  int get length => value.length;
}
