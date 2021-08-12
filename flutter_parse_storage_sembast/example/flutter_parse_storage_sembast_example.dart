import 'package:flutter_parse_storage_interface/flutter_parse_storage_interface.dart';
import 'package:flutter_parse_storage_sembast/flutter_parse_storage_sembast.dart';

void main() {
  // setup parse local storage instance using sembast
  FlutterParseStorageInterface.instance = FlutterParseStorageSembast(
    path: '/path/to/folder', // used for IO platforms
    databaseName: 'db-name.ext', // optional : default is `Dart-Parse`
  );

  // initialize flutter_parse

  // run applications
}
