// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'latlng_repo.dart';

// ignore_for_file: type=lint
class $RegencyTable extends Regency with TableInfo<$RegencyTable, RegencyData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RegencyTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nidMeta = const VerificationMeta('nid');
  @override
  late final GeneratedColumn<int> nid = GeneratedColumn<int>(
      'nid', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _parentNidMeta =
      const VerificationMeta('parentNid');
  @override
  late final GeneratedColumn<int> parentNid = GeneratedColumn<int>(
      'parent_nid', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _latMeta = const VerificationMeta('lat');
  @override
  late final GeneratedColumn<double> lat = GeneratedColumn<double>(
      'lat', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _lngMeta = const VerificationMeta('lng');
  @override
  late final GeneratedColumn<double> lng = GeneratedColumn<double>(
      'lng', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _regencyMeta =
      const VerificationMeta('regency');
  @override
  late final GeneratedColumn<String> regency = GeneratedColumn<String>(
      'regency', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, nid, parentNid, lat, lng, regency];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'regency';
  @override
  VerificationContext validateIntegrity(Insertable<RegencyData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nid')) {
      context.handle(
          _nidMeta, nid.isAcceptableOrUnknown(data['nid']!, _nidMeta));
    } else if (isInserting) {
      context.missing(_nidMeta);
    }
    if (data.containsKey('parent_nid')) {
      context.handle(_parentNidMeta,
          parentNid.isAcceptableOrUnknown(data['parent_nid']!, _parentNidMeta));
    } else if (isInserting) {
      context.missing(_parentNidMeta);
    }
    if (data.containsKey('lat')) {
      context.handle(
          _latMeta, lat.isAcceptableOrUnknown(data['lat']!, _latMeta));
    } else if (isInserting) {
      context.missing(_latMeta);
    }
    if (data.containsKey('lng')) {
      context.handle(
          _lngMeta, lng.isAcceptableOrUnknown(data['lng']!, _lngMeta));
    } else if (isInserting) {
      context.missing(_lngMeta);
    }
    if (data.containsKey('regency')) {
      context.handle(_regencyMeta,
          regency.isAcceptableOrUnknown(data['regency']!, _regencyMeta));
    } else if (isInserting) {
      context.missing(_regencyMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RegencyData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RegencyData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      nid: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}nid'])!,
      parentNid: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}parent_nid'])!,
      lat: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}lat'])!,
      lng: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}lng'])!,
      regency: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}regency'])!,
    );
  }

  @override
  $RegencyTable createAlias(String alias) {
    return $RegencyTable(attachedDatabase, alias);
  }
}

