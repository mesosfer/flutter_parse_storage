import 'package:flutter_parse_storage_interface/flutter_parse_storage_interface.dart';
import 'package:sembast/sembast.dart';

/// Base Implementation of `flutter_parse_storage` with `sembast`
abstract class BaseParseStorageSembast
    extends ParseStorageInterface {
  BaseParseStorageSembast({required this.path, this.databaseName});

  /// Return the database path directory where it will be saved
  final String path;

  /// Return the database file name where it will be saved
  final String? databaseName;

  /// Return the [DatabaseFactory] instance for current platform
  DatabaseFactory get databaseFactory;

  /// Return the [Database] instance
  Future<Database> get database;

  @override
  bool get isMock => false;

  @override
  Future<bool> clear({String? key}) async {
    final store = stringMapStoreFactory.store();
    final db = await database;
    if (key != null) {
      await store.record(key).delete(db);
    } else {
      await store.delete(db);
    }
    return true;
  }

  @override
  Future<Map<String, Object?>?> get(String key) async {
    final store = stringMapStoreFactory.store();
    final db = await database;
    return await store.record(key).get(db);
  }

  @override
  Future<bool> put(String key, Map<String, Object?> data) async {
    final store = stringMapStoreFactory.store();
    final db = await database;
    await store.record(key).put(db, data);
    return true;
  }
}
