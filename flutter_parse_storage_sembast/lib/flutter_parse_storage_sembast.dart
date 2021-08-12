/// An implementation of `FlutterParseStorageInterface` using sembast.
library flutter_parse_storage_sembast;

export 'src/memory.dart'
    if (dart.library.io) 'src/io.dart'
    if (dart.library.html) 'src/html.dart';
