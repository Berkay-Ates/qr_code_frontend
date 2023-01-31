import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefObject {
  SharedPreferences? _sharedPreferences;
  static SharedPrefObject? _instance;
  static SharedPrefObject? get instance {
    _instance ??= SharedPrefObject._init();
    return _instance;
  }

  SharedPreferences? get getSharedObject => _sharedPreferences;

  Future<void> initShared() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  SharedPrefObject._init();
}
