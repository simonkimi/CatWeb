import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

int currentTimestampMillis() => DateTime.now().millisecondsSinceEpoch;

class WebTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get uuid =>
      text().clientDefault(() => const Uuid().v4().toString())();

  TextColumn get blueprint => text()();

  TextColumn get env => text()();

  BlobColumn get favicon =>
      blob().clientDefault(() => Uint8List.fromList([]))();

  IntColumn get lastOpen => integer().clientDefault(currentTimestampMillis)();

  BoolColumn get securityModel => boolean().clientDefault(() => true)();

  TextColumn get loginCookies => text().clientDefault(() => '')();
}
