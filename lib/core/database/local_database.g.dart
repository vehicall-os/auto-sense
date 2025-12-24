// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_database.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCachedVehicleDataCollection on Isar {
  IsarCollection<CachedVehicleData> get cachedVehicleDatas => this.collection();
}

const CachedVehicleDataSchema = CollectionSchema(
  name: r'CachedVehicleData',
  id: -879882474713754074,
  properties: {
    r'activeAlerts': PropertySchema(
      id: 0,
      name: r'activeAlerts',
      type: IsarType.stringList,
    ),
    r'coolantTemp': PropertySchema(
      id: 1,
      name: r'coolantTemp',
      type: IsarType.long,
    ),
    r'driverId': PropertySchema(
      id: 2,
      name: r'driverId',
      type: IsarType.string,
    ),
    r'rpm': PropertySchema(
      id: 3,
      name: r'rpm',
      type: IsarType.long,
    ),
    r'speedKmh': PropertySchema(
      id: 4,
      name: r'speedKmh',
      type: IsarType.double,
    ),
    r'syncStatus': PropertySchema(
      id: 5,
      name: r'syncStatus',
      type: IsarType.byte,
      enumMap: _CachedVehicleDatasyncStatusEnumValueMap,
    ),
    r'timestamp': PropertySchema(
      id: 6,
      name: r'timestamp',
      type: IsarType.dateTime,
    ),
    r'vehicleId': PropertySchema(
      id: 7,
      name: r'vehicleId',
      type: IsarType.string,
    )
  },
  estimateSize: _cachedVehicleDataEstimateSize,
  serialize: _cachedVehicleDataSerialize,
  deserialize: _cachedVehicleDataDeserialize,
  deserializeProp: _cachedVehicleDataDeserializeProp,
  idName: r'id',
  indexes: {
    r'timestamp': IndexSchema(
      id: 1852253767416892198,
      name: r'timestamp',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'timestamp',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _cachedVehicleDataGetId,
  getLinks: _cachedVehicleDataGetLinks,
  attach: _cachedVehicleDataAttach,
  version: '3.1.0+1',
);

int _cachedVehicleDataEstimateSize(
  CachedVehicleData object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.activeAlerts;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  {
    final value = object.driverId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.vehicleId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _cachedVehicleDataSerialize(
  CachedVehicleData object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeStringList(offsets[0], object.activeAlerts);
  writer.writeLong(offsets[1], object.coolantTemp);
  writer.writeString(offsets[2], object.driverId);
  writer.writeLong(offsets[3], object.rpm);
  writer.writeDouble(offsets[4], object.speedKmh);
  writer.writeByte(offsets[5], object.syncStatus.index);
  writer.writeDateTime(offsets[6], object.timestamp);
  writer.writeString(offsets[7], object.vehicleId);
}

CachedVehicleData _cachedVehicleDataDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CachedVehicleData();
  object.activeAlerts = reader.readStringList(offsets[0]);
  object.coolantTemp = reader.readLongOrNull(offsets[1]);
  object.driverId = reader.readStringOrNull(offsets[2]);
  object.id = id;
  object.rpm = reader.readLongOrNull(offsets[3]);
  object.speedKmh = reader.readDoubleOrNull(offsets[4]);
  object.syncStatus = _CachedVehicleDatasyncStatusValueEnumMap[
          reader.readByteOrNull(offsets[5])] ??
      SyncStatus.pending;
  object.timestamp = reader.readDateTimeOrNull(offsets[6]);
  object.vehicleId = reader.readStringOrNull(offsets[7]);
  return object;
}

P _cachedVehicleDataDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringList(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readDoubleOrNull(offset)) as P;
    case 5:
      return (_CachedVehicleDatasyncStatusValueEnumMap[
              reader.readByteOrNull(offset)] ??
          SyncStatus.pending) as P;
    case 6:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _CachedVehicleDatasyncStatusEnumValueMap = {
  'pending': 0,
  'syncing': 1,
  'synced': 2,
  'failed': 3,
};
const _CachedVehicleDatasyncStatusValueEnumMap = {
  0: SyncStatus.pending,
  1: SyncStatus.syncing,
  2: SyncStatus.synced,
  3: SyncStatus.failed,
};

Id _cachedVehicleDataGetId(CachedVehicleData object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _cachedVehicleDataGetLinks(
    CachedVehicleData object) {
  return [];
}

void _cachedVehicleDataAttach(
    IsarCollection<dynamic> col, Id id, CachedVehicleData object) {
  object.id = id;
}

extension CachedVehicleDataQueryWhereSort
    on QueryBuilder<CachedVehicleData, CachedVehicleData, QWhere> {
  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterWhere>
      anyTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'timestamp'),
      );
    });
  }
}

