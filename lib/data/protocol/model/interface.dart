import 'package:protobuf/protobuf.dart';

abstract class PbAble {
  PbAble([GeneratedMessage? pb]);

  GeneratedMessage toPb();
}
