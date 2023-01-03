import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'giasu.dart';

class SecureStorage {
  final _storage = FlutterSecureStorage();

  Future writeData(String key, String gs) async {
    var writeData = await _storage.write(key: key, value: gs);
    return writeData;
  }

  Future readData(String key) async {
    var readData = await _storage.read(key: key);
    return readData;
  }

  Future deleteData(String key) async {
    var deleteData = await _storage.delete(key: key);
    return deleteData;
  }
}