extension CachedVehicleDataQueryWhere
    on QueryBuilder<CachedVehicleData, CachedVehicleData, QWhereClause> {
  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterWhereClause>
      idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterWhereClause>
      timestampIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'timestamp',
        value: [null],
      ));
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterWhereClause>
      timestampIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'timestamp',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterWhereClause>
      timestampEqualTo(DateTime? timestamp) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'timestamp',
        value: [timestamp],
      ));
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterWhereClause>
      timestampNotEqualTo(DateTime? timestamp) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'timestamp',
              lower: [],
              upper: [timestamp],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'timestamp',
              lower: [timestamp],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'timestamp',
              lower: [timestamp],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'timestamp',
              lower: [],
              upper: [timestamp],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterWhereClause>
      timestampGreaterThan(
    DateTime? timestamp, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'timestamp',
        lower: [timestamp],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterWhereClause>
      timestampLessThan(
    DateTime? timestamp, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'timestamp',
        lower: [],
        upper: [timestamp],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterWhereClause>
      timestampBetween(
    DateTime? lowerTimestamp,
    DateTime? upperTimestamp, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'timestamp',
        lower: [lowerTimestamp],
        includeLower: includeLower,
        upper: [upperTimestamp],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CachedVehicleDataQueryFilter
    on QueryBuilder<CachedVehicleData, CachedVehicleData, QFilterCondition> {
  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterFilterCondition>
      activeAlertsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'activeAlerts',
      ));
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterFilterCondition>
      activeAlertsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'activeAlerts',
      ));
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterFilterCondition>
      activeAlertsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'activeAlerts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterFilterCondition>
      activeAlertsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'activeAlerts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterFilterCondition>
      activeAlertsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'activeAlerts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterFilterCondition>
      activeAlertsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'activeAlerts',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterFilterCondition>
      activeAlertsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'activeAlerts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterFilterCondition>
      activeAlertsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'activeAlerts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterFilterCondition>
      activeAlertsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'activeAlerts',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterFilterCondition>
      activeAlertsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'activeAlerts',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterFilterCondition>
      activeAlertsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'activeAlerts',
        value: '',
      ));
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterFilterCondition>
      activeAlertsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'activeAlerts',
        value: '',
      ));
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterFilterCondition>
      activeAlertsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'activeAlerts',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterFilterCondition>
      activeAlertsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'activeAlerts',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterFilterCondition>
      activeAlertsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'activeAlerts',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterFilterCondition>
      activeAlertsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'activeAlerts',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterFilterCondition>
      activeAlertsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'activeAlerts',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterFilterCondition>
      activeAlertsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'activeAlerts',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterFilterCondition>
      coolantTempIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'coolantTemp',
      ));
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterFilterCondition>
      coolantTempIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'coolantTemp',
      ));
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterFilterCondition>
      coolantTempEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coolantTemp',
        value: value,
      ));
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterFilterCondition>
      coolantTempGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'coolantTemp',
        value: value,
      ));
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterFilterCondition>
      coolantTempLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'coolantTemp',
        value: value,
      ));
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterFilterCondition>
      coolantTempBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'coolantTemp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterFilterCondition>
      driverIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'driverId',
      ));
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterFilterCondition>
      driverIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'driverId',
      ));
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterFilterCondition>
      driverIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'driverId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterFilterCondition>
      driverIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'driverId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterFilterCondition>
      driverIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'driverId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterFilterCondition>
      driverIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'driverId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterFilterCondition>
      driverIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'driverId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterFilterCondition>
      driverIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'driverId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterFilterCondition>
      driverIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'driverId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterFilterCondition>
      driverIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'driverId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterFilterCondition>
      driverIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'driverId',
        value: '',
      ));
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterFilterCondition>
      driverIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'driverId',
        value: '',
      ));
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterFilterCondition>
      rpmIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rpm',
      ));
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterFilterCondition>
      rpmIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rpm',
      ));
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterFilterCondition>
      rpmEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rpm',
        value: value,
      ));
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterFilterCondition>
      rpmGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rpm',
        value: value,
      ));
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterFilterCondition>
      rpmLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rpm',
        value: value,
      ));
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterFilterCondition>
      rpmBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rpm',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterFilterCondition>
      speedKmhIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'speedKmh',
      ));
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterFilterCondition>
      speedKmhIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'speedKmh',
      ));
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterFilterCondition>
      speedKmhEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'speedKmh',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterFilterCondition>
      speedKmhGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'speedKmh',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterFilterCondition>
      speedKmhLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'speedKmh',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterFilterCondition>
      speedKmhBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'speedKmh',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterFilterCondition>
      syncStatusEqualTo(SyncStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterFilterCondition>
      syncStatusGreaterThan(
    SyncStatus value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'syncStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterFilterCondition>
      syncStatusLessThan(
    SyncStatus value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'syncStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterFilterCondition>
      syncStatusBetween(
    SyncStatus lower,
    SyncStatus upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'syncStatus',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterFilterCondition>
      timestampIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'timestamp',
      ));
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterFilterCondition>
      timestampIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'timestamp',
      ));
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterFilterCondition>
      timestampEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterFilterCondition>
      timestampGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterFilterCondition>
      timestampLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterFilterCondition>
      timestampBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timestamp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterFilterCondition>
      vehicleIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'vehicleId',
      ));
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterFilterCondition>
      vehicleIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'vehicleId',
      ));
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterFilterCondition>
      vehicleIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vehicleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterFilterCondition>
      vehicleIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'vehicleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterFilterCondition>
      vehicleIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'vehicleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterFilterCondition>
      vehicleIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'vehicleId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterFilterCondition>
      vehicleIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'vehicleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterFilterCondition>
      vehicleIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'vehicleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterFilterCondition>
      vehicleIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'vehicleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterFilterCondition>
      vehicleIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'vehicleId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterFilterCondition>
      vehicleIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vehicleId',
        value: '',
      ));
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterFilterCondition>
      vehicleIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'vehicleId',
        value: '',
      ));
    });
  }
}

