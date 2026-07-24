// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reader_history_dao.dart';

// ignore_for_file: type=lint
mixin _$ReaderHistoryDaoMixin on DatabaseAccessor<AppDataBase> {
  $ReaderHistoryTableTable get readerHistoryTable =>
      attachedDatabase.readerHistoryTable;
  ReaderHistoryDaoManager get managers => ReaderHistoryDaoManager(this);
}

class ReaderHistoryDaoManager {
  final _$ReaderHistoryDaoMixin _db;
  ReaderHistoryDaoManager(this._db);
  $$ReaderHistoryTableTableTableManager get readerHistoryTable =>
      $$ReaderHistoryTableTableTableManager(
        _db.attachedDatabase,
        _db.readerHistoryTable,
      );
}
