import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../../../core/base/view_model/base_view_model.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../../../core/constants/app/application_constants.dart';
import '../../../../product/paddings/app_paddings.dart';
import '../../generated_qr/model/generated_qr_save_model.dart';

part 'qr_scan_view_model.g.dart';

class QrCodeScanViewModel = _QrCodeScanViewModelBase with _$QrCodeScanViewModel;

abstract class _QrCodeScanViewModelBase with Store, BaseViewModel {
  @observable
  GlobalKey qrKey = GlobalKey(debugLabel: "QR");

  @observable
  Barcode? result;

  @observable
  var isLoading = false;
  @observable
  var isQrLocal = true;

  @observable
  QRViewController? controller;

  @observable
  var isBottomSheet = false;

  @override
  void setContext(BuildContext context) => baseContext = context;

  @override
  void init() {}

  @action
  void onQrViewCreated(QRViewController qrController) {
    controller = qrController;
    controller?.scannedDataStream.listen((event) {
      result = event;
    });
  }

  @action
  Future<void> saveGeneratedQr(String qrData, String displayQrData, String qrType) async {
    final String token = 'Bearer ${userToken.getToken}';
    changeLoading();
    final response = await appService?.dio.post(
      ApplicationConstants.QR_SAVE_URL,
      options: Options(headers: {"Authorization": token}),
      data:
          GeneratedQrModel(qrData: qrData, displayQrData: displayQrData, qrScanGen: "scanned", qrType: qrType).toJson(),
    );
    if (response?.statusCode == HttpStatus.ok) {
      isQrLocal = false;
    }
    changeLoading();
  }

  @action
  Future<dynamic> showCustomModalBottomSheet() {
    return showModalBottomSheet(
        context: baseContext,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(18))),
        builder: ((context) => Padding(
              padding: AppPaddings.mediumVerticalPadding,
              child: Column(
                children: [
                  Container(color: Theme.of(context).colorScheme.primary, height: 4, width: 120),
                  QrImage(data: result?.code ?? "no data", size: 200),
                  Text(result?.code ?? "no data"),
                  Text(" barcode type is ${describeEnum(result!.format)}")
                ],
              ),
            )));
  }

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }
}
