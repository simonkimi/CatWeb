
import 'package:catweb/app.dart';
import 'package:cookie_jar/cookie_jar.dart';

import '../controller/db.dart';

class CookieJarStorage implements Storage {
  CookieJarStorage(this.uuid);

  final String uuid;

  final _cookieJarDao = getIt.get<DbService>().cookieJarDao;

  @override
  Future<void> delete(String key) => _cookieJarDao.remove(uuid, key);

  @override
  Future<void> deleteAll(List<String> keys) => _cookieJarDao.deleteAll(uuid);

  @override
  Future<void> init(bool persistSession, bool ignoreExpires) async {}

  @override
  Future<String?> read(String key) async {
    return (await _cookieJarDao.read(uuid, key))?.value;
  }

  @override
  Future<void> write(String key, String value) =>
      _cookieJarDao.write(uuid, key, value);
}
