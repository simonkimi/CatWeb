import 'package:catweb/data/database/daos/cookie_jar_dao.dart';
import 'package:catweb/data/database/daos/reader_history_dao.dart';
import 'package:catweb/data/database/daos/web_dao.dart';
import 'package:catweb/data/database/database.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final dbProvider = Provider((ref) => DbService());

class DbService {
  final AppDataBase _database = AppDataBase();

  WebDao get webDao => _database.webDao;

  ReaderHistoryDao get readerHistoryDao => _database.readerHistoryDao;

  CookieJarDao get cookieJarDao => _database.cookieJarDao;
}
