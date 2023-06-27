// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $WebTableTable extends WebTable
    with TableInfo<$WebTableTable, WebTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WebTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
      'uuid', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: () => const Uuid().v4().toString());
  static const VerificationMeta _blueprintMeta =
      const VerificationMeta('blueprint');
  @override
  late final GeneratedColumn<String> blueprint = GeneratedColumn<String>(
      'blueprint', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _envMeta = const VerificationMeta('env');
  @override
  late final GeneratedColumn<String> env = GeneratedColumn<String>(
      'env', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _faviconMeta =
      const VerificationMeta('favicon');
  @override
  late final GeneratedColumn<Uint8List> favicon = GeneratedColumn<Uint8List>(
      'favicon', aliasedName, false,
      type: DriftSqlType.blob,
      requiredDuringInsert: false,
      clientDefault: () => Uint8List.fromList([]));
  static const VerificationMeta _lastOpenMeta =
      const VerificationMeta('lastOpen');
  @override
  late final GeneratedColumn<int> lastOpen = GeneratedColumn<int>(
      'last_open', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      clientDefault: () => DateTime.now().millisecond);
  static const VerificationMeta _securityModelMeta =
      const VerificationMeta('securityModel');
  @override
  late final GeneratedColumn<bool> securityModel =
      GeneratedColumn<bool>('security_model', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("security_model" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          clientDefault: () => true);
  static const VerificationMeta _loginCookiesMeta =
      const VerificationMeta('loginCookies');
  @override
  late final GeneratedColumn<String> loginCookies = GeneratedColumn<String>(
      'login_cookies', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: () => '');
  @override
  List<GeneratedColumn> get $columns => [
        id,
        uuid,
        blueprint,
        env,
        favicon,
        lastOpen,
        securityModel,
        loginCookies
      ];
  @override
  String get aliasedName => _alias ?? 'web_table';
  @override
  String get actualTableName => 'web_table';
  @override
  VerificationContext validateIntegrity(Insertable<WebTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    }
    if (data.containsKey('blueprint')) {
      context.handle(_blueprintMeta,
          blueprint.isAcceptableOrUnknown(data['blueprint']!, _blueprintMeta));
    } else if (isInserting) {
      context.missing(_blueprintMeta);
    }
    if (data.containsKey('env')) {
      context.handle(
          _envMeta, env.isAcceptableOrUnknown(data['env']!, _envMeta));
    } else if (isInserting) {
      context.missing(_envMeta);
    }
    if (data.containsKey('favicon')) {
      context.handle(_faviconMeta,
          favicon.isAcceptableOrUnknown(data['favicon']!, _faviconMeta));
    }
    if (data.containsKey('last_open')) {
      context.handle(_lastOpenMeta,
          lastOpen.isAcceptableOrUnknown(data['last_open']!, _lastOpenMeta));
    }
    if (data.containsKey('security_model')) {
      context.handle(
          _securityModelMeta,
          securityModel.isAcceptableOrUnknown(
              data['security_model']!, _securityModelMeta));
    }
    if (data.containsKey('login_cookies')) {
      context.handle(
          _loginCookiesMeta,
          loginCookies.isAcceptableOrUnknown(
              data['login_cookies']!, _loginCookiesMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WebTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WebTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      blueprint: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}blueprint'])!,
      env: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}env'])!,
      favicon: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}favicon'])!,
      lastOpen: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}last_open'])!,
      securityModel: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}security_model'])!,
      loginCookies: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}login_cookies'])!,
    );
  }

  @override
  $WebTableTable createAlias(String alias) {
    return $WebTableTable(attachedDatabase, alias);
  }
}

