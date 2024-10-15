import 'package:collection/collection.dart';

void main() {
  final queue = HeapPriorityQueue();

  queue.add(3);
  queue.add(4);
  queue.add(5);
  queue.add(1);
  queue.add(0);
  queue.add(0);
  queue.add(1);
  queue.add(2);


  while (queue.isNotEmpty) {
    print(queue.removeFirst());
  }
}
