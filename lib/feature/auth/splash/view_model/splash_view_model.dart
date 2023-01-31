import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../../../../core/init/token/user_token.dart';
import '../../../../core/constants/cache/cache_enums.dart';
import '../../../../core/constants/durations/app_durations.dart';
import '../../../../core/constants/enums/navigation_enums.dart';
import '../../../../core/constants/enums/network_connectivity_enums.dart';
import '../../../../core/init/cache/shared_manager.dart';
import '../../../../core/init/network/connectivity/network_connectivity.dart';

import '../../../../core/base/view_model/base_view_model.dart';
import '../../../../core/init/cache/i_shared_manager.dart';
import '../../../../core/init/cache/shared_object.dart';
import '../../../../core/init/network/connectivity/i_network_connectivity.dart';

part 'splash_view_model.g.dart';

class SplashViewModel = _SplashViewModelBase with _$SplashViewModel;

abstract class _SplashViewModelBase with Store, BaseViewModel {
  late final INetworkConnectivity networkConnectivity;
  ISharedManager? sharedManager;
  SharedPrefObject? sharedPrefObject;

  @observable
  NetworkConnectivityEnum? connectivityEnum;

  @observable
  bool isLoading = true;

  @observable
  bool isTokenExists = false;

  @override
  void setContext(BuildContext context) => baseContext = context;

  @override
  void init() {
    sharedPrefObject = SharedPrefObject.instance;
    networkConnectivity = NetworkConnectivity();
    checkFirstTimeConnectivity();
    initAndSetShared();
  }

  Future<void> initAndSetShared() async {
    await sharedPrefObject?.initShared();
    sharedManager = SharedManger(sharedPrefObject?.getSharedObject);
    checkUserToken();
  }

  @action
  Future<void> checkUserToken() async {
    String? token = sharedManager?.getString(CacheEnumKeys.TOKEN.name);
    await Future.delayed(AppDurations.durationLow);
    if (token != null) {
      UserToken.instance.setToken(token);
      navigationService.router.go(NavigationEnums.homeView.routeName);
    } else {
      navigationService.router.go(NavigationEnums.onBoardView.routeName);
    }
  }

  @action
  Future<void> checkFirstTimeConnectivity() async {
    connectivityEnum = await networkConnectivity.checkNetworkConnectivity();
  }
}
