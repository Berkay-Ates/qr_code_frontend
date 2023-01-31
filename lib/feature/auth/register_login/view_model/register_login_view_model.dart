import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/view_model/base_view_model.dart';
import '../../../../core/constants/app/application_constants.dart';
import '../../../../core/constants/cache/cache_enums.dart';
import '../../../../core/constants/enums/navigation_enums.dart';
import '../../../../core/init/cache/i_shared_manager.dart';
import '../../../../core/init/cache/shared_manager.dart';
import '../../../../core/init/cache/shared_object.dart';
import '../model/request_model/register_login_req_model.dart';
import '../model/response_model/register_login_res_model.dart';

part 'register_login_view_model.g.dart';

class RegisterLoginViewModel = _RegisterLoginViewModelBase with _$RegisterLoginViewModel;

abstract class _RegisterLoginViewModelBase with Store, BaseViewModel {
  GlobalKey<FormState> formState = GlobalKey();
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();

  TabController? tabController;

  TextEditingController? emailController;
  TextEditingController? passwordController;
  TextEditingController? nameController;

  ISharedManager? sharedManager;
  SharedPrefObject? sharedPrefObject;

  @observable
  bool isloginPage = true;

  @observable
  int pageIndex = 0;

  @observable
  bool isloading = false;

  @observable
  bool islock = false;

  @override
  void setContext(BuildContext context) => baseContext = context;

  @override
  void init() {
    sharedPrefObject = SharedPrefObject.instance;
    emailController = TextEditingController();
    passwordController = TextEditingController();
    nameController = TextEditingController();
    initAndSetShared();
  }

  Future<void> initAndSetShared() async {
    //await sharedPrefObject?.initShared(); //* splash icerisinde initialize oldu
    sharedManager = SharedManger(sharedPrefObject?.getSharedObject);
  }

  @action
  void changeLoading() {
    isloading = !isloading;
  }

  @action
  void changeVisibility() {
    islock = !islock;
  }

  Future<bool?> saveUserToken(String token) async {
    return await sharedManager?.setString(CacheEnumKeys.TOKEN.name, token);
  }

  @action
  Future<void> loginUser() async {
    changeLoading();
    if (formState.currentState?.validate() ?? false) {
      final response = await appService?.dio.post(ApplicationConstants.LOGIN_USER_URL,
          data: RegisterLoginModel(nameController!.text, emailController!.text, passwordController!.text).toJson());
      if (response?.statusCode == HttpStatus.ok) {
        final data = response?.data;
        if (data is Map<String, dynamic>) {
          final RegisterLoginResponseModel responseModel = RegisterLoginResponseModel.fromJson(data);
          if (responseModel.token != null) {
            final saveResponse = await saveUserToken(responseModel.token!);
            if (saveResponse ?? false) {
              userToken.setToken(responseModel.token!);
              navigationService.router.go(NavigationEnums.homeView.routeName);
            }
          }
        }
      }
    }
    changeLoading();
  }

  @action
  Future<void> registerUser() async {
    changeLoading();
    if (formState.currentState?.validate() ?? false) {
      final response = await appService?.dio.post(ApplicationConstants.REGISTER_USER_URL,
          data: RegisterLoginModel(nameController?.text, emailController!.text, passwordController!.text).toJson());
      if (response?.statusCode == HttpStatus.created) {
        final data = response?.data;
        if (data is Map<String, dynamic>) {
          final RegisterLoginResponseModel responseModel = RegisterLoginResponseModel.fromJson(data);
          if (responseModel.token != null) {
            final saveResponse = await saveUserToken(responseModel.token!);
            if (saveResponse ?? false) {
              userToken.setToken(responseModel.token!);
              navigationService.router.go(NavigationEnums.homeView.routeName);
            }
          }
        }
      }
    }
    changeLoading();
  }

  @action
  void changePage(int index) {
    pageIndex = index;
    isloginPage = pageIndex == 0 ? true : false;
  }
}