class WebTableData extends DataClass implements Insertable<WebTableData> {
  final int id;
  final String uuid;
  final String blueprint;
  final String env;
  final Uint8List favicon;
  final int lastOpen;
  final bool securityModel;
  final String loginCookies;
  const WebTableData(
      {required this.id,
      required this.uuid,
      required this.blueprint,
      required this.env,
      required this.favicon,
      required this.lastOpen,
      required this.securityModel,
      required this.loginCookies});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['blueprint'] = Variable<String>(blueprint);
    map['env'] = Variable<String>(env);
    map['favicon'] = Variable<Uint8List>(favicon);
    map['last_open'] = Variable<int>(lastOpen);
    map['security_model'] = Variable<bool>(securityModel);
    map['login_cookies'] = Variable<String>(loginCookies);
    return map;
  }

  WebTableCompanion toCompanion(bool nullToAbsent) {
    return WebTableCompanion(
      id: Value(id),
      uuid: Value(uuid),
      blueprint: Value(blueprint),
      env: Value(env),
      favicon: Value(favicon),
      lastOpen: Value(lastOpen),
      securityModel: Value(securityModel),
      loginCookies: Value(loginCookies),
    );
  }

  factory WebTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WebTableData(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      blueprint: serializer.fromJson<String>(json['blueprint']),
      env: serializer.fromJson<String>(json['env']),
      favicon: serializer.fromJson<Uint8List>(json['favicon']),
      lastOpen: serializer.fromJson<int>(json['lastOpen']),
      securityModel: serializer.fromJson<bool>(json['securityModel']),
      loginCookies: serializer.fromJson<String>(json['loginCookies']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String>(uuid),
      'blueprint': serializer.toJson<String>(blueprint),
      'env': serializer.toJson<String>(env),
      'favicon': serializer.toJson<Uint8List>(favicon),
      'lastOpen': serializer.toJson<int>(lastOpen),
      'securityModel': serializer.toJson<bool>(securityModel),
      'loginCookies': serializer.toJson<String>(loginCookies),
    };
  }

  WebTableData copyWith(
          {int? id,
          String? uuid,
          String? blueprint,
          String? env,
          Uint8List? favicon,
          int? lastOpen,
          bool? securityModel,
          String? loginCookies}) =>
      WebTableData(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        blueprint: blueprint ?? this.blueprint,
        env: env ?? this.env,
        favicon: favicon ?? this.favicon,
        lastOpen: lastOpen ?? this.lastOpen,
        securityModel: securityModel ?? this.securityModel,
        loginCookies: loginCookies ?? this.loginCookies,
      );
  @override
  String toString() {
    return (StringBuffer('WebTableData(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('blueprint: $blueprint, ')
          ..write('env: $env, ')
          ..write('favicon: $favicon, ')
          ..write('lastOpen: $lastOpen, ')
          ..write('securityModel: $securityModel, ')
          ..write('loginCookies: $loginCookies')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, uuid, blueprint, env,
      $driftBlobEquality.hash(favicon), lastOpen, securityModel, loginCookies);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WebTableData &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.blueprint == this.blueprint &&
          other.env == this.env &&
          $driftBlobEquality.equals(other.favicon, this.favicon) &&
          other.lastOpen == this.lastOpen &&
          other.securityModel == this.securityModel &&
          other.loginCookies == this.loginCookies);
}

class WebTableCompanion extends UpdateCompanion<WebTableData> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<String> blueprint;
  final Value<String> env;
  final Value<Uint8List> favicon;
  final Value<int> lastOpen;
  final Value<bool> securityModel;
  final Value<String> loginCookies;
  const WebTableCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.blueprint = const Value.absent(),
    this.env = const Value.absent(),
    this.favicon = const Value.absent(),
    this.lastOpen = const Value.absent(),
    this.securityModel = const Value.absent(),
    this.loginCookies = const Value.absent(),
  });
  WebTableCompanion.insert({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    required String blueprint,
    required String env,
    this.favicon = const Value.absent(),
    this.lastOpen = const Value.absent(),
    this.securityModel = const Value.absent(),
    this.loginCookies = const Value.absent(),
  })  : blueprint = Value(blueprint),
        env = Value(env);
  static Insertable<WebTableData> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<String>? blueprint,
    Expression<String>? env,
    Expression<Uint8List>? favicon,
    Expression<int>? lastOpen,
    Expression<bool>? securityModel,
    Expression<String>? loginCookies,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (blueprint != null) 'blueprint': blueprint,
      if (env != null) 'env': env,
      if (favicon != null) 'favicon': favicon,
      if (lastOpen != null) 'last_open': lastOpen,
      if (securityModel != null) 'security_model': securityModel,
      if (loginCookies != null) 'login_cookies': loginCookies,
    });
  }

  WebTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? uuid,
      Value<String>? blueprint,
      Value<String>? env,
      Value<Uint8List>? favicon,
      Value<int>? lastOpen,
      Value<bool>? securityModel,
      Value<String>? loginCookies}) {
    return WebTableCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      blueprint: blueprint ?? this.blueprint,
      env: env ?? this.env,
      favicon: favicon ?? this.favicon,
      lastOpen: lastOpen ?? this.lastOpen,
      securityModel: securityModel ?? this.securityModel,
      loginCookies: loginCookies ?? this.loginCookies,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (blueprint.present) {
      map['blueprint'] = Variable<String>(blueprint.value);
    }
    if (env.present) {
      map['env'] = Variable<String>(env.value);
    }
    if (favicon.present) {
      map['favicon'] = Variable<Uint8List>(favicon.value);
    }
    if (lastOpen.present) {
      map['last_open'] = Variable<int>(lastOpen.value);
    }
    if (securityModel.present) {
      map['security_model'] = Variable<bool>(securityModel.value);
    }
    if (loginCookies.present) {
      map['login_cookies'] = Variable<String>(loginCookies.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WebTableCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('blueprint: $blueprint, ')
          ..write('env: $env, ')
          ..write('favicon: $favicon, ')
          ..write('lastOpen: $lastOpen, ')
          ..write('securityModel: $securityModel, ')
          ..write('loginCookies: $loginCookies')
          ..write(')'))
        .toString();
  }
}

