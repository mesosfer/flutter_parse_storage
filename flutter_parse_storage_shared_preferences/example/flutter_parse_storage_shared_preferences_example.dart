import 'package:flutter_parse_storage_interface/flutter_parse_storage_interface.dart';
import 'package:flutter_parse_storage_shared_preferences/flutter_parse_storage_shared_preferences.dart';

void main() {
  // setup parse local storage instance using sembast
  FlutterParseStorageInterface.instance =
      FlutterParseStorageSharedPreferences();

  // initialize flutter_parse

  // run applications
}
