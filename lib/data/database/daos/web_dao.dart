import 'package:catweb/data/database/database.dart';
import 'package:catweb/data/database/tables/web_table.dart';
import 'package:drift/drift.dart';

part 'web_dao.g.dart';

@DriftAccessor(tables: [WebTable])
class WebDao extends DatabaseAccessor<AppDataBase> with _$WebDaoMixin {
  WebDao(super.attachedDatabase);

  Stream<List<WebTableData>> getAllStream() => select(webTable).watch();

  Future<List<WebTableData>> getAll() => select(webTable).get();

  Future<WebTableData?> get(int id) =>
      (select(webTable)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();

  Future<void> insert(WebTableCompanion entity) =>
      into(webTable).insert(entity);

  Future<void> replace(WebTableData entity) => update(webTable).replace(entity);

  Future<void> remove(WebTableData entity) => delete(webTable).delete(entity);
}
