import 'package:flutter/material.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../product/enums/image_enums.dart';
import '../view_model/splash_view_model.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<SplashViewModel>(
      viewModel: SplashViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: ((context, value) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.onSurface,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(flex: 17, child: AppLogo()),
              Expanded(
                  flex: 3,
                  child: Center(
                    child: CircularProgressIndicator(color: Theme.of(context).colorScheme.primary),
                  ))
            ],
          ),
        );
      }),
    );
  }
}

class AppLogo extends StatelessWidget {
  const AppLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: SizedBox(width: 256, child: Image.asset(ImageEnumName.big.imagePath)));
  }
}
