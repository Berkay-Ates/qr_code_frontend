import 'package:connectivity_plus/connectivity_plus.dart';

enum NetworkConnectivityEnum {
  on,
  off;

  static NetworkConnectivityEnum checkConnectivity(ConnectivityResult connectivity) {
    switch (connectivity) {
      case ConnectivityResult.bluetooth:
        return NetworkConnectivityEnum.off;
      case ConnectivityResult.wifi:
        return NetworkConnectivityEnum.on;
      case ConnectivityResult.ethernet:
        return NetworkConnectivityEnum.on;
      case ConnectivityResult.mobile:
        return NetworkConnectivityEnum.on;
      case ConnectivityResult.none:
        return NetworkConnectivityEnum.off;
      case ConnectivityResult.vpn:
        return NetworkConnectivityEnum.off;
    }
  }
}
