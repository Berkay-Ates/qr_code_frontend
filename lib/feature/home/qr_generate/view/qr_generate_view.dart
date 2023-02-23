import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qr_code/core/init/lang/locale_keys.g.dart';
import 'package:qr_code/product/enums/social_media_enums.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../product/enums/qr_code_options_enums.dart';
import '../../../../product/paddings/app_paddings.dart';
import '../view_model/qr_generate_view_model.dart';

part 'suplementary_qr_generate_view.dart';

class QrGenerateView extends StatelessWidget {
  const QrGenerateView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<QrGenerateViewModel>(
      viewModel: QrGenerateViewModel(),
      onModelReady: ((viewModel) {
        viewModel.setContext(context);
        viewModel.init();
      }),
      onPageBuilder: ((context, viewModel) {
        viewModel.formState.currentState?.reset();
        return Scaffold(
          key: viewModel.scaffoldState,
          body: Observer(builder: (_) {
            return Column(
              children: [
                Card(
                  margin: const EdgeInsets.all(12),
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(18))),
                  child: Column(
                    children: [
                      Form(
                        key: viewModel.formState,
                        child: Padding(
                          padding: AppPaddings.largeAllPadding,
                          child: buildQrCodeGenerateField(viewModel),
                        ),
                      ),
                      Padding(
                        padding: AppPaddings.xlargeAllPadding,
                        child: ElevatedButton(
                            onPressed: () {
                              viewModel.navigateAndBuildQR();
                            },
                            child: viewModel.isloading
                                ? CircularProgressIndicator.adaptive(
                                    strokeWidth: 3,
                                    backgroundColor: Theme.of(context).colorScheme.onSurface,
                                  )
                                : Text(LocaleKeys.generate_qr_app_bar.tr())),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: AppPaddings.largeAllPadding,
                    child: buildGridView(context, viewModel),
                  ),
                ),
              ],
            );
          }),
        );
      }),
    );
  }
}