extension CachedVehicleDataQueryObject
    on QueryBuilder<CachedVehicleData, CachedVehicleData, QFilterCondition> {}

extension CachedVehicleDataQueryLinks
    on QueryBuilder<CachedVehicleData, CachedVehicleData, QFilterCondition> {}

extension CachedVehicleDataQuerySortBy
    on QueryBuilder<CachedVehicleData, CachedVehicleData, QSortBy> {
  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterSortBy>
      sortByCoolantTemp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coolantTemp', Sort.asc);
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterSortBy>
      sortByCoolantTempDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coolantTemp', Sort.desc);
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterSortBy>
      sortByDriverId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverId', Sort.asc);
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterSortBy>
      sortByDriverIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverId', Sort.desc);
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterSortBy> sortByRpm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rpm', Sort.asc);
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterSortBy>
      sortByRpmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rpm', Sort.desc);
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterSortBy>
      sortBySpeedKmh() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speedKmh', Sort.asc);
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterSortBy>
      sortBySpeedKmhDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speedKmh', Sort.desc);
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterSortBy>
      sortBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterSortBy>
      sortBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterSortBy>
      sortByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterSortBy>
      sortByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterSortBy>
      sortByVehicleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleId', Sort.asc);
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterSortBy>
      sortByVehicleIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleId', Sort.desc);
    });
  }
}

extension CachedVehicleDataQuerySortThenBy
    on QueryBuilder<CachedVehicleData, CachedVehicleData, QSortThenBy> {
  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterSortBy>
      thenByCoolantTemp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coolantTemp', Sort.asc);
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterSortBy>
      thenByCoolantTempDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coolantTemp', Sort.desc);
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterSortBy>
      thenByDriverId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverId', Sort.asc);
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterSortBy>
      thenByDriverIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverId', Sort.desc);
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterSortBy> thenByRpm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rpm', Sort.asc);
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterSortBy>
      thenByRpmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rpm', Sort.desc);
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterSortBy>
      thenBySpeedKmh() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speedKmh', Sort.asc);
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterSortBy>
      thenBySpeedKmhDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speedKmh', Sort.desc);
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterSortBy>
      thenBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterSortBy>
      thenBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterSortBy>
      thenByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterSortBy>
      thenByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterSortBy>
      thenByVehicleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleId', Sort.asc);
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QAfterSortBy>
      thenByVehicleIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleId', Sort.desc);
    });
  }
}

extension CachedVehicleDataQueryWhereDistinct
    on QueryBuilder<CachedVehicleData, CachedVehicleData, QDistinct> {
  QueryBuilder<CachedVehicleData, CachedVehicleData, QDistinct>
      distinctByActiveAlerts() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'activeAlerts');
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QDistinct>
      distinctByCoolantTemp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'coolantTemp');
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QDistinct>
      distinctByDriverId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'driverId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QDistinct>
      distinctByRpm() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rpm');
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QDistinct>
      distinctBySpeedKmh() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'speedKmh');
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QDistinct>
      distinctBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncStatus');
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QDistinct>
      distinctByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timestamp');
    });
  }

  QueryBuilder<CachedVehicleData, CachedVehicleData, QDistinct>
      distinctByVehicleId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vehicleId', caseSensitive: caseSensitive);
    });
  }
}

extension CachedVehicleDataQueryProperty
    on QueryBuilder<CachedVehicleData, CachedVehicleData, QQueryProperty> {
  QueryBuilder<CachedVehicleData, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CachedVehicleData, List<String>?, QQueryOperations>
      activeAlertsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'activeAlerts');
    });
  }

  QueryBuilder<CachedVehicleData, int?, QQueryOperations>
      coolantTempProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coolantTemp');
    });
  }

  QueryBuilder<CachedVehicleData, String?, QQueryOperations>
      driverIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'driverId');
    });
  }

  QueryBuilder<CachedVehicleData, int?, QQueryOperations> rpmProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rpm');
    });
  }

  QueryBuilder<CachedVehicleData, double?, QQueryOperations>
      speedKmhProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'speedKmh');
    });
  }

  QueryBuilder<CachedVehicleData, SyncStatus, QQueryOperations>
      syncStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncStatus');
    });
  }

  QueryBuilder<CachedVehicleData, DateTime?, QQueryOperations>
      timestampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timestamp');
    });
  }

  QueryBuilder<CachedVehicleData, String?, QQueryOperations>
      vehicleIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vehicleId');
    });
  }
}
