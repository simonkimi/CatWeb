// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class SiteTableData extends DataClass implements Insertable<SiteTableData> {
  final int id;
  final Uint8List bin;
  final Uint8List favicon;
  final int lastOpen;
  SiteTableData(
      {required this.id,
      required this.bin,
      required this.favicon,
      required this.lastOpen});
  factory SiteTableData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return SiteTableData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      bin: const BlobType()
          .mapFromDatabaseResponse(data['${effectivePrefix}bin'])!,
      favicon: const BlobType()
          .mapFromDatabaseResponse(data['${effectivePrefix}favicon'])!,
      lastOpen: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}last_open'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['bin'] = Variable<Uint8List>(bin);
    map['favicon'] = Variable<Uint8List>(favicon);
    map['last_open'] = Variable<int>(lastOpen);
    return map;
  }

  SiteTableCompanion toCompanion(bool nullToAbsent) {
    return SiteTableCompanion(
      id: Value(id),
      bin: Value(bin),
      favicon: Value(favicon),
      lastOpen: Value(lastOpen),
    );
  }

  factory SiteTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return SiteTableData(
      id: serializer.fromJson<int>(json['id']),
      bin: serializer.fromJson<Uint8List>(json['bin']),
      favicon: serializer.fromJson<Uint8List>(json['favicon']),
      lastOpen: serializer.fromJson<int>(json['lastOpen']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'bin': serializer.toJson<Uint8List>(bin),
      'favicon': serializer.toJson<Uint8List>(favicon),
      'lastOpen': serializer.toJson<int>(lastOpen),
    };
  }

  SiteTableData copyWith(
          {int? id, Uint8List? bin, Uint8List? favicon, int? lastOpen}) =>
      SiteTableData(
        id: id ?? this.id,
        bin: bin ?? this.bin,
        favicon: favicon ?? this.favicon,
        lastOpen: lastOpen ?? this.lastOpen,
      );
  @override
  String toString() {
    return (StringBuffer('SiteTableData(')
          ..write('id: $id, ')
          ..write('bin: $bin, ')
          ..write('favicon: $favicon, ')
          ..write('lastOpen: $lastOpen')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, bin, favicon, lastOpen);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SiteTableData &&
          other.id == this.id &&
          other.bin == this.bin &&
          other.favicon == this.favicon &&
          other.lastOpen == this.lastOpen);
}

class SiteTableCompanion extends UpdateCompanion<SiteTableData> {
  final Value<int> id;
  final Value<Uint8List> bin;
  final Value<Uint8List> favicon;
  final Value<int> lastOpen;
  const SiteTableCompanion({
    this.id = const Value.absent(),
    this.bin = const Value.absent(),
    this.favicon = const Value.absent(),
    this.lastOpen = const Value.absent(),
  });
  SiteTableCompanion.insert({
    this.id = const Value.absent(),
    required Uint8List bin,
    this.favicon = const Value.absent(),
    this.lastOpen = const Value.absent(),
  }) : bin = Value(bin);
  static Insertable<SiteTableData> custom({
    Expression<int>? id,
    Expression<Uint8List>? bin,
    Expression<Uint8List>? favicon,
    Expression<int>? lastOpen,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (bin != null) 'bin': bin,
      if (favicon != null) 'favicon': favicon,
      if (lastOpen != null) 'last_open': lastOpen,
    });
  }

  SiteTableCompanion copyWith(
      {Value<int>? id,
      Value<Uint8List>? bin,
      Value<Uint8List>? favicon,
      Value<int>? lastOpen}) {
    return SiteTableCompanion(
      id: id ?? this.id,
      bin: bin ?? this.bin,
      favicon: favicon ?? this.favicon,
      lastOpen: lastOpen ?? this.lastOpen,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (bin.present) {
      map['bin'] = Variable<Uint8List>(bin.value);
    }
    if (favicon.present) {
      map['favicon'] = Variable<Uint8List>(favicon.value);
    }
    if (lastOpen.present) {
      map['last_open'] = Variable<int>(lastOpen.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SiteTableCompanion(')
          ..write('id: $id, ')
          ..write('bin: $bin, ')
          ..write('favicon: $favicon, ')
          ..write('lastOpen: $lastOpen')
          ..write(')'))
        .toString();
  }
}

class $SiteTableTable extends SiteTable
    with TableInfo<$SiteTableTable, SiteTableData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $SiteTableTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _binMeta = const VerificationMeta('bin');
  late final GeneratedColumn<Uint8List?> bin = GeneratedColumn<Uint8List?>(
      'bin', aliasedName, false,
      typeName: 'BLOB', requiredDuringInsert: true);
  final VerificationMeta _faviconMeta = const VerificationMeta('favicon');
  late final GeneratedColumn<Uint8List?> favicon = GeneratedColumn<Uint8List?>(
      'favicon', aliasedName, false,
      typeName: 'BLOB',
      requiredDuringInsert: false,
      clientDefault: () => Uint8List.fromList([]));
  final VerificationMeta _lastOpenMeta = const VerificationMeta('lastOpen');
  late final GeneratedColumn<int?> lastOpen = GeneratedColumn<int?>(
      'last_open', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      clientDefault: () => DateTime.now().millisecond);
  @override
  List<GeneratedColumn> get $columns => [id, bin, favicon, lastOpen];
  @override
  String get aliasedName => _alias ?? 'site_table';
  @override
  String get actualTableName => 'site_table';
  @override
  VerificationContext validateIntegrity(Insertable<SiteTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('bin')) {
      context.handle(
          _binMeta, bin.isAcceptableOrUnknown(data['bin']!, _binMeta));
    } else if (isInserting) {
      context.missing(_binMeta);
    }
    if (data.containsKey('favicon')) {
      context.handle(_faviconMeta,
          favicon.isAcceptableOrUnknown(data['favicon']!, _faviconMeta));
    }
    if (data.containsKey('last_open')) {
      context.handle(_lastOpenMeta,
          lastOpen.isAcceptableOrUnknown(data['last_open']!, _lastOpenMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SiteTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return SiteTableData.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $SiteTableTable createAlias(String alias) {
    return $SiteTableTable(_db, alias);
  }
}

abstract class _$AppDataBase extends GeneratedDatabase {
  _$AppDataBase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $SiteTableTable siteTable = $SiteTableTable(this);
  late final SiteDao siteDao = SiteDao(this as AppDataBase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [siteTable];
}
