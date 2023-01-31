import 'package:dio/dio.dart';

class AppServiceInstance {
  static AppServiceInstance? _instance;
  static AppServiceInstance? get instance {
    _instance ??= AppServiceInstance._init();
    return _instance;
  }

  AppServiceInstance._init() {
    _dio = Dio();
  }

  late final Dio _dio;

  Dio get dio => _dio;
}
