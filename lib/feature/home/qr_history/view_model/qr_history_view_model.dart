import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/view_model/base_view_model.dart';
import '../../../../core/constants/app/application_constants.dart';
import '../../../../product/enums/qr_code_options_enums.dart';
import '../model/gen_scan_qr_models.dart';

part 'qr_history_view_model.g.dart';

class QrHistoryViewModel = _QrHistoryViewModelBase with _$QrHistoryViewModel;

abstract class _QrHistoryViewModelBase with Store, BaseViewModel {
  TabController? tabController;

  @observable
  GeneratedScannedQRModels? scannedQrCodes;
  @override
  void setContext(BuildContext context) => baseContext = context;

  @override
  void init() {
    getUserQrCodes();
  }

  @action
  Future<void> getUserQrCodes() async {
    final String token = 'Bearer ${userToken.getToken}';
    final response = await appService?.dio.get(
      ApplicationConstants.USER_ALL_QR_CODES,
      options: Options(headers: {"Authorization": token}),
    );

    final data = response?.data;

    if (data is Map<String, dynamic>) {
      scannedQrCodes = GeneratedScannedQRModels.fromJson(response?.data);
    }
  }

  @action
  IconData? getQrAvatar(QrCodeOptionsEnum qrType) {
    switch (qrType) {
      case QrCodeOptionsEnum.text:
        return Icons.paste_outlined;
      case QrCodeOptionsEnum.contact:
        return Icons.contact_phone_outlined;
      case QrCodeOptionsEnum.social:
        return Icons.contact_phone_outlined;
      case QrCodeOptionsEnum.url:
        return FontAwesomeIcons.globe;
      case QrCodeOptionsEnum.message:
        return Icons.message_outlined;
      case QrCodeOptionsEnum.location:
        return Icons.location_on_outlined;
      case QrCodeOptionsEnum.email:
        return Icons.mail_outline_outlined;
      case QrCodeOptionsEnum.other:
        return Icons.question_mark_outlined;
    }
  }

  @action
  Widget? getQrAvatars(QrCodeOptionsEnum qrType) {
    switch (qrType) {
      case QrCodeOptionsEnum.text:
        return const CircleAvatar(
            backgroundColor: Colors.green, child: Icon(Icons.paste_outlined, size: 32, color: Colors.white));
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
