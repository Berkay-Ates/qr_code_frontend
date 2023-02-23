import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:qr_code/core/init/lang/locale_keys.g.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../product/enums/qr_code_options_enums.dart';
import '../../../../product/paddings/app_paddings.dart';
import '../view_model/generated_qr_view_model.dart';

class GeneratedQrView extends StatefulWidget {
  const GeneratedQrView({
    Key? key,
    this.qrData,
    this.qrDataForDisplay,
    this.qrType,
  }) : super(key: key);

  final String? qrData;
  final String? qrDataForDisplay;
  final String? qrType;

  @override
  State<GeneratedQrView> createState() => _GeneratedQrViewState();
}

class _GeneratedQrViewState extends State<GeneratedQrView> {
  final GlobalKey globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BaseView<GeneratedQrViewModel>(
        viewModel: GeneratedQrViewModel(),
        onModelReady: ((viewModel) {
          viewModel.init();
          viewModel.setContext(context);
        }),
        onPageBuilder: ((context, viewModel) {
          return Scaffold(
            appBar: AppBar(title: Text(LocaleKeys.generated_qr_view_gen_title.tr())),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  generateQrImage(),
                  ListTile(
                    contentPadding: AppPaddings.largeAllPadding,
                    leading: viewModel
                        .getQrAvatars(QrCodeOptionsEnum.values.firstWhere((element) => element.names == widget.qrType)),
                    title: Text(widget.qrDataForDisplay ?? 'NULL',
                        style: Theme.of(context).textTheme.headlineSmall, maxLines: 8, overflow: TextOverflow.fade),
                  ),
                  Observer(builder: (_) {
                    return viewModel.isQrLocal
                        ? const SizedBox.shrink()
                        : Text(LocaleKeys.generated_qr_view_saved_qr_info.tr(),
                            style: Theme.of(context).textTheme.bodyLarge);
                  }),
                  Observer(builder: (_) {
                    return Padding(
                      padding: AppPaddings.largeVerticalPadding,
                      child: ElevatedButton(
                          onPressed: !viewModel.isQrLocal
                              ? () => Navigator.pop(context)
                              : () async {
                                  if (viewModel.isQrLocal) {
                                    await viewModel.saveGeneratedQr(
                                        widget.qrData!, widget.qrDataForDisplay!, widget.qrType!);
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                      content: Text(
                                        LocaleKeys.generated_qr_view_saved_qr_info.tr(),
                                        textAlign: TextAlign.center,
                                      ),
                                      backgroundColor: Theme.of(context).colorScheme.error,
                                    ));
                                  }
                                },
                          child: viewModel.isLoading
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : viewModel.isQrLocal
                                  ? Text(LocaleKeys.generated_qr_view_save.tr())
                                  : Text(LocaleKeys.generated_qr_view_back.tr())),
                    );
                  })
                ],
              ),
            ),
          );
        }));
  }

  QrImage generateQrImageToSave() {
    return QrImage(
      data: widget.qrData ?? "null",
      size: 256,
    );
  }

  Widget generateQrImage() {
    return Padding(
      padding: AppPaddings.largeAllPadding,
      child: QrImage(
        data: widget.qrData ?? "null",
        size: 256,
      ),
    );
  }
}
