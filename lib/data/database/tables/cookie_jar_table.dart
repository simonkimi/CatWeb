import 'package:drift/drift.dart';

class CookieJarTable extends Table {
  TextColumn get webUuid => text()();

  TextColumn get key => text()();

  TextColumn get value => text()();

  @override
  Set<Column> get primaryKey => {webUuid, key};
}
