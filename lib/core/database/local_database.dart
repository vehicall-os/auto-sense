import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

part 'local_database.g.dart'; // Isar generator

@Collection()
class CachedVehicleData {
  Id id = Isar.autoIncrement;

  String? vehicleId;
  String? driverId;

  @Index()
  DateTime? timestamp;

  // OBD fields
  int? rpm;
  double? speedKmh;
  int? coolantTemp;

  // Alerts
  List<String>? activeAlerts;

  // Sync status
  @Enumerated(EnumType.ordinal)
  SyncStatus syncStatus = SyncStatus.pending;
}

enum SyncStatus {
  pending,    // Not yet synced
  syncing,    // In progress
  synced,     // Successfully synced
  failed,     // Failed to sync
}

class LocalDatabase {
  late final Isar _isar;

  // Singleton
  static final LocalDatabase _instance = LocalDatabase._internal();
  factory LocalDatabase() => _instance;
  LocalDatabase._internal();

  Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [CachedVehicleDataSchema],
      directory: dir.path,
    );
  }

  // Offline-first write
  Future<void> cacheOBDData(Map<String, dynamic> data) async {
    final vehicleId = data['vehicleId'] as String?;
    final rpm = data['rpm'] as int?;
    final speed = (data['speedKmh'] as num?)?.toDouble();

    await _isar.writeTxn(() async {
      await _isar.cachedVehicleDatas.put(
        CachedVehicleData()
          ..vehicleId = vehicleId
          ..timestamp = DateTime.now()
          ..rpm = rpm
          ..speedKmh = speed
          ..syncStatus = SyncStatus.pending,
      );
    });
  }

  // Query unsynced data for background sync
  Future<List<CachedVehicleData>> getUnsyncedData() {
    return _isar.cachedVehicleDatas
        .filter()
        .syncStatusEqualTo(SyncStatus.pending)
        .findAll();
  }

  Future<void> markAsSynced(int id) async {
     await _isar.writeTxn(() async {
      final data = await _isar.cachedVehicleDatas.get(id);
      if (data != null) {
        data.syncStatus = SyncStatus.synced;
        await _isar.cachedVehicleDatas.put(data);
      }
    });
  }
}
