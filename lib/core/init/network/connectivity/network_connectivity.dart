import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

import '../../../constants/enums/network_connectivity_enums.dart';
import 'i_network_connectivity.dart';

class NetworkConnectivity extends INetworkConnectivity {
  late final Connectivity _networkConnectivity;
  StreamSubscription<ConnectivityResult>? _subscription;

  NetworkConnectivity() {
    _networkConnectivity = Connectivity();
  }

  @override
  Future<NetworkConnectivityEnum?> checkNetworkConnectivity() async {
    final connectivity = await _networkConnectivity.checkConnectivity();
    NetworkConnectivityEnum? connectivityEnum = NetworkConnectivityEnum.checkConnectivity(connectivity);
    return connectivityEnum;
  }

  @override
  void streamNetworkConnectivity(NetworkConnectivityStreamCallback onChange) {
    _subscription = _networkConnectivity.onConnectivityChanged.listen((event) {
      onChange.call(NetworkConnectivityEnum.checkConnectivity(event));
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
  }
}
