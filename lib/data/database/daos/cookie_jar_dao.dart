import 'package:catweb/data/database/database.dart';
import 'package:catweb/data/database/tables/cookie_jar_table.dart';
import 'package:drift/drift.dart';

part 'cookie_jar_dao.g.dart';

@DriftAccessor(tables: [CookieJarTable])
class CookieJarDao extends DatabaseAccessor<AppDataBase>
    with _$CookieJarDaoMixin {
  CookieJarDao(AppDataBase attachedDatabase) : super(attachedDatabase);

  Future<void> write(String uuid, String key, String value) async {
    final entity = await (select(cookieJarTable)
          ..where((tbl) => tbl.webUuid.equals(uuid) & tbl.key.equals(key)))
        .getSingleOrNull();

    if (entity == null) {
      await into(cookieJarTable).insert(CookieJarTableCompanion.insert(
        webUuid: uuid,
        key: key,
        value: value,
      ));
    } else {
      await (update(cookieJarTable)
            ..where((tbl) => tbl.webUuid.equals(uuid) & tbl.key.equals(key)))
          .write(CookieJarTableCompanion.insert(
        webUuid: uuid,
        key: key,
        value: value,
      ));
    }
  }

  Future<CookieJarTableData?> read(String uuid, String key) =>
      (select(cookieJarTable)
            ..where((tbl) => tbl.webUuid.equals(uuid) & tbl.key.equals(key)))
          .getSingleOrNull();

  Future<void> deleteAll(String uuid) =>
      (delete(cookieJarTable)..where((tbl) => tbl.webUuid.equals(uuid))).go();

  Future<void> remove(String uuid, String key) => (delete(cookieJarTable)
        ..where((tbl) => tbl.webUuid.equals(uuid) & tbl.key.equals(key)))
      .go();
}
