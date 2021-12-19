import 'package:moor/moor.dart';
import 'package:uuid/uuid.dart' as u;

class SiteTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get uuid =>
      text().clientDefault(() => const u.Uuid().v4().toString())();

  BlobColumn get bin => blob()();

  BlobColumn get env => blob()();

  BlobColumn get favicon =>
      blob().clientDefault(() => Uint8List.fromList([]))();

  IntColumn get lastOpen =>
      integer().clientDefault(() => DateTime.now().millisecond)();
}
