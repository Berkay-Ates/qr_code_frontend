import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/view_model/base_view_model.dart';
import '../../../../core/constants/enums/navigation_enums.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../../product/enums/image_enums.dart';
import '../model/onboard_model.dart';

part 'onboard_view_model.g.dart';

class OnboardViewModel = _OnboardViewModelBase with _$OnboardViewModel;

abstract class _OnboardViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => baseContext = context;

  List<OnboardModel> onBoardItems = [];

  @observable
  int currentIndex = 0;

  @override
  void init() {
    onBoardItems.add(svgModel1);
    onBoardItems.add(svgModel0);
    onBoardItems.add(svgModel2);
  }

  void registerLoginPage() {
    navigationService.router.go(NavigationEnums.registerLoginView.routeName);
  }

  @action
  void setModelIndex(int newIndex) => currentIndex = newIndex;

  OnboardModel svgModel0 =
      OnboardModel(ImageEnumName.svg0.svgPath, LocaleKeys.onboard_page0_title, LocaleKeys.onboard_page0_desc);
  OnboardModel svgModel1 =
      OnboardModel(ImageEnumName.svg1.svgPath, LocaleKeys.onboard_page1_title, LocaleKeys.onboard_page1_desc);
  OnboardModel svgModel2 =
      OnboardModel(ImageEnumName.svg2.svgPath, LocaleKeys.onboard_page2_title, LocaleKeys.onboard_page2_desc);
}
