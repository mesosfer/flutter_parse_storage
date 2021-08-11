import 'package:flutter_parse_storage_interface/flutter_parse_storage_interface.dart';
import 'package:test/test.dart';

void main() {
  group(FlutterParseStorageInterface, () {
    test('disallows implementing interface', () {
      expect(
        () {
          FlutterParseStorageInterface.instance = IllegalImplementation();
        },
        throwsA(isA<AssertionError>()),
      );
    });
  });
}

class IllegalImplementation implements FlutterParseStorageInterface {
  IllegalImplementation() : super();

  @override
  Future<bool> clear({String? key}) {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, Object>?> get(String key) {
    throw UnimplementedError();
  }

  @override
  Future<bool> put(String key, Map<String, Object?> data) {
    throw UnimplementedError();
  }

  @override
  bool get isMock => false;
}
