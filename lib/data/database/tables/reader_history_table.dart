import 'package:drift/drift.dart';

class ReaderHistoryTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get uuid => text()();

  TextColumn get idCode => text()();

  IntColumn get pageIndex => integer()();
}
