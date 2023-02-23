import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:qr_code/core/init/lang/locale_keys.g.dart';

import '../../../../core/base/view_model/base_view_model.dart';
import '../../../../core/init/cache/i_shared_manager.dart';
import '../../../../core/init/cache/shared_manager.dart';
import '../../../../core/init/cache/shared_object.dart';
import '../../../../core/init/lang/language_manager.dart';
import '../../qr_history/model/gen_scan_qr_models.dart';

part 'app_home_view_model.g.dart';

class AppHomeViewModel = _AppHomeViewModelBase with _$AppHomeViewModel;

abstract class _AppHomeViewModelBase with Store, BaseViewModel {
  Locale? langLocale;

  ISharedManager? sharedManager;
  SharedPrefObject? sharedPrefObject;

  TabController? tabController;

  @observable
  GeneratedScannedQRModels? scannedQrCodes;

  @observable
  int pageIndex = 0;

  @override
  void setContext(BuildContext context) => baseContext = context;

  @override
  void init() {
    sharedPrefObject = SharedPrefObject.instance;
    langLocale = baseContext.locale;
    initAndSetShared();
  }

  Future<void> initAndSetShared() async {
    //await sharedPrefObject?.initShared(); //* splashta zaten initialize oldu
    sharedManager = SharedManger(sharedPrefObject?.getSharedObject);
  }

  @action
  Future<void> setLang(bool value) async {
    if (value) {
      await baseContext.setLocale(langLocale ?? LanguageManager.instance.trLocale);
    }
  }

  @action
  void chandePageIndex(int index) {
    pageIndex = index;
  }

  String get changeTitle {
    return pageIndex == 0
        ? LocaleKeys.generate_qr.tr()
        : pageIndex == 1
            ? LocaleKeys.scan_qr.tr()
            : LocaleKeys.qr_history.tr();
  }
}
