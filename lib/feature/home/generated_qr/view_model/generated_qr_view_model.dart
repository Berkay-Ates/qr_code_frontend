import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:qr_code/feature/home/generated_qr/model/generated_qr_save_model.dart';

import '../../../../core/base/view_model/base_view_model.dart';
import '../../../../core/constants/app/application_constants.dart';
import '../../../../product/enums/qr_code_options_enums.dart';

part 'generated_qr_view_model.g.dart';

class GeneratedQrViewModel = _GeneratedQrViewModelBase with _$GeneratedQrViewModel;

abstract class _GeneratedQrViewModelBase with Store, BaseViewModel {
  @observable
  var isLoading = false;
  @observable
  var isQrLocal = true;

  @override
  void setContext(BuildContext context) => baseContext = context;

  @override
  void init() {}

  @action
  Future<void> saveGeneratedQr(String qrData, String displayQrData, String qrType) async {
    final String token = 'Bearer ${userToken.getToken}';
    changeLoading();
    try {
      final response = await appService?.dio.post(
        ApplicationConstants.QR_SAVE_URL,
        options: Options(headers: {"Authorization": token}),
        data: GeneratedQrModel(qrData: qrData, displayQrData: displayQrData, qrScanGen: "generated", qrType: qrType)
            .toJson(),
      );
      if (response?.statusCode == HttpStatus.ok) {
        isQrLocal = false;
      }
    } on Exception {}
    changeLoading();
  }

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  @action
  Widget? getQrAvatars(QrCodeOptionsEnum qrType) {
    switch (qrType) {
      case QrCodeOptionsEnum.text:
        return const CircleAvatar(
            radius: 27,
            backgroundColor: Colors.green,
            child: Icon(Icons.paste_outlined, size: 32, color: Colors.white));
      case QrCodeOptionsEnum.contact:
        return const CircleAvatar(
            radius: 27,
            backgroundColor: Colors.deepOrange,
            child: Icon(Icons.contact_phone_outlined, size: 32, color: Colors.white));
      case QrCodeOptionsEnum.social:
        return const CircleAvatar(
            radius: 27,
            backgroundColor: Colors.blue,
            child: Icon(Icons.facebook_outlined, size: 32, color: Colors.white));
      case QrCodeOptionsEnum.url:
        return const CircleAvatar(
            radius: 27,
            backgroundColor: Colors.amber,
            child: Icon(FontAwesomeIcons.globe, size: 32, color: Colors.white));
      case QrCodeOptionsEnum.message:
        return const CircleAvatar(
            radius: 27,
            backgroundColor: Colors.purple,
            child: Icon(Icons.message_outlined, size: 32, color: Colors.white));
      case QrCodeOptionsEnum.location:
        return const CircleAvatar(
            radius: 27,
            backgroundColor: Colors.red,
            child: Icon(Icons.location_on_outlined, size: 32, color: Colors.white));
      case QrCodeOptionsEnum.email:
        return const CircleAvatar(
            radius: 27,
            backgroundColor: Colors.redAccent,
            child: Icon(Icons.mail_outline_outlined, size: 32, color: Colors.white));
      case QrCodeOptionsEnum.other:
        return const CircleAvatar(
            radius: 27,
            backgroundColor: Colors.orange,
            child: Icon(Icons.question_mark_outlined, size: 32, color: Colors.white));
    }
  }
}
