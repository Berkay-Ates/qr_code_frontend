import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/errors/shared_errors/shared_errors.dart';
import 'i_shared_manager.dart';

class SharedManger extends ISharedManager {
  final SharedPreferences? sharedPreferences;

  SharedManger(this.sharedPreferences);

  void checkPreferences() {
    if (sharedPreferences == null) {
      throw SharedPrefErrors<SharedManger>();
    }
  }

  @override
  bool? getBool(String key) {
    checkPreferences();
    final result = sharedPreferences?.getBool(key);
    return result;
  }

  @override
  int? getInt(String key) {
    checkPreferences();
    final result = sharedPreferences?.getInt(key);
    return result;
  }

  @override
  String? getString(String key) {
    checkPreferences();
    final result = sharedPreferences?.getString(key);
    return result;
  }

  @override
  List<String>? getStringList(String key) {
    checkPreferences();
    final result = sharedPreferences?.getStringList(key);
    return result;
  }

  @override
  Future<bool> removeData(String key) async {
    checkPreferences();
    final result = await sharedPreferences?.remove(key);
    return (result ?? false);
  }

  @override
  Future<bool> setBool(String key, bool value) async {
    checkPreferences();
    final result = await sharedPreferences?.setBool(key, value);
    return result ?? false;
  }

  @override
  Future<bool> setInt(String key, int value) async {
    checkPreferences();
    final result = await sharedPreferences?.setInt(key, value);
    return result ?? false;
  }

  @override
  Future<bool> setString(String key, String value) async {
    checkPreferences();
    final result = await sharedPreferences?.setString(key, value);
    return result ?? false;
  }

  @override
  Future<bool> setStringList(String key, List<String> value) async {
    checkPreferences();
    final result = await sharedPreferences?.setStringList(key, value);
    return result ?? false;
  }
}
