import 'package:flutter_parse_storage_interface/flutter_parse_storage_interface.dart';

class InMemoryParseStorage extends ParseStorageInterface {
  /// Instantiates an empty in-memory preferences store.
  InMemoryParseStorage.empty() : _data = <String, Map<String, Object?>>{};

  /// Instantiates an in-memory preferences store containing a copy of [data].
  InMemoryParseStorage.withData(Map<String, Map<String, Object?>> data)
      : _data = Map<String, Map<String, Object>>.from(data);

  final Map<String, Map<String, Object?>> _data;

  @override
  Future<bool> clear({String? key}) async {
    if (key != null) {
      _data.remove(key);
    } else {
      _data.clear();
    }
    return true;
  }

  @override
  Future<Map<String, Object?>?> get(String key) async {
    return _data[key];
  }

  @override
  Future<bool> put(String key, Map<String, Object?> data) async {
    _data[key] = data;
    return true;
  }
}
