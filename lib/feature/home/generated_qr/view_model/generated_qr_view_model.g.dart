// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generated_qr_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GeneratedQrViewModel on _GeneratedQrViewModelBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_GeneratedQrViewModelBase.isLoading', context: context);

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
      Atom(name: '_GeneratedQrViewModelBase.isQrLocal', context: context);

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

  late final _$saveGeneratedQrAsyncAction = AsyncAction(
      '_GeneratedQrViewModelBase.saveGeneratedQr',
      context: context);

  @override
  Future<void> saveGeneratedQr(
      String qrData, String displayQrData, String qrType) {
    return _$saveGeneratedQrAsyncAction
        .run(() => super.saveGeneratedQr(qrData, displayQrData, qrType));
  }

  late final _$_GeneratedQrViewModelBaseActionController =
      ActionController(name: '_GeneratedQrViewModelBase', context: context);

  @override
  void changeLoading() {
    final _$actionInfo = _$_GeneratedQrViewModelBaseActionController
        .startAction(name: '_GeneratedQrViewModelBase.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$_GeneratedQrViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Widget? getQrAvatars(QrCodeOptionsEnum qrType) {
    final _$actionInfo = _$_GeneratedQrViewModelBaseActionController
        .startAction(name: '_GeneratedQrViewModelBase.getQrAvatars');
    try {
      return super.getQrAvatars(qrType);
    } finally {
      _$_GeneratedQrViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isQrLocal: ${isQrLocal}
    ''';
  }
}
