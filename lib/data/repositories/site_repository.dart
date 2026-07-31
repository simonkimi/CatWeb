import 'package:catweb/data/database/daos/cookie_jar_dao.dart';
import 'package:catweb/data/database/daos/web_dao.dart';
import 'package:catweb/data/database/database.dart';

final class SiteRepository {
  const SiteRepository({required this.webDao, required this.cookieJarDao});

  final WebDao webDao;
  final CookieJarDao cookieJarDao;

  Future<List<WebTableData>> getAll() => webDao.getAll();

  Stream<List<WebTableData>> watchAll() => webDao.getAllStream();

  Future<void> replace(WebTableData entity) => webDao.replace(entity);
}
