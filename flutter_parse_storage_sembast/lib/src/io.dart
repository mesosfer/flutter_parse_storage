import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

import 'interface.dart';

/// Implementation of [ParseStorageSembast] using [databaseFactoryIo]
class ParseStorageSembast extends BaseParseStorageSembast {
  ParseStorageSembast({required String path, String? databaseName})
      : super(path: path, databaseName: databaseName);

  Database? _database;

  @override
  Future<Database> get database async {
    var path = this.path;
    if (!path.endsWith('/')) {
      path = '$path/';
    }
    path = '$path${databaseName ?? 'Dart-Parse'}';

    _database ??= await databaseFactory.openDatabase(path);

    return _database!;
  }

  @override
  DatabaseFactory get databaseFactory => databaseFactoryIo;
}
