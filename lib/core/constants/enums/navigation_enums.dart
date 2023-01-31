enum NavigationEnums {
  splashView('/'),
  onBoardView('/onBoardView'),
  registerLoginView('/registerLoginView'),
  homeView('/homeView'),
  generatedQrView("/generatedQRView");

  final String routeName;
  const NavigationEnums(this.routeName);
}
