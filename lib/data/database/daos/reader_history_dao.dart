import 'package:catweb/data/database/database.dart';
import 'package:catweb/data/database/tables/reader_history_table.dart';
import 'package:drift/drift.dart';

part 'reader_history_dao.g.dart';

@DriftAccessor(tables: [ReaderHistoryTable])
class ReaderHistoryDao extends DatabaseAccessor<AppDataBase>
    with _$ReaderHistoryDaoMixin {
  ReaderHistoryDao(super.attachedDatabase);

  Future<ReaderHistoryTableData?> get({
    required String uuid,
    required String idCode,
  }) =>
      (select(readerHistoryTable)
            ..where((tbl) => tbl.uuid.equals(uuid) & tbl.idCode.equals(idCode)))
          .getSingleOrNull();

  Future<void> add({
    required String uuid,
    required String idCode,
  }) =>
      into(readerHistoryTable).insert(ReaderHistoryTableCompanion.insert(
        uuid: uuid,
        idCode: idCode,
        pageIndex: 0,
      ));

  Future<void> replace(ReaderHistoryTableData entity) =>
      update(readerHistoryTable).replace(entity);
}
