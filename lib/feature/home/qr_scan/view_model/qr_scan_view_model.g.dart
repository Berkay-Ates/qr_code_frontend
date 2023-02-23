// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_scan_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$QrCodeScanViewModel on _QrCodeScanViewModelBase, Store {
  late final _$qrKeyAtom =
      Atom(name: '_QrCodeScanViewModelBase.qrKey', context: context);

  @override
  GlobalKey<State<StatefulWidget>> get qrKey {
    _$qrKeyAtom.reportRead();
    return super.qrKey;
  }

  @override
  set qrKey(GlobalKey<State<StatefulWidget>> value) {
    _$qrKeyAtom.reportWrite(value, super.qrKey, () {
      super.qrKey = value;
    });
  }

  late final _$resultAtom =
      Atom(name: '_QrCodeScanViewModelBase.result', context: context);

  @override
  Barcode? get result {
    _$resultAtom.reportRead();
    return super.result;
  }

  @override
  set result(Barcode? value) {
    _$resultAtom.reportWrite(value, super.result, () {
      super.result = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_QrCodeScanViewModelBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$isQrLocalAtom =
      Atom(name: '_QrCodeScanViewModelBase.isQrLocal', context: context);

  @override
  bool get isQrLocal {
    _$isQrLocalAtom.reportRead();
    return super.isQrLocal;
  }

  @override
  set isQrLocal(bool value) {
    _$isQrLocalAtom.reportWrite(value, super.isQrLocal, () {
      super.isQrLocal = value;
    });
  }

  late final _$controllerAtom =
      Atom(name: '_QrCodeScanViewModelBase.controller', context: context);

  @override
  QRViewController? get controller {
    _$controllerAtom.reportRead();
    return super.controller;
  }

  @override
  set controller(QRViewController? value) {
    _$controllerAtom.reportWrite(value, super.controller, () {
      super.controller = value;
    });
  }

  late final _$isBottomSheetAtom =
      Atom(name: '_QrCodeScanViewModelBase.isBottomSheet', context: context);

  @override
  bool get isBottomSheet {
    _$isBottomSheetAtom.reportRead();
    return super.isBottomSheet;
  }

  @override
  set isBottomSheet(bool value) {
    _$isBottomSheetAtom.reportWrite(value, super.isBottomSheet, () {
      super.isBottomSheet = value;
    });
  }

  late final _$saveGeneratedQrAsyncAction =
      AsyncAction('_QrCodeScanViewModelBase.saveGeneratedQr', context: context);

  @override
  Future<void> saveGeneratedQr(
      String qrData, String displayQrData, String qrType) {
    return _$saveGeneratedQrAsyncAction
        .run(() => super.saveGeneratedQr(qrData, displayQrData, qrType));
  }

  late final _$_QrCodeScanViewModelBaseActionController =
      ActionController(name: '_QrCodeScanViewModelBase', context: context);

  @override
  void onQrViewCreated(QRViewController qrController) {
    final _$actionInfo = _$_QrCodeScanViewModelBaseActionController.startAction(
        name: '_QrCodeScanViewModelBase.onQrViewCreated');
    try {
      return super.onQrViewCreated(qrController);
    } finally {
      _$_QrCodeScanViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> showCustomModalBottomSheet() {
    final _$actionInfo = _$_QrCodeScanViewModelBaseActionController.startAction(
        name: '_QrCodeScanViewModelBase.showCustomModalBottomSheet');
    try {
      return super.showCustomModalBottomSheet();
    } finally {
      _$_QrCodeScanViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeLoading() {
    final _$actionInfo = _$_QrCodeScanViewModelBaseActionController.startAction(
        name: '_QrCodeScanViewModelBase.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$_QrCodeScanViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
qrKey: ${qrKey},
result: ${result},
isLoading: ${isLoading},
isQrLocal: ${isQrLocal},
controller: ${controller},
isBottomSheet: ${isBottomSheet}
    ''';
  }
}
