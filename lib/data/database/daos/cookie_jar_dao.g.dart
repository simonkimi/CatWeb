// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cookie_jar_dao.dart';

// ignore_for_file: type=lint
mixin _$CookieJarDaoMixin on DatabaseAccessor<AppDataBase> {
  $CookieJarTableTable get cookieJarTable => attachedDatabase.cookieJarTable;
  CookieJarDaoManager get managers => CookieJarDaoManager(this);
}

class CookieJarDaoManager {
  final _$CookieJarDaoMixin _db;
  CookieJarDaoManager(this._db);
  $$CookieJarTableTableTableManager get cookieJarTable =>
      $$CookieJarTableTableTableManager(
        _db.attachedDatabase,
        _db.cookieJarTable,
      );
}
