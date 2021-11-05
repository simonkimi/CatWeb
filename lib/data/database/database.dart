import 'dart:ffi';
import 'dart:io';
import 'package:catweb/data/database/tables/site_table.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';

import 'daos/site_dao.dart';

part 'database.g.dart';

DynamicLibrary openOnWindows() {
  final exeDir = File(Platform.resolvedExecutable).parent;
  final libraryNextToExe = File(p.join(exeDir.path, 'sqlite3.dll'));
  if (libraryNextToExe.existsSync()) {
    return DynamicLibrary.open(libraryNextToExe.path);
  }
  final scriptDir = File(Platform.script.toFilePath()).parent;
  final libraryNextToScript = File(p.join(scriptDir.path, 'sqlite3.dll'));
  return DynamicLibrary.open(libraryNextToScript.path);
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final file = File(
        p.join((await getApplicationDocumentsDirectory()).path, 'db.sqlite'));
    return VmDatabase(file);
  });
}

@UseMoor(tables: [SiteTable], daos: [SiteDao])
class AppDataBase extends _$AppDataBase {
  AppDataBase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

class DB {
  factory DB() => _db;

  DB._();

  static final DB _db = DB._();
  final AppDataBase _database = AppDataBase();

  SiteDao get siteDao => _database.siteDao;
}
