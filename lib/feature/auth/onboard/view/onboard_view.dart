import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/components/auto_size_text.dart';
import '../../../../product/paddings/app_paddings.dart';
import '../view_model/onboard_view_model.dart';

class OnboardView extends StatefulWidget {
  const OnboardView({super.key});

  @override
  State<OnboardView> createState() => _OnboardViewState();
}

class _OnboardViewState extends State<OnboardView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<OnboardViewModel>(
      viewModel: OnboardViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (context, viewModel) {
        return Scaffold(
          extendBody: true,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              viewModel.registerLoginPage();
            },
            child: const Icon(Icons.double_arrow_outlined),
          ),
          body: Padding(
            padding: AppPaddings.largeHorizontalPadding,
            child: Observer(builder: (_) {
              return Column(
                children: [
                  buildSVGWidgets(viewModel),
                  buildOnmodelTexts(viewModel),
                  buildFooter(viewModel),
                ],
              );
            }),
          ),
        );
      },
    );
  }

  Expanded buildFooter(OnboardViewModel viewModel) {
    return Expanded(
        flex: 3,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: ((context, index) {
              return Opacity(
                opacity: viewModel.currentIndex == index ? 1 : 0.5,
                child: Padding(
                  padding: AppPaddings.smallAllPadding,
                  child: CircleAvatar(
                    radius: viewModel.currentIndex == index ? 10 : 5.0,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ),
                ),
              );
            })));
  }

  Expanded buildOnmodelTexts(OnboardViewModel viewModel) {
    return Expanded(
        flex: 3,
        child: Column(children: [
          CustomAutoSizeText(
            value: viewModel.onBoardItems[viewModel.currentIndex].title.tr(),
            textStyle: Theme.of(context).textTheme.headline3?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
          ),
          Padding(
            padding: AppPaddings.mediumAllPadding,
            child: CustomAutoSizeText(
                value: viewModel.onBoardItems[viewModel.currentIndex].desc.tr(),
                textStyle: Theme.of(context).textTheme.headline6?.copyWith(),
                alignment: TextAlign.center),
          ),
        ]));
  }

  Expanded buildSVGWidgets(OnboardViewModel viewModel) {
    return Expanded(
      flex: 10,
      child: PageView.builder(
        itemCount: 3,
        itemBuilder: ((context, index) {
          return SvgPicture.asset(viewModel.onBoardItems[index].imagePath);
        }),
        onPageChanged: (value) => viewModel.setModelIndex(value),
      ),
    );
  }
}
