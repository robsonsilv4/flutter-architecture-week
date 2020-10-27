import 'package:shared_preferences/shared_preferences.dart';

import '../interfaces/local_storage_interface.dart';

class LocalStorageService implements ILocalStorage {
  @override
  Future delete(String key) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove(key);
  }

  @override
  Future get(String key) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.get(key);
  }

  @override
  Future put(String key, value) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    if (value is int) {
      sharedPreferences.setInt(key, value);
    } else if (value is double) {
      sharedPreferences.setDouble(key, value);
    } else if (value is bool) {
      sharedPreferences.setBool(key, value);
    } else if (value is String) {
      sharedPreferences.setString(key, value);
    }
  }
}
