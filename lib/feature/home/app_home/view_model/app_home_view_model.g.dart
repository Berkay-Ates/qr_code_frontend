// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppHomeViewModel on _AppHomeViewModelBase, Store {
  late final _$scannedQrCodesAtom =
      Atom(name: '_AppHomeViewModelBase.scannedQrCodes', context: context);

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

  late final _$pageIndexAtom =
      Atom(name: '_AppHomeViewModelBase.pageIndex', context: context);

  @override
  int get pageIndex {
    _$pageIndexAtom.reportRead();
    return super.pageIndex;
  }

  @override
  set pageIndex(int value) {
    _$pageIndexAtom.reportWrite(value, super.pageIndex, () {
      super.pageIndex = value;
    });
  }

  late final _$setLangAsyncAction =
      AsyncAction('_AppHomeViewModelBase.setLang', context: context);

  @override
  Future<void> setLang(bool value) {
    return _$setLangAsyncAction.run(() => super.setLang(value));
  }

  late final _$_AppHomeViewModelBaseActionController =
      ActionController(name: '_AppHomeViewModelBase', context: context);

  @override
  void chandePageIndex(int index) {
    final _$actionInfo = _$_AppHomeViewModelBaseActionController.startAction(
        name: '_AppHomeViewModelBase.chandePageIndex');
    try {
      return super.chandePageIndex(index);
    } finally {
      _$_AppHomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
scannedQrCodes: ${scannedQrCodes},
pageIndex: ${pageIndex}
    ''';
  }
}
