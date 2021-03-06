/// A common local storage interface for the `flutter_parse` plugin.
library flutter_parse_storage_interface;

import 'package:meta/meta.dart';

/// Local storage manager for internal library use
abstract class ParseStorageInterface {
  /// The default instance of [ParseStorageInterface] to use.
  ///
  /// Defaults to [InMemoryParseStorage.empty()].
  static ParseStorageInterface get instance => _instance;

  /// Platform-specific plugins should set this with their own platform-specific
  /// class that extends [ParseStorageInterface] when they register themselves.
  static set instance(ParseStorageInterface value) {
    if (!value.isMock) {
      try {
        value._verifyProvidesDefaultImplementations();
      } on NoSuchMethodError catch (_) {
        throw AssertionError(
            'Platform interfaces must not be implemented with `implements`');
      }
    }
    _instance = value;
  }

  static ParseStorageInterface _instance = InMemoryParseStorage.empty();

  @visibleForTesting
  bool get isMock => false;

  /// Return the [Map] from a key
  Future<Map<String, Object?>?> get(String key);

  /// Set [Map] data using current key
  Future<bool> put(String key, Map<String, Object?> data);

  /// Clear current key data, or all of it if `key` is not set
  Future<bool> clear({String? key});

  // This method makes sure that ParseStorageInterface isn't implemented with `implements`.
  //
  // See class doc for more details on why implementing this class is forbidden.
  //
  // This private method is called by the instance setter, which fails if the class is
  // implemented with `implements`.
  void _verifyProvidesDefaultImplementations() {}
}

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
