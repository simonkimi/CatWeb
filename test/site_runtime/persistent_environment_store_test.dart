import 'package:catweb/data/site_runtime/persistent_environment_store.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('commits persisted values to the in-memory snapshot', () async {
    Map<String, Object?>? persisted;
    final store = PersistentEnvironmentStore(
      initial: {'token': 'old'},
      persist: (values) async {
        persisted = values;
      },
    );

    await store.apply({'token': 'new', 'page': 2});

    expect(persisted, {'token': 'new', 'page': 2});
    expect(await store.snapshot(), {'token': 'new', 'page': 2});
  });

  test('does not mutate the snapshot when persistence fails', () async {
    final store = PersistentEnvironmentStore(
      initial: {'token': 'old'},
      persist: (_) async => throw StateError('write failed'),
    );

    await expectLater(
      store.apply({'token': 'new'}),
      throwsA(isA<StateError>()),
    );
    expect(await store.snapshot(), {'token': 'old'});
  });
}
