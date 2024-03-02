import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../configs/di/injection_container.dart';

class PrefUtil {
  PrefUtil._();

  static final PrefUtil instance = PrefUtil._();

  final SharedPreferences _prefs = inject.get<SharedPreferences>();

  Future<bool> setValue(String key, dynamic value) async {
    if (value is String) {
      return await _prefs.setString(key, value);
    } else if (value is int) {
      return await _prefs.setInt(key, value);
    } else if (value is double) {
      return await _prefs.setDouble(key, value);
    } else if (value is bool) {
      return await _prefs.setBool(key, value);
    } else if (value is List<String>) {
      return await _prefs.setStringList(key, value);
    } else {
      return false;
    }
  }

  int? getInt(String key) {
    return _prefs.getInt(key);
  }

  double? getDouble(String key) {
    return _prefs.getDouble(key);
  }

  String? getString(String key) {
    return _prefs.getString(key);
  }

  bool? getBool(String key) {
    return _prefs.getBool(key);
  }

  dynamic getValue(String key) {
    return _prefs.get(key);
  }

  Future<bool> setObject(String key, Map<String, dynamic> json) async {
    return await _prefs.setString(key, jsonEncode(json));
  }

  Map<String, dynamic>? getObject(String key) {
    try {
      final value = getValue(key);
      return jsonDecode(value) as Map<String, dynamic>;
    } catch (e) {
      return null;
    }
  }

  Future<bool> remove(String key) async {
    return await _prefs.remove(key);
  }

  Future<bool> clear() async {
    return await _prefs.clear();
  }
}