class $ReaderHistoryTableTable extends ReaderHistoryTable
    with TableInfo<$ReaderHistoryTableTable, ReaderHistoryTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReaderHistoryTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
      'uuid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _idCodeMeta = const VerificationMeta('idCode');
  @override
  late final GeneratedColumn<String> idCode = GeneratedColumn<String>(
      'id_code', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _pageIndexMeta =
      const VerificationMeta('pageIndex');
  @override
  late final GeneratedColumn<int> pageIndex = GeneratedColumn<int>(
      'page_index', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, uuid, idCode, pageIndex];
  @override
  String get aliasedName => _alias ?? 'reader_history_table';
  @override
  String get actualTableName => 'reader_history_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<ReaderHistoryTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('id_code')) {
      context.handle(_idCodeMeta,
          idCode.isAcceptableOrUnknown(data['id_code']!, _idCodeMeta));
    } else if (isInserting) {
      context.missing(_idCodeMeta);
    }
    if (data.containsKey('page_index')) {
      context.handle(_pageIndexMeta,
          pageIndex.isAcceptableOrUnknown(data['page_index']!, _pageIndexMeta));
    } else if (isInserting) {
      context.missing(_pageIndexMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ReaderHistoryTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReaderHistoryTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      idCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id_code'])!,
      pageIndex: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}page_index'])!,
    );
  }

  @override
  $ReaderHistoryTableTable createAlias(String alias) {
    return $ReaderHistoryTableTable(attachedDatabase, alias);
  }
}

class ReaderHistoryTableData extends DataClass
    implements Insertable<ReaderHistoryTableData> {
  final int id;
  final String uuid;
  final String idCode;
  final int pageIndex;
  const ReaderHistoryTableData(
      {required this.id,
      required this.uuid,
      required this.idCode,
      required this.pageIndex});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['id_code'] = Variable<String>(idCode);
    map['page_index'] = Variable<int>(pageIndex);
    return map;
  }

  ReaderHistoryTableCompanion toCompanion(bool nullToAbsent) {
    return ReaderHistoryTableCompanion(
      id: Value(id),
      uuid: Value(uuid),
      idCode: Value(idCode),
      pageIndex: Value(pageIndex),
    );
  }

  factory ReaderHistoryTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReaderHistoryTableData(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      idCode: serializer.fromJson<String>(json['idCode']),
      pageIndex: serializer.fromJson<int>(json['pageIndex']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String>(uuid),
      'idCode': serializer.toJson<String>(idCode),
      'pageIndex': serializer.toJson<int>(pageIndex),
    };
  }

  ReaderHistoryTableData copyWith(
          {int? id, String? uuid, String? idCode, int? pageIndex}) =>
      ReaderHistoryTableData(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        idCode: idCode ?? this.idCode,
        pageIndex: pageIndex ?? this.pageIndex,
      );
  @override
  String toString() {
    return (StringBuffer('ReaderHistoryTableData(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('idCode: $idCode, ')
          ..write('pageIndex: $pageIndex')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, uuid, idCode, pageIndex);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReaderHistoryTableData &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.idCode == this.idCode &&
          other.pageIndex == this.pageIndex);
}

class ReaderHistoryTableCompanion
    extends UpdateCompanion<ReaderHistoryTableData> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<String> idCode;
  final Value<int> pageIndex;
  const ReaderHistoryTableCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.idCode = const Value.absent(),
    this.pageIndex = const Value.absent(),
  });
  ReaderHistoryTableCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    required String idCode,
    required int pageIndex,
  })  : uuid = Value(uuid),
        idCode = Value(idCode),
        pageIndex = Value(pageIndex);
  static Insertable<ReaderHistoryTableData> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<String>? idCode,
    Expression<int>? pageIndex,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (idCode != null) 'id_code': idCode,
      if (pageIndex != null) 'page_index': pageIndex,
    });
  }

  ReaderHistoryTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? uuid,
      Value<String>? idCode,
      Value<int>? pageIndex}) {
    return ReaderHistoryTableCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      idCode: idCode ?? this.idCode,
      pageIndex: pageIndex ?? this.pageIndex,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (idCode.present) {
      map['id_code'] = Variable<String>(idCode.value);
    }
    if (pageIndex.present) {
      map['page_index'] = Variable<int>(pageIndex.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReaderHistoryTableCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('idCode: $idCode, ')
          ..write('pageIndex: $pageIndex')
          ..write(')'))
        .toString();
  }
}

