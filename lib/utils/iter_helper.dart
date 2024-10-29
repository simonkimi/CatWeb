import 'dart:math' as math;

extension IterableUtils<T> on Iterable<T> {
  Iterable<T> sort([int Function(T a, T b)? compare]) {
    return toList()..sort(compare);
  }
}

extension IterableMath<T extends num> on Iterable<T> {
  T? max() {
    if (isEmpty) return null;
    return reduce((value, element) => math.max(value, element));
  }

  T? min() {
    if (isEmpty) return null;
    return reduce((value, element) => math.min(value, element));
  }
}
