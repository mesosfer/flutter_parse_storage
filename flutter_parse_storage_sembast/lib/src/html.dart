import 'package:sembast/sembast.dart';
import 'package:sembast_web/sembast_web.dart';

import 'interface.dart';

/// Implementation of [ParseStorageSembast] using [databaseFactoryWeb]
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
  DatabaseFactory get databaseFactory => databaseFactoryWeb;
}
