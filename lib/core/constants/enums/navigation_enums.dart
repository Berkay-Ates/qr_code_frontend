enum NavigationEnums {
  splashView('/'),
  onBoardView('/onBoardView'),
  registerLoginView('/registerLoginView'),
  homeView('/homeView');

  final String routeName;
  const NavigationEnums(this.routeName);
}
