import 'package:catweb/data/database/database.dart';
import 'package:catweb/data/database/tables/site_table.dart';
import 'package:moor/moor.dart';

part 'site_dao.g.dart';

@UseDao(tables: [SiteTable])
class SiteDao extends DatabaseAccessor<AppDataBase> with _$SiteDaoMixin {
  SiteDao(AppDataBase attachedDatabase) : super(attachedDatabase);

  Stream<List<SiteTableData>> getAllStream() => select(siteTable).watch();

  Future<List<SiteTableData>> getAll() => select(siteTable).get();

  Future<void> insert(SiteTableCompanion entity) =>
      into(siteTable).insert(entity);

  Future<void> replace(SiteTableData entity) =>
      update(siteTable).replace(entity);

  Future<void> remove(SiteTableData entity) => delete(siteTable).delete(entity);
}
