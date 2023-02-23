import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/constants/cache/cache_enums.dart';
import '../../../../core/constants/enums/lang_enums.dart';
import '../../../../core/constants/enums/navigation_enums.dart';
import '../../../../core/init/lang/language_manager.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../../product/paddings/app_paddings.dart';
import '../../qr_generate/view/qr_generate_view.dart';
import '../../qr_history/view/qr_history_view.dart';
import '../../qr_scan/view/qr_scan_view.dart';
import '../view_model/app_home_view_model.dart';

class AppHomeView extends StatefulWidget {
  const AppHomeView({super.key});

  @override
  State<AppHomeView> createState() => _AppHomeViewState();
}

class _AppHomeViewState extends State<AppHomeView> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BaseView<AppHomeViewModel>(
      viewModel: AppHomeViewModel(),
      onModelReady: ((viewModel) {
        viewModel.setContext(context);
        viewModel.init();
        viewModel.tabController = TabController(length: 3, vsync: this);
      }),
      onPageBuilder: ((context, viewModel) {
        return DefaultTabController(
          length: 3,
          child: Scaffold(
            extendBody: true,
            drawer: Drawer(
              child: Padding(
                  padding: AppPaddings.largeHorizontalPadding,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(children: [
                        Icon(Icons.logout_outlined, color: Theme.of(context).colorScheme.primary),
                        TextButton(
                            onPressed: () {},
                            onLongPress: (() async {
                              final response = await viewModel.sharedManager?.removeData(CacheEnumKeys.TOKEN.name);
                              if (response ?? false) {
                                viewModel.navigationService.router.go(NavigationEnums.onBoardView.routeName);
                              }
                            }),
                            child: Text(LocaleKeys.generate_qr_exit.tr(), style: Theme.of(context).textTheme.headline6))
                      ]),
                      const Divider(thickness: 2),
                      Row(children: [
                        Icon(Icons.translate_outlined, color: Theme.of(context).colorScheme.primary),
                        TextButton(
                            onPressed: (() async {
                              final result = await viewModel.sharedManager?.setString(
                                  LanguageEmums.language.name,
                                  viewModel.langLocale == LanguageManager.instance.enLocale
                                      ? LanguageEmums.turkish.name
                                      : LanguageEmums.english.name);

                              if (result ?? false) {
                                viewModel.langLocale = viewModel.langLocale == LanguageManager.instance.enLocale
                                    ? LanguageManager.instance.trLocale
                                    : LanguageManager.instance.enLocale;
                                await viewModel.setLang(result ?? false);
                              }
                            }),
                            child: Text(LocaleKeys.generate_qr_change_lang.tr(),
                                style: Theme.of(context).textTheme.headline6))
                      ]),
                    ],
                  )),
            ),
            appBar: AppBar(
              title: Observer(builder: (_) {
                return viewModel.pageIndex == 0
                    ? Text(LocaleKeys.generate_qr_app_bar.tr())
                    : viewModel.pageIndex == 1
                        ? Text(LocaleKeys.scan_qr_app_bar.tr())
                        : Text(LocaleKeys.qr_history_app_bar.tr());
              }),
            ),
            bottomNavigationBar: BottomAppBar(
              color: Theme.of(context).colorScheme.onSurface,
              child: TabBar(
                controller: viewModel.tabController,
                isScrollable: false,
                onTap: (value) => viewModel.chandePageIndex(value),
                tabs: [
                  Tab(
                    iconMargin: const EdgeInsets.all(3),
                    icon: const Icon(Icons.add_box_outlined, size: 32),
                    child: Text("    ${LocaleKeys.generate_qr_app_bar.tr()}   "),
                  ),
                  Tab(
                    iconMargin: const EdgeInsets.all(3),
                    icon: const Icon(Icons.qr_code_scanner_outlined, size: 32),
                    child: Text("    ${LocaleKeys.scan_qr_app_bar.tr()}   "),
                  ),
                  Tab(
                    iconMargin: const EdgeInsets.all(3),
                    icon: const Icon(Icons.history, size: 32),
                    child: Text("    ${LocaleKeys.qr_history_app_bar.tr()}   "),
                  ),
                ],
                labelStyle: Theme.of(context).textTheme.button?.copyWith(),
                unselectedLabelStyle: Theme.of(context).textTheme.button,
                indicatorWeight: 3,
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: Theme.of(context).colorScheme.primary,
                unselectedLabelColor: Theme.of(context).colorScheme.onBackground,
                indicatorColor: Theme.of(context).colorScheme.primary,
              ),
            ),
            body: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: viewModel.tabController,
                children: const [QrGenerateView(), QrCodeScanView(), QrHistoryView()]
                //children: const [QrGenerateView(), QrCodeScanView()]
                ),
          ),
        );
      }),
    );
  }
}
