import 'package:moor/moor.dart';

class SiteTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  BlobColumn get bin => blob()();

  BlobColumn get favicon =>
      blob().clientDefault(() => Uint8List.fromList([]))();

  IntColumn get lastOpen =>
      integer().clientDefault(() => DateTime.now().millisecond)();
}
