import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_memory.dart';
import 'package:sembast/src/api/v2/factory.dart';
import 'package:sembast/src/api/v2/database.dart';

import 'interface.dart';

/// Implementation of [ParseStorageSembast] using [databaseFactoryMemory]
class ParseStorageSembast extends BaseParseStorageSembast {
  ParseStorageSembast({required String path, String? databaseName})
      : super(path: path, databaseName: databaseName);

  Database? _database;

  @override
  Future<Database> get database async {
    _database ??=
        await databaseFactory.openDatabase(databaseName ?? 'Dart-Parse');

    return _database!;
  }

  @override
  DatabaseFactory get databaseFactory => databaseFactoryMemory;
}
