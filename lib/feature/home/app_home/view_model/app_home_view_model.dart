import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/view_model/base_view_model.dart';
import '../../qr_history/model/gen_scan_qr_models.dart';

part 'app_home_view_model.g.dart';

class AppHomeViewModel = _AppHomeViewModelBase with _$AppHomeViewModel;

abstract class _AppHomeViewModelBase with Store, BaseViewModel {
  TabController? tabController;

  @observable
  GeneratedScannedQRModels? scannedQrCodes;

  @observable
  int pageIndex = 0;

  @override
  void setContext(BuildContext context) => baseContext = context;

  @override
  void init() {}

  @action
  void chandePageIndex(int index) {
    pageIndex = index;
  }
}
