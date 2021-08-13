/// An implementation of `FlutterParseStorageInterface` using shared_preferences.
library flutter_parse_storage_shared_preferences;

import 'dart:convert';

import 'package:flutter_parse_storage_interface/flutter_parse_storage_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Implementation of `flutter_parse_storage` with `shared_preferences`
class ParseStorageSharedPreferences extends ParseStorageInterface {
  ParseStorageSharedPreferences();

  @override
  bool get isMock => false;

  @override
  Future<bool> clear({String? key}) async {
    final prefs = await SharedPreferences.getInstance();
    if (key != null) {
      return prefs.remove(key);
    }

    return prefs.clear();
  }

  @override
  Future<Map<String, Object?>?> get(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(key);
    try {
      if (data != null) return json.decode(data);
    } catch (_) {}
    return null;
  }

  @override
  Future<bool> put(String key, Map<String, Object?>? data) async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.setString(key, json.encode(data));
  }
}