class $CookieJarTableTable extends CookieJarTable
    with TableInfo<$CookieJarTableTable, CookieJarTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CookieJarTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _webUuidMeta =
      const VerificationMeta('webUuid');
  @override
  late final GeneratedColumn<String> webUuid = GeneratedColumn<String>(
      'web_uuid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
      'key', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
      'value', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [webUuid, key, value];
  @override
  String get aliasedName => _alias ?? 'cookie_jar_table';
  @override
  String get actualTableName => 'cookie_jar_table';
  @override
  VerificationContext validateIntegrity(Insertable<CookieJarTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('web_uuid')) {
      context.handle(_webUuidMeta,
          webUuid.isAcceptableOrUnknown(data['web_uuid']!, _webUuidMeta));
    } else if (isInserting) {
      context.missing(_webUuidMeta);
    }
    if (data.containsKey('key')) {
      context.handle(
          _keyMeta, key.isAcceptableOrUnknown(data['key']!, _keyMeta));
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value']!, _valueMeta));
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {webUuid, key};
  @override
  CookieJarTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CookieJarTableData(
      webUuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}web_uuid'])!,
      key: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}key'])!,
      value: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}value'])!,
    );
  }

  @override
  $CookieJarTableTable createAlias(String alias) {
    return $CookieJarTableTable(attachedDatabase, alias);
  }
}

class CookieJarTableData extends DataClass
    implements Insertable<CookieJarTableData> {
  final String webUuid;
  final String key;
  final String value;
  const CookieJarTableData(
      {required this.webUuid, required this.key, required this.value});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['web_uuid'] = Variable<String>(webUuid);
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    return map;
  }

  CookieJarTableCompanion toCompanion(bool nullToAbsent) {
    return CookieJarTableCompanion(
      webUuid: Value(webUuid),
      key: Value(key),
      value: Value(value),
    );
  }

  factory CookieJarTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CookieJarTableData(
      webUuid: serializer.fromJson<String>(json['webUuid']),
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'webUuid': serializer.toJson<String>(webUuid),
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
    };
  }

  CookieJarTableData copyWith({String? webUuid, String? key, String? value}) =>
      CookieJarTableData(
        webUuid: webUuid ?? this.webUuid,
        key: key ?? this.key,
        value: value ?? this.value,
      );
  @override
  String toString() {
    return (StringBuffer('CookieJarTableData(')
          ..write('webUuid: $webUuid, ')
          ..write('key: $key, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(webUuid, key, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CookieJarTableData &&
          other.webUuid == this.webUuid &&
          other.key == this.key &&
          other.value == this.value);
}

class CookieJarTableCompanion extends UpdateCompanion<CookieJarTableData> {
  final Value<String> webUuid;
  final Value<String> key;
  final Value<String> value;
  final Value<int> rowid;
  const CookieJarTableCompanion({
    this.webUuid = const Value.absent(),
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CookieJarTableCompanion.insert({
    required String webUuid,
    required String key,
    required String value,
    this.rowid = const Value.absent(),
  })  : webUuid = Value(webUuid),
        key = Value(key),
        value = Value(value);
  static Insertable<CookieJarTableData> custom({
    Expression<String>? webUuid,
    Expression<String>? key,
    Expression<String>? value,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (webUuid != null) 'web_uuid': webUuid,
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CookieJarTableCompanion copyWith(
      {Value<String>? webUuid,
      Value<String>? key,
      Value<String>? value,
      Value<int>? rowid}) {
    return CookieJarTableCompanion(
      webUuid: webUuid ?? this.webUuid,
      key: key ?? this.key,
      value: value ?? this.value,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (webUuid.present) {
      map['web_uuid'] = Variable<String>(webUuid.value);
    }
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CookieJarTableCompanion(')
          ..write('webUuid: $webUuid, ')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDataBase extends GeneratedDatabase {
  _$AppDataBase(QueryExecutor e) : super(e);
  late final $WebTableTable webTable = $WebTableTable(this);
  late final $ReaderHistoryTableTable readerHistoryTable =
      $ReaderHistoryTableTable(this);
  late final $CookieJarTableTable cookieJarTable = $CookieJarTableTable(this);
  late final WebDao webDao = WebDao(this as AppDataBase);
  late final ReaderHistoryDao readerHistoryDao =
      ReaderHistoryDao(this as AppDataBase);
  late final CookieJarDao cookieJarDao = CookieJarDao(this as AppDataBase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [webTable, readerHistoryTable, cookieJarTable];
}
