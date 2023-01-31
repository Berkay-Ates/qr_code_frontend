import 'package:flutter/material.dart';
import '../../init/navigation/navigation_service.dart';
import '../../init/network/service/network_sercice.dart';
import '../../init/token/user_token.dart';

abstract class BaseViewModel {
  late BuildContext baseContext;

  AppServiceInstance? appService = AppServiceInstance.instance;
  NavigationService navigationService = NavigationService.instance;
  UserToken userToken = UserToken.instance;

  void setContext(BuildContext context);
  void init();
}
