import 'package:uuid/uuid.dart';

String genUuid([String? input]) {
  return (input != null && input.isNotEmpty)
      ? input
      : const Uuid().v4().toString();
}