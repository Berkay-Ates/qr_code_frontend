import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:qr_code/core/init/lang/locale_keys.g.dart';
import 'package:qr_code/product/enums/qr_code_options_enums.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../product/paddings/app_paddings.dart';
import '../view_model/qr_scan_view_model.dart';

class QrCodeScanView extends StatefulWidget {
  const QrCodeScanView({super.key});

  @override
  State<QrCodeScanView> createState() => _QrCodeScanViewState();
}

class _QrCodeScanViewState extends State<QrCodeScanView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<QrCodeScanViewModel>(
      viewModel: QrCodeScanViewModel(),
      onModelReady: ((QrCodeScanViewModel viewModel) {
        viewModel.setContext(context);
        viewModel.init();
      }),
      onPageBuilder: ((context, viewModel) {
        return Scaffold(
          body: Column(
            children: [
              Expanded(
                  flex: 6,
                  child: Stack(alignment: Alignment.bottomCenter, children: [
                    Observer(builder: (_) {
                      return QRView(
                          key: viewModel.qrKey,
                          onQRViewCreated: (p0) async {
                            viewModel.onQrViewCreated(p0);
                          });
                    }),
                    Positioned(
                      bottom: 32,
                      child: IconButton(
                          onPressed: () async {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: const Text(
                                "You will be able to choose qr images from gallery ASAP",
                                textAlign: TextAlign.center,
                              ),
                              backgroundColor: Theme.of(context).colorScheme.error,
                            ));
                          },
                          icon: Icon(
                            Icons.image_outlined,
                            color: Theme.of(context).colorScheme.onSurface,
                            size: 36,
                          )),
                    ),
                  ])),
              Observer(builder: (_) {
                return Expanded(
                    flex: 3,
                    child: viewModel.result == null
                        ? Center(
                            child: Text(
                              LocaleKeys.scan_qr_scanning.tr(),
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          )
                        : Center(
                            child: TextButton(
                                onPressed: () {
                                  showCustomModalBottomSheet(viewModel);
                                },
                                child: Text(LocaleKeys.scan_qr_top_to_show.tr())),
                          ));
              })
            ],
          ),
        );
      }),
      onDispose: (viewModel) {
        viewModel.controller?.dispose();
      },
    );
  }

  Future<dynamic> showCustomModalBottomSheet(QrCodeScanViewModel viewModel) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(18))),
        builder: ((context) => Padding(
              padding: AppPaddings.largeVerticalPadding,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(color: Theme.of(context).colorScheme.primary, height: 4, width: 120),
                  QrImage(data: viewModel.result?.code ?? "no data", size: 200),
                  Padding(
                    padding: AppPaddings.mediumVerticalPadding,
                    child: Text(viewModel.result?.code ?? "no data", style: Theme.of(context).textTheme.headline6),
                  ),
                  Text(LocaleKeys.scan_qr_info_text.tr(),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                            color: Theme.of(context).colorScheme.error,
                          )),
                  Padding(
                    padding: AppPaddings.mediumVerticalPadding,
                    child: ElevatedButton(
                        onPressed: () => Navigator.pop(context), child: Text(LocaleKeys.generated_qr_view_back.tr())),
                  )
                  // buildScannedQrSaveButton(viewModel, context)
                ],
              ),
            )));
  }

  Observer buildScannedQrSaveButton(QrCodeScanViewModel viewModel, BuildContext context) {
    return Observer(builder: (_) {
      return ElevatedButton(
          onPressed: !viewModel.isQrLocal
              ? () => Navigator.pop(context)
              : () async {
                  if (viewModel.isQrLocal) {
                    await viewModel.saveGeneratedQr(
                        viewModel.result?.code ?? "", viewModel.result?.code ?? "", QrCodeOptionsEnum.other.names);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: const Text(
                          "You have been saved this qr code already",
                          textAlign: TextAlign.center,
                        ),
                        backgroundColor: Theme.of(context).colorScheme.error));
                  }
                },
          child: viewModel.isLoading
              ? const CircularProgressIndicator(
                  color: Colors.white,
                )
              : viewModel.isQrLocal
                  ? const Text("Save")
                  : const Text("Back"));
    });
  }
}
