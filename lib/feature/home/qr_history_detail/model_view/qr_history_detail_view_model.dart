import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:qr_code/core/constants/app/application_constants.dart';
import 'package:qr_code/core/init/network/service/network_sercice.dart';

import '../../../../core/base/view_model/base_view_model.dart';
import '../../../../product/enums/qr_code_options_enums.dart';

part 'qr_history_detail_view_model.g.dart';

class QrHistoryDetailViewModel = _QrHistoryDetailViewModelBase with _$QrHistoryDetailViewModel;

abstract class _QrHistoryDetailViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => baseContext = context;

  @observable
  bool isLoading = false;

  @observable
  bool isQrDeleted = false;

  @action
  Future<void> deleteQr(String idDelete) async {
    final String token = 'Bearer ${userToken.getToken}';

    changeLoading();
    try {
      print("${ApplicationConstants.QR_DELETE_URL}$idDelete");
      final response = await AppServiceInstance.instance?.dio.delete(
        "${ApplicationConstants.QR_DELETE_URL}$idDelete",
        options: Options(headers: {"Authorization": token}),
      );
      if (response?.statusCode == HttpStatus.ok) {
        isQrDeleted = true;
      }
    } catch (e) {
      print(e);
    }

    changeLoading();
  }

  void changeLoading() {
    isLoading = !isLoading;
  }

  @override
  void init() {}

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
