import '../../../constants/enums/network_connectivity_enums.dart';

typedef NetworkConnectivityStreamCallback = void Function(NetworkConnectivityEnum? connectivityResult);

abstract class INetworkConnectivity {
  Future<NetworkConnectivityEnum?> checkNetworkConnectivity();
  void streamNetworkConnectivity(NetworkConnectivityStreamCallback onChange);
  void dispose();
}
