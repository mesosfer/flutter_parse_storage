## flutter_parse_storage_interface

A common platform interface for the [flutter_parse](https://pub.dev/packages/flutter_parse) local storage plugin.

This interface allows platform-specific implementations of the `flutter_parse` local storage plugin, as well as the plugin itself, to ensure they are supporting the same interface.

## Usage

To implement a new database-specific implementation of [flutter_parse](https://pub.dev/packages/flutter_parse), extend `FlutterParseStorageInterface` with an implementation that performs the database-specific behavior, and when you register your plugin, set the default `ParseStorageInterface` by calling the `ParseStorageInterface.instance` setter.