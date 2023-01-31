import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'core/constants/app/application_constants.dart';
import 'core/init/lang/language_manager.dart';
import 'core/init/navigation/navigation_service.dart';
import 'core/init/theme/app_theme/app_theme_light.dart';

void main() async {
  _init().then((value) {
    runApp(
      EasyLocalization(
        path: ApplicationConstants.langAssetPath,
        supportedLocales: LanguageManager.instance.supportedLocales,
        startLocale: LanguageManager.instance.enLocale,
        child: MyApp(),
      ),
    );
  });
}

Future<void> _init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  //await Hive.initFlutter();
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final navigationService = NavigationService.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      theme: AppThemeLight.instance.themeData,
      title: 'Material App',
      routeInformationParser: navigationService.router.routeInformationParser,
      routeInformationProvider: navigationService.router.routeInformationProvider,
      routerDelegate: navigationService.router.routerDelegate,
    );
  }
}
