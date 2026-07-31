import 'package:catweb/data/database/daos/cookie_jar_dao.dart';
import 'package:catweb/data/database/daos/reader_history_dao.dart';
import 'package:catweb/data/database/daos/web_dao.dart';
import 'package:catweb/data/database/database.dart';

class DbService {
  DbService({AppDataBase? database}) : _database = database ?? AppDataBase();

  final AppDataBase _database;

  WebDao get webDao => _database.webDao;

  ReaderHistoryDao get readerHistoryDao => _database.readerHistoryDao;

  CookieJarDao get cookieJarDao => _database.cookieJarDao;

  Future<void> dispose() => _database.close();
}
