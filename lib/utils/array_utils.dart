import 'dart:math';

class SparseList<E> implements List<E?> {
  final _map = <int, E?>{};

  Iterable<E?> get values => _map.values;

  @override
  int get length => _map.entries.fold(
      0,
      (previousValue, element) =>
          element.key > previousValue ? element.key : previousValue);

  @override
  E? operator [](int index) {
    return _map[index]!;
  }

  @override
  void operator []=(int index, E? value) {
    _map[index] = value;
  }

  @override
  set length(int newLength) {
    if (newLength < length) {
      _map.removeWhere((key, value) => key >= newLength);
    } else if (newLength > length) {
      for (var i = length; i < newLength; i++) {
        _map[i] = null;
      }
    }
  }

  @override
  Iterator<E?> get iterator => values.iterator;

  @override
  SparseList<E?> operator +(List<E?> other) {
    _map.addAll(other.asMap());
    return this;
  }

  @override
  void removeRange(int start, int end) {
    _map.removeWhere((key, value) => key >= start && key < end);
  }

  @override
  Iterable<E?> getRange(int start, int end) {
    return _map.entries
        .where((element) => element.key >= start && element.key < end)
        .map((element) => element.value);
  }

  @override
  Iterable<E> get reversed =>
      throw UnsupportedError('SparseList can not reversed');

  @override
  void removeWhere(bool Function(E? element) test) {
    _map.removeWhere((key, value) => test(value));
  }

  @override
  void fillRange(int start, int end, [E? fill]) {
    for (var i = start; i < end; i++) {
      _map[i] = fill;
    }
  }

  @override
  E? first;

  @override
  E? last;

  @override
  void add(E? value) => _map[length] = value;

  @override
  void addAll(Iterable<E?> iterable) {
    // TODO: implement addAll
  }

  @override
  bool any(bool Function(E? element) test) {
    // TODO: implement any
    throw UnimplementedError();
  }

  @override
  Map<int, E?> asMap() {
    // TODO: implement asMap
    throw UnimplementedError();
  }

  @override
  List<R> cast<R>() {
    // TODO: implement cast
    throw UnimplementedError();
  }

  @override
  void clear() {
    // TODO: implement clear
  }

  @override
  bool contains(Object? element) {
    // TODO: implement contains
    throw UnimplementedError();
  }

  @override
  E? elementAt(int index) {
    // TODO: implement elementAt
    throw UnimplementedError();
  }

  @override
  bool every(bool Function(E? element) test) {
    // TODO: implement every
    throw UnimplementedError();
  }

  @override
  Iterable<T> expand<T>(Iterable<T> Function(E? element) toElements) {
    // TODO: implement expand
    throw UnimplementedError();
  }

  @override
  E? firstWhere(bool Function(E? element) test, {E? Function()? orElse}) {
    // TODO: implement firstWhere
    throw UnimplementedError();
  }

  @override
  T fold<T>(T initialValue, T Function(T previousValue, E? element) combine) {
    // TODO: implement fold
    throw UnimplementedError();
  }

  @override
  Iterable<E?> followedBy(Iterable<E?> other) {
    // TODO: implement followedBy
    throw UnimplementedError();
  }

  @override
  void forEach(void Function(E? element) action) {
    // TODO: implement forEach
  }

  @override
  int indexOf(E? element, [int start = 0]) {
    // TODO: implement indexOf
    throw UnimplementedError();
  }

  @override
  int indexWhere(bool Function(E? element) test, [int start = 0]) {
    // TODO: implement indexWhere
    throw UnimplementedError();
  }

  @override
  void insert(int index, E? element) {
    // TODO: implement insert
  }

  @override
  void insertAll(int index, Iterable<E?> iterable) {
    // TODO: implement insertAll
  }

  @override
  // TODO: implement isEmpty
  bool get isEmpty => throw UnimplementedError();

  @override
  // TODO: implement isNotEmpty
  bool get isNotEmpty => throw UnimplementedError();

  @override
  String join([String separator = ""]) {
    // TODO: implement join
    throw UnimplementedError();
  }

  @override
  int lastIndexOf(E? element, [int? start]) {
    // TODO: implement lastIndexOf
    throw UnimplementedError();
  }

  @override
  int lastIndexWhere(bool Function(E? element) test, [int? start]) {
    // TODO: implement lastIndexWhere
    throw UnimplementedError();
  }

  @override
  E? lastWhere(bool Function(E? element) test, {E? Function()? orElse}) {
    // TODO: implement lastWhere
    throw UnimplementedError();
  }

  @override
  Iterable<T> map<T>(T Function(E? e) toElement) {
    // TODO: implement map
    throw UnimplementedError();
  }

  @override
  E? reduce(E? Function(E? value, E? element) combine) {
    // TODO: implement reduce
    throw UnimplementedError();
  }

  @override
  bool remove(Object? value) {
    // TODO: implement remove
    throw UnimplementedError();
  }

  @override
  E? removeAt(int index) {
    // TODO: implement removeAt
    throw UnimplementedError();
  }

  @override
  E? removeLast() {
    // TODO: implement removeLast
    throw UnimplementedError();
  }

  @override
  void replaceRange(int start, int end, Iterable<E?> replacements) {
    // TODO: implement replaceRange
  }

  @override
  void retainWhere(bool Function(E? element) test) {
    // TODO: implement retainWhere
  }

  @override
  void setAll(int index, Iterable<E?> iterable) {
    // TODO: implement setAll
  }

  @override
  void setRange(int start, int end, Iterable<E?> iterable,
      [int skipCount = 0]) {
    // TODO: implement setRange
  }

  @override
  void shuffle([Random? random]) {
    // TODO: implement shuffle
  }

  @override
  // TODO: implement single
  E? get single => throw UnimplementedError();

  @override
  E? singleWhere(bool Function(E? element) test, {E? Function()? orElse}) {
    // TODO: implement singleWhere
    throw UnimplementedError();
  }

  @override
  Iterable<E?> skip(int count) {
    // TODO: implement skip
    throw UnimplementedError();
  }

  @override
  Iterable<E?> skipWhile(bool Function(E? value) test) {
    // TODO: implement skipWhile
    throw UnimplementedError();
  }

  @override
  void sort([int Function(E? a, E? b)? compare]) {
    // TODO: implement sort
  }

  @override
  List<E?> sublist(int start, [int? end]) {
    // TODO: implement sublist
    throw UnimplementedError();
  }

  @override
  Iterable<E?> take(int count) => values.take(count);

  @override
  Iterable<E?> takeWhile(bool Function(E? value) test) =>
      values.takeWhile(test);

  @override
  List<E?> toList({bool growable = true}) => values.toList(growable: growable);

  @override
  Set<E?> toSet() => values.toSet();

  @override
  Iterable<E?> where(bool Function(E? element) test) => values.where(test);

  @override
  Iterable<T> whereType<T>() => values.whereType<T>();
}
