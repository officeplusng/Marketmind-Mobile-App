import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import '../export/export.core.dart';

@lazySingleton
class SecureStorageService {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  // Save token
  Future<void> saveToken(String token) async {
    await _storage.write(key: StorageKeys.token, value: token);
  }

  // Get token
  Future<String?> getToken() async {
    return await _storage.read(key: StorageKeys.token);
  }

  Future<String?> get(String key) async {
    return await _storage.read(key: key);
  }

  Future<void> write(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  Future<void> writeJson(String key, Map<String, dynamic> json) async {
    write(key, jsonEncode(json));
  }

  Future<void> deleteToken() async {
    await _storage.delete(key: StorageKeys.token);
  }

  Future<void> delete(String key) async {
    await _storage.delete(key: key);
  }

  Future<void> tearDown() async {
    await _storage.deleteAll();
  }
}
