abstract class ISharedManager {
  Future<bool> setBool(String key, bool value);
  Future<bool> setString(String key, String value);
  Future<bool> setInt(String key, int value);
  Future<bool> setStringList(String key, List<String> value);

  bool? getBool(String key);
  String? getString(String key);
  int? getInt(String key);
  List<String>? getStringList(String key);

  Future<bool> removeData(String key);
}
