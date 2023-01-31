import 'package:go_router/go_router.dart';

import '../../../feature/auth/onboard/view/onboard_view.dart';
import '../../../feature/auth/register_login/view/register_login_view.dart';
import '../../../feature/auth/splash/view/splash_view.dart';
import '../../../feature/home/app_home/view/app_home_view.dart';
import '../../constants/enums/navigation_enums.dart';

class NavigationService {
  static final NavigationService _instance = NavigationService._init();
  static NavigationService get instance => _instance;

  NavigationService._init();

  final router = GoRouter(routes: [
    GoRoute(path: NavigationEnums.splashView.routeName, builder: ((context, state) => const SplashView())),
    GoRoute(path: NavigationEnums.onBoardView.routeName, builder: ((context, state) => const OnboardView())),
    GoRoute(path: NavigationEnums.homeView.routeName, builder: ((context, state) => const AppHomeView())),
    GoRoute(path: NavigationEnums.registerLoginView.routeName, builder: ((context, state) => const RegisterLoginView()))
  ]);
}
