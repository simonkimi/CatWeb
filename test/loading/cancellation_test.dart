import 'package:catweb/data/loading/cancellation.dart';
import 'package:test/test.dart';

void main() {
  group('CancellationScope', () {
    test('linked scopes forward cancellation', () {
      final parent = CancellationScope();
      final child = CancellationScope.linked([parent]);

      parent.cancel('site disposed');

      expect(child.isCancelled, isTrue);
      expect(child.reason, 'site disposed');
    });

    test('unlink detaches a completed operation from its parents', () {
      final parent = CancellationScope();
      final child = CancellationScope.linked([parent]);

      child.unlink();
      parent.cancel('later');

      expect(child.isCancelled, isFalse);
    });
  });
}