class RegencyData extends DataClass implements Insertable<RegencyData> {
  final int id;
  final int nid;
  final int parentNid;
  final double lat;
  final double lng;
  final String regency;
  const RegencyData(
      {required this.id,
      required this.nid,
      required this.parentNid,
      required this.lat,
      required this.lng,
      required this.regency});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nid'] = Variable<int>(nid);
    map['parent_nid'] = Variable<int>(parentNid);
    map['lat'] = Variable<double>(lat);
    map['lng'] = Variable<double>(lng);
    map['regency'] = Variable<String>(regency);
    return map;
  }

  RegencyCompanion toCompanion(bool nullToAbsent) {
    return RegencyCompanion(
      id: Value(id),
      nid: Value(nid),
      parentNid: Value(parentNid),
      lat: Value(lat),
      lng: Value(lng),
      regency: Value(regency),
    );
  }

  factory RegencyData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RegencyData(
      id: serializer.fromJson<int>(json['id']),
      nid: serializer.fromJson<int>(json['nid']),
      parentNid: serializer.fromJson<int>(json['parentNid']),
      lat: serializer.fromJson<double>(json['lat']),
      lng: serializer.fromJson<double>(json['lng']),
      regency: serializer.fromJson<String>(json['regency']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nid': serializer.toJson<int>(nid),
      'parentNid': serializer.toJson<int>(parentNid),
      'lat': serializer.toJson<double>(lat),
      'lng': serializer.toJson<double>(lng),
      'regency': serializer.toJson<String>(regency),
    };
  }

  RegencyData copyWith(
          {int? id,
          int? nid,
          int? parentNid,
          double? lat,
          double? lng,
          String? regency}) =>
      RegencyData(
        id: id ?? this.id,
        nid: nid ?? this.nid,
        parentNid: parentNid ?? this.parentNid,
        lat: lat ?? this.lat,
        lng: lng ?? this.lng,
        regency: regency ?? this.regency,
      );
  RegencyData copyWithCompanion(RegencyCompanion data) {
    return RegencyData(
      id: data.id.present ? data.id.value : this.id,
      nid: data.nid.present ? data.nid.value : this.nid,
      parentNid: data.parentNid.present ? data.parentNid.value : this.parentNid,
      lat: data.lat.present ? data.lat.value : this.lat,
      lng: data.lng.present ? data.lng.value : this.lng,
      regency: data.regency.present ? data.regency.value : this.regency,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RegencyData(')
          ..write('id: $id, ')
          ..write('nid: $nid, ')
          ..write('parentNid: $parentNid, ')
          ..write('lat: $lat, ')
          ..write('lng: $lng, ')
          ..write('regency: $regency')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, nid, parentNid, lat, lng, regency);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RegencyData &&
          other.id == this.id &&
          other.nid == this.nid &&
          other.parentNid == this.parentNid &&
          other.lat == this.lat &&
          other.lng == this.lng &&
          other.regency == this.regency);
}

