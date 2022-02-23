import 'package:catweb/ffi/ffi.dart';

void main() {
  final js = runJs('function hook() { return "Hello" }', '');

  print(js);
}
