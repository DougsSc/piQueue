import 'dart:async';
import 'dart:io';

class StorageManager {
  File get _file => File('keys.json');

  FutureOr<String> read() async {
    try {
      return await _file.readAsString();
    } catch (e) {
      return '[]';
    }
  }

  Future<File> write(String content) async {
    return _file.writeAsString(content);
  }
}