class RegencyCompanion extends UpdateCompanion<RegencyData> {
  final Value<int> id;
  final Value<int> nid;
  final Value<int> parentNid;
  final Value<double> lat;
  final Value<double> lng;
  final Value<String> regency;
  const RegencyCompanion({
    this.id = const Value.absent(),
    this.nid = const Value.absent(),
    this.parentNid = const Value.absent(),
    this.lat = const Value.absent(),
    this.lng = const Value.absent(),
    this.regency = const Value.absent(),
  });
  RegencyCompanion.insert({
    this.id = const Value.absent(),
    required int nid,
    required int parentNid,
    required double lat,
    required double lng,
    required String regency,
  })  : nid = Value(nid),
        parentNid = Value(parentNid),
        lat = Value(lat),
        lng = Value(lng),
        regency = Value(regency);
  static Insertable<RegencyData> custom({
    Expression<int>? id,
    Expression<int>? nid,
    Expression<int>? parentNid,
    Expression<double>? lat,
    Expression<double>? lng,
    Expression<String>? regency,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nid != null) 'nid': nid,
      if (parentNid != null) 'parent_nid': parentNid,
      if (lat != null) 'lat': lat,
      if (lng != null) 'lng': lng,
      if (regency != null) 'regency': regency,
    });
  }

  RegencyCompanion copyWith(
      {Value<int>? id,
      Value<int>? nid,
      Value<int>? parentNid,
      Value<double>? lat,
      Value<double>? lng,
      Value<String>? regency}) {
    return RegencyCompanion(
      id: id ?? this.id,
      nid: nid ?? this.nid,
      parentNid: parentNid ?? this.parentNid,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      regency: regency ?? this.regency,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nid.present) {
      map['nid'] = Variable<int>(nid.value);
    }
    if (parentNid.present) {
      map['parent_nid'] = Variable<int>(parentNid.value);
    }
    if (lat.present) {
      map['lat'] = Variable<double>(lat.value);
    }
    if (lng.present) {
      map['lng'] = Variable<double>(lng.value);
    }
    if (regency.present) {
      map['regency'] = Variable<String>(regency.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RegencyCompanion(')
          ..write('id: $id, ')
          ..write('nid: $nid, ')
          ..write('parentNid: $parentNid, ')
          ..write('lat: $lat, ')
          ..write('lng: $lng, ')
          ..write('regency: $regency')
          ..write(')'))
        .toString();
  }
}

class $CoverAreaTable extends CoverArea
    with TableInfo<$CoverAreaTable, CoverAreaData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CoverAreaTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _postalCodeMeta =
      const VerificationMeta('postalCode');
  @override
  late final GeneratedColumn<int> postalCode = GeneratedColumn<int>(
      'postal_code', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _latMeta = const VerificationMeta('lat');
  @override
  late final GeneratedColumn<double> lat = GeneratedColumn<double>(
      'lat', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _lngMeta = const VerificationMeta('lng');
  @override
  late final GeneratedColumn<double> lng = GeneratedColumn<double>(
      'lng', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _streetAddressMeta =
      const VerificationMeta('streetAddress');
  @override
  late final GeneratedColumn<String> streetAddress = GeneratedColumn<String>(
      'street_address', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 6, maxTextLength: 32),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _regencyMeta =
      const VerificationMeta('regency');
  @override
  late final GeneratedColumn<int> regency = GeneratedColumn<int>(
      'regency', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES regency (id)'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, postalCode, lat, lng, streetAddress, regency, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cover_area';
  @override
  VerificationContext validateIntegrity(Insertable<CoverAreaData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('postal_code')) {
      context.handle(
          _postalCodeMeta,
          postalCode.isAcceptableOrUnknown(
              data['postal_code']!, _postalCodeMeta));
    } else if (isInserting) {
      context.missing(_postalCodeMeta);
    }
    if (data.containsKey('lat')) {
      context.handle(
          _latMeta, lat.isAcceptableOrUnknown(data['lat']!, _latMeta));
    } else if (isInserting) {
      context.missing(_latMeta);
    }
    if (data.containsKey('lng')) {
      context.handle(
          _lngMeta, lng.isAcceptableOrUnknown(data['lng']!, _lngMeta));
    } else if (isInserting) {
      context.missing(_lngMeta);
    }
    if (data.containsKey('street_address')) {
      context.handle(
          _streetAddressMeta,
          streetAddress.isAcceptableOrUnknown(
              data['street_address']!, _streetAddressMeta));
    } else if (isInserting) {
      context.missing(_streetAddressMeta);
    }
    if (data.containsKey('regency')) {
      context.handle(_regencyMeta,
          regency.isAcceptableOrUnknown(data['regency']!, _regencyMeta));
    } else if (isInserting) {
      context.missing(_regencyMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CoverAreaData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CoverAreaData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      postalCode: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}postal_code'])!,
      lat: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}lat'])!,
      lng: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}lng'])!,
      streetAddress: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}street_address'])!,
      regency: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}regency'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at']),
    );
  }

  @override
  $CoverAreaTable createAlias(String alias) {
    return $CoverAreaTable(attachedDatabase, alias);
  }
}

