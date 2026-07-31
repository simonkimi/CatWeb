import 'dart:async';

import 'json_values.dart';
import 'runtime_contracts.dart';

final class PersistentEnvironmentStore implements EnvironmentStore {
  PersistentEnvironmentStore({
    required Map<String, Object?> initial,
    required this.persist,
  }) : _values = Map<String, Object?>.of(
         freezeScalarMap(initial, path: r'$.environment'),
       );

  final Future<void> Function(Map<String, Object?> values) persist;
  Map<String, Object?> _values;
  Future<void> _tail = Future<void>.value();

  @override
  Future<Map<String, Object?>> snapshot() async {
    await _tail;
    return Map<String, Object?>.unmodifiable(_values);
  }

  @override
  Future<void> apply(Map<String, Object?> patch) {
    final frozen = freezeScalarMap(patch, path: r'$.environment.patch');
    final commit = _tail.then((_) async {
      final next = <String, Object?>{..._values, ...frozen};
      await persist(next);
      _values = next;
    });
    _tail = commit.catchError((_) {});
    return commit;
  }
}
