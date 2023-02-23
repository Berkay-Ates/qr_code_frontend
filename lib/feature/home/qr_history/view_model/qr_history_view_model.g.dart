// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_history_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$QrHistoryViewModel on _QrHistoryViewModelBase, Store {
  late final _$scannedQrCodesAtom =
      Atom(name: '_QrHistoryViewModelBase.scannedQrCodes', context: context);

  @override
  GeneratedScannedQRModels? get scannedQrCodes {
    _$scannedQrCodesAtom.reportRead();
    return super.scannedQrCodes;
  }

  @override
  set scannedQrCodes(GeneratedScannedQRModels? value) {
    _$scannedQrCodesAtom.reportWrite(value, super.scannedQrCodes, () {
      super.scannedQrCodes = value;
    });
  }

  late final _$generatedQrCodesAtom =
      Atom(name: '_QrHistoryViewModelBase.generatedQrCodes', context: context);

  @override
  GeneratedScannedQRModels? get generatedQrCodes {
    _$generatedQrCodesAtom.reportRead();
    return super.generatedQrCodes;
  }

  @override
  set generatedQrCodes(GeneratedScannedQRModels? value) {
    _$generatedQrCodesAtom.reportWrite(value, super.generatedQrCodes, () {
      super.generatedQrCodes = value;
    });
  }

  late final _$getUserGeneratedQrCodesAsyncAction = AsyncAction(
      '_QrHistoryViewModelBase.getUserGeneratedQrCodes',
      context: context);

  @override
  Future<void> getUserGeneratedQrCodes() {
    return _$getUserGeneratedQrCodesAsyncAction
        .run(() => super.getUserGeneratedQrCodes());
  }

  late final _$getUserScannedQrCodesAsyncAction = AsyncAction(
      '_QrHistoryViewModelBase.getUserScannedQrCodes',
      context: context);

  @override
  Future<void> getUserScannedQrCodes() {
    return _$getUserScannedQrCodesAsyncAction
        .run(() => super.getUserScannedQrCodes());
  }

  late final _$_QrHistoryViewModelBaseActionController =
      ActionController(name: '_QrHistoryViewModelBase', context: context);

  @override
  IconData? getQrAvatar(QrCodeOptionsEnum qrType) {
    final _$actionInfo = _$_QrHistoryViewModelBaseActionController.startAction(
        name: '_QrHistoryViewModelBase.getQrAvatar');
    try {
      return super.getQrAvatar(qrType);
    } finally {
      _$_QrHistoryViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Widget? getQrAvatars(QrCodeOptionsEnum qrType) {
    final _$actionInfo = _$_QrHistoryViewModelBaseActionController.startAction(
        name: '_QrHistoryViewModelBase.getQrAvatars');
    try {
      return super.getQrAvatars(qrType);
    } finally {
      _$_QrHistoryViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
scannedQrCodes: ${scannedQrCodes},
generatedQrCodes: ${generatedQrCodes}
    ''';
  }
}