class CoverAreaData extends DataClass implements Insertable<CoverAreaData> {
  final int id;
  final int postalCode;
  final double lat;
  final double lng;
  final String streetAddress;
  final int regency;
  final DateTime? createdAt;
  const CoverAreaData(
      {required this.id,
      required this.postalCode,
      required this.lat,
      required this.lng,
      required this.streetAddress,
      required this.regency,
      this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['postal_code'] = Variable<int>(postalCode);
    map['lat'] = Variable<double>(lat);
    map['lng'] = Variable<double>(lng);
    map['street_address'] = Variable<String>(streetAddress);
    map['regency'] = Variable<int>(regency);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    return map;
  }

  CoverAreaCompanion toCompanion(bool nullToAbsent) {
    return CoverAreaCompanion(
      id: Value(id),
      postalCode: Value(postalCode),
      lat: Value(lat),
      lng: Value(lng),
      streetAddress: Value(streetAddress),
      regency: Value(regency),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
    );
  }

  factory CoverAreaData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CoverAreaData(
      id: serializer.fromJson<int>(json['id']),
      postalCode: serializer.fromJson<int>(json['postalCode']),
      lat: serializer.fromJson<double>(json['lat']),
      lng: serializer.fromJson<double>(json['lng']),
      streetAddress: serializer.fromJson<String>(json['streetAddress']),
      regency: serializer.fromJson<int>(json['regency']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'postalCode': serializer.toJson<int>(postalCode),
      'lat': serializer.toJson<double>(lat),
      'lng': serializer.toJson<double>(lng),
      'streetAddress': serializer.toJson<String>(streetAddress),
      'regency': serializer.toJson<int>(regency),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
    };
  }

  CoverAreaData copyWith(
          {int? id,
          int? postalCode,
          double? lat,
          double? lng,
          String? streetAddress,
          int? regency,
          Value<DateTime?> createdAt = const Value.absent()}) =>
      CoverAreaData(
        id: id ?? this.id,
        postalCode: postalCode ?? this.postalCode,
        lat: lat ?? this.lat,
        lng: lng ?? this.lng,
        streetAddress: streetAddress ?? this.streetAddress,
        regency: regency ?? this.regency,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
      );
  CoverAreaData copyWithCompanion(CoverAreaCompanion data) {
    return CoverAreaData(
      id: data.id.present ? data.id.value : this.id,
      postalCode:
          data.postalCode.present ? data.postalCode.value : this.postalCode,
      lat: data.lat.present ? data.lat.value : this.lat,
      lng: data.lng.present ? data.lng.value : this.lng,
      streetAddress: data.streetAddress.present
          ? data.streetAddress.value
          : this.streetAddress,
      regency: data.regency.present ? data.regency.value : this.regency,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CoverAreaData(')
          ..write('id: $id, ')
          ..write('postalCode: $postalCode, ')
          ..write('lat: $lat, ')
          ..write('lng: $lng, ')
          ..write('streetAddress: $streetAddress, ')
          ..write('regency: $regency, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, postalCode, lat, lng, streetAddress, regency, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CoverAreaData &&
          other.id == this.id &&
          other.postalCode == this.postalCode &&
          other.lat == this.lat &&
          other.lng == this.lng &&
          other.streetAddress == this.streetAddress &&
          other.regency == this.regency &&
          other.createdAt == this.createdAt);
}

class CoverAreaCompanion extends UpdateCompanion<CoverAreaData> {
  final Value<int> id;
  final Value<int> postalCode;
  final Value<double> lat;
  final Value<double> lng;
  final Value<String> streetAddress;
  final Value<int> regency;
  final Value<DateTime?> createdAt;
  const CoverAreaCompanion({
    this.id = const Value.absent(),
    this.postalCode = const Value.absent(),
    this.lat = const Value.absent(),
    this.lng = const Value.absent(),
    this.streetAddress = const Value.absent(),
    this.regency = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  CoverAreaCompanion.insert({
    this.id = const Value.absent(),
    required int postalCode,
    required double lat,
    required double lng,
    required String streetAddress,
    required int regency,
    this.createdAt = const Value.absent(),
  })  : postalCode = Value(postalCode),
        lat = Value(lat),
        lng = Value(lng),
        streetAddress = Value(streetAddress),
        regency = Value(regency);
  static Insertable<CoverAreaData> custom({
    Expression<int>? id,
    Expression<int>? postalCode,
    Expression<double>? lat,
    Expression<double>? lng,
    Expression<String>? streetAddress,
    Expression<int>? regency,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (postalCode != null) 'postal_code': postalCode,
      if (lat != null) 'lat': lat,
      if (lng != null) 'lng': lng,
      if (streetAddress != null) 'street_address': streetAddress,
      if (regency != null) 'regency': regency,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  CoverAreaCompanion copyWith(
      {Value<int>? id,
      Value<int>? postalCode,
      Value<double>? lat,
      Value<double>? lng,
      Value<String>? streetAddress,
      Value<int>? regency,
      Value<DateTime?>? createdAt}) {
    return CoverAreaCompanion(
      id: id ?? this.id,
      postalCode: postalCode ?? this.postalCode,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      streetAddress: streetAddress ?? this.streetAddress,
      regency: regency ?? this.regency,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (postalCode.present) {
      map['postal_code'] = Variable<int>(postalCode.value);
    }
    if (lat.present) {
      map['lat'] = Variable<double>(lat.value);
    }
    if (lng.present) {
      map['lng'] = Variable<double>(lng.value);
    }
    if (streetAddress.present) {
      map['street_address'] = Variable<String>(streetAddress.value);
    }
    if (regency.present) {
      map['regency'] = Variable<int>(regency.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CoverAreaCompanion(')
          ..write('id: $id, ')
          ..write('postalCode: $postalCode, ')
          ..write('lat: $lat, ')
          ..write('lng: $lng, ')
          ..write('streetAddress: $streetAddress, ')
          ..write('regency: $regency, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $RegencyTable regency = $RegencyTable(this);
  late final $CoverAreaTable coverArea = $CoverAreaTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [regency, coverArea];
}

typedef $$RegencyTableCreateCompanionBuilder = RegencyCompanion Function({
  Value<int> id,
  required int nid,
  required int parentNid,
  required double lat,
  required double lng,
  required String regency,
});
typedef $$RegencyTableUpdateCompanionBuilder = RegencyCompanion Function({
  Value<int> id,
  Value<int> nid,
  Value<int> parentNid,
  Value<double> lat,
  Value<double> lng,
  Value<String> regency,
});

final class $$RegencyTableReferences
    extends BaseReferences<_$AppDatabase, $RegencyTable, RegencyData> {
  $$RegencyTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$CoverAreaTable, List<CoverAreaData>>
      _coverAreaRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.coverArea,
          aliasName: $_aliasNameGenerator(db.regency.id, db.coverArea.regency));

  $$CoverAreaTableProcessedTableManager get coverAreaRefs {
    final manager = $$CoverAreaTableTableManager($_db, $_db.coverArea)
        .filter((f) => f.regency.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_coverAreaRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$RegencyTableFilterComposer
    extends Composer<_$AppDatabase, $RegencyTable> {
  $$RegencyTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get nid => $composableBuilder(
      column: $table.nid, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get parentNid => $composableBuilder(
      column: $table.parentNid, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get lat => $composableBuilder(
      column: $table.lat, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get lng => $composableBuilder(
      column: $table.lng, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get regency => $composableBuilder(
      column: $table.regency, builder: (column) => ColumnFilters(column));

  Expression<bool> coverAreaRefs(
      Expression<bool> Function($$CoverAreaTableFilterComposer f) f) {
    final $$CoverAreaTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.coverArea,
        getReferencedColumn: (t) => t.regency,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CoverAreaTableFilterComposer(
              $db: $db,
              $table: $db.coverArea,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$RegencyTableOrderingComposer
    extends Composer<_$AppDatabase, $RegencyTable> {
  $$RegencyTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get nid => $composableBuilder(
      column: $table.nid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get parentNid => $composableBuilder(
      column: $table.parentNid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get lat => $composableBuilder(
      column: $table.lat, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get lng => $composableBuilder(
      column: $table.lng, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get regency => $composableBuilder(
      column: $table.regency, builder: (column) => ColumnOrderings(column));
}

class $$RegencyTableAnnotationComposer
    extends Composer<_$AppDatabase, $RegencyTable> {
  $$RegencyTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get nid =>
      $composableBuilder(column: $table.nid, builder: (column) => column);

  GeneratedColumn<int> get parentNid =>
      $composableBuilder(column: $table.parentNid, builder: (column) => column);

  GeneratedColumn<double> get lat =>
      $composableBuilder(column: $table.lat, builder: (column) => column);

  GeneratedColumn<double> get lng =>
      $composableBuilder(column: $table.lng, builder: (column) => column);

  GeneratedColumn<String> get regency =>
      $composableBuilder(column: $table.regency, builder: (column) => column);

  Expression<T> coverAreaRefs<T extends Object>(
      Expression<T> Function($$CoverAreaTableAnnotationComposer a) f) {
    final $$CoverAreaTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.coverArea,
        getReferencedColumn: (t) => t.regency,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CoverAreaTableAnnotationComposer(
              $db: $db,
              $table: $db.coverArea,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$RegencyTableTableManager extends RootTableManager<
    _$AppDatabase,
    $RegencyTable,
    RegencyData,
    $$RegencyTableFilterComposer,
    $$RegencyTableOrderingComposer,
    $$RegencyTableAnnotationComposer,
    $$RegencyTableCreateCompanionBuilder,
    $$RegencyTableUpdateCompanionBuilder,
    (RegencyData, $$RegencyTableReferences),
    RegencyData,
    PrefetchHooks Function({bool coverAreaRefs})> {
  $$RegencyTableTableManager(_$AppDatabase db, $RegencyTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RegencyTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RegencyTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RegencyTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> nid = const Value.absent(),
            Value<int> parentNid = const Value.absent(),
            Value<double> lat = const Value.absent(),
            Value<double> lng = const Value.absent(),
            Value<String> regency = const Value.absent(),
          }) =>
              RegencyCompanion(
            id: id,
            nid: nid,
            parentNid: parentNid,
            lat: lat,
            lng: lng,
            regency: regency,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int nid,
            required int parentNid,
            required double lat,
            required double lng,
            required String regency,
          }) =>
              RegencyCompanion.insert(
            id: id,
            nid: nid,
            parentNid: parentNid,
            lat: lat,
            lng: lng,
            regency: regency,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$RegencyTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({coverAreaRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (coverAreaRefs) db.coverArea],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (coverAreaRefs)
                    await $_getPrefetchedData<RegencyData, $RegencyTable,
                            CoverAreaData>(
                        currentTable: table,
                        referencedTable:
                            $$RegencyTableReferences._coverAreaRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$RegencyTableReferences(db, table, p0)
                                .coverAreaRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.regency == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$RegencyTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $RegencyTable,
    RegencyData,
    $$RegencyTableFilterComposer,
    $$RegencyTableOrderingComposer,
    $$RegencyTableAnnotationComposer,
    $$RegencyTableCreateCompanionBuilder,
    $$RegencyTableUpdateCompanionBuilder,
    (RegencyData, $$RegencyTableReferences),
    RegencyData,
    PrefetchHooks Function({bool coverAreaRefs})>;
typedef $$CoverAreaTableCreateCompanionBuilder = CoverAreaCompanion Function({
  Value<int> id,
  required int postalCode,
  required double lat,
  required double lng,
  required String streetAddress,
  required int regency,
  Value<DateTime?> createdAt,
});
typedef $$CoverAreaTableUpdateCompanionBuilder = CoverAreaCompanion Function({
  Value<int> id,
  Value<int> postalCode,
  Value<double> lat,
  Value<double> lng,
  Value<String> streetAddress,
  Value<int> regency,
  Value<DateTime?> createdAt,
});

final class $$CoverAreaTableReferences
    extends BaseReferences<_$AppDatabase, $CoverAreaTable, CoverAreaData> {
  $$CoverAreaTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $RegencyTable _regencyTable(_$AppDatabase db) => db.regency
      .createAlias($_aliasNameGenerator(db.coverArea.regency, db.regency.id));

  $$RegencyTableProcessedTableManager get regency {
    final $_column = $_itemColumn<int>('regency')!;

    final manager = $$RegencyTableTableManager($_db, $_db.regency)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_regencyTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$CoverAreaTableFilterComposer
    extends Composer<_$AppDatabase, $CoverAreaTable> {
  $$CoverAreaTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get postalCode => $composableBuilder(
      column: $table.postalCode, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get lat => $composableBuilder(
      column: $table.lat, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get lng => $composableBuilder(
      column: $table.lng, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get streetAddress => $composableBuilder(
      column: $table.streetAddress, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  $$RegencyTableFilterComposer get regency {
    final $$RegencyTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.regency,
        referencedTable: $db.regency,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RegencyTableFilterComposer(
              $db: $db,
              $table: $db.regency,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$CoverAreaTableOrderingComposer
    extends Composer<_$AppDatabase, $CoverAreaTable> {
  $$CoverAreaTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get postalCode => $composableBuilder(
      column: $table.postalCode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get lat => $composableBuilder(
      column: $table.lat, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get lng => $composableBuilder(
      column: $table.lng, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get streetAddress => $composableBuilder(
      column: $table.streetAddress,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  $$RegencyTableOrderingComposer get regency {
    final $$RegencyTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.regency,
        referencedTable: $db.regency,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RegencyTableOrderingComposer(
              $db: $db,
              $table: $db.regency,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$CoverAreaTableAnnotationComposer
    extends Composer<_$AppDatabase, $CoverAreaTable> {
  $$CoverAreaTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get postalCode => $composableBuilder(
      column: $table.postalCode, builder: (column) => column);

  GeneratedColumn<double> get lat =>
      $composableBuilder(column: $table.lat, builder: (column) => column);

  GeneratedColumn<double> get lng =>
      $composableBuilder(column: $table.lng, builder: (column) => column);

  GeneratedColumn<String> get streetAddress => $composableBuilder(
      column: $table.streetAddress, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$RegencyTableAnnotationComposer get regency {
    final $$RegencyTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.regency,
        referencedTable: $db.regency,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RegencyTableAnnotationComposer(
              $db: $db,
              $table: $db.regency,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$CoverAreaTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CoverAreaTable,
    CoverAreaData,
    $$CoverAreaTableFilterComposer,
    $$CoverAreaTableOrderingComposer,
    $$CoverAreaTableAnnotationComposer,
    $$CoverAreaTableCreateCompanionBuilder,
    $$CoverAreaTableUpdateCompanionBuilder,
    (CoverAreaData, $$CoverAreaTableReferences),
    CoverAreaData,
    PrefetchHooks Function({bool regency})> {
  $$CoverAreaTableTableManager(_$AppDatabase db, $CoverAreaTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CoverAreaTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CoverAreaTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CoverAreaTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> postalCode = const Value.absent(),
            Value<double> lat = const Value.absent(),
            Value<double> lng = const Value.absent(),
            Value<String> streetAddress = const Value.absent(),
            Value<int> regency = const Value.absent(),
            Value<DateTime?> createdAt = const Value.absent(),
          }) =>
              CoverAreaCompanion(
            id: id,
            postalCode: postalCode,
            lat: lat,
            lng: lng,
            streetAddress: streetAddress,
            regency: regency,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int postalCode,
            required double lat,
            required double lng,
            required String streetAddress,
            required int regency,
            Value<DateTime?> createdAt = const Value.absent(),
          }) =>
              CoverAreaCompanion.insert(
            id: id,
            postalCode: postalCode,
            lat: lat,
            lng: lng,
            streetAddress: streetAddress,
            regency: regency,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$CoverAreaTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({regency = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (regency) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.regency,
                    referencedTable:
                        $$CoverAreaTableReferences._regencyTable(db),
                    referencedColumn:
                        $$CoverAreaTableReferences._regencyTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$CoverAreaTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CoverAreaTable,
    CoverAreaData,
    $$CoverAreaTableFilterComposer,
    $$CoverAreaTableOrderingComposer,
    $$CoverAreaTableAnnotationComposer,
    $$CoverAreaTableCreateCompanionBuilder,
    $$CoverAreaTableUpdateCompanionBuilder,
    (CoverAreaData, $$CoverAreaTableReferences),
    CoverAreaData,
    PrefetchHooks Function({bool regency})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$RegencyTableTableManager get regency =>
      $$RegencyTableTableManager(_db, _db.regency);
  $$CoverAreaTableTableManager get coverArea =>
      $$CoverAreaTableTableManager(_db, _db.coverArea);
}
