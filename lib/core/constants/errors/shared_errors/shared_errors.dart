import '../../../init/cache/i_shared_manager.dart';

class SharedPrefErrors<T extends ISharedManager> implements Exception {
  @override
  String toString() {
    return 'singleton Shared pref object has not been initialized';
  }
}
