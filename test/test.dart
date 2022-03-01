import 'dart:async';

void main() async {
  final stream = StreamController<List<int>>.broadcast();

  stream.add([1, 2, 3, 4, 5]);

  print(stream.stream.first);
}
