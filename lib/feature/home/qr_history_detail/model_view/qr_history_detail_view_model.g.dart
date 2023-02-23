// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_history_detail_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$QrHistoryDetailViewModel on _QrHistoryDetailViewModelBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_QrHistoryDetailViewModelBase.isLoading', context: context);

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

  late final _$isQrDeletedAtom =
      Atom(name: '_QrHistoryDetailViewModelBase.isQrDeleted', context: context);

  @override
  bool get isQrDeleted {
    _$isQrDeletedAtom.reportRead();
    return super.isQrDeleted;
  }

  @override
  set isQrDeleted(bool value) {
    _$isQrDeletedAtom.reportWrite(value, super.isQrDeleted, () {
      super.isQrDeleted = value;
    });
  }

  late final _$deleteQrAsyncAction =
      AsyncAction('_QrHistoryDetailViewModelBase.deleteQr', context: context);

  @override
  Future<void> deleteQr(String idDelete) {
    return _$deleteQrAsyncAction.run(() => super.deleteQr(idDelete));
  }

  late final _$_QrHistoryDetailViewModelBaseActionController =
      ActionController(name: '_QrHistoryDetailViewModelBase', context: context);

  @override
  Widget? getQrAvatars(QrCodeOptionsEnum qrType) {
    final _$actionInfo = _$_QrHistoryDetailViewModelBaseActionController
        .startAction(name: '_QrHistoryDetailViewModelBase.getQrAvatars');
    try {
      return super.getQrAvatars(qrType);
    } finally {
      _$_QrHistoryDetailViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isQrDeleted: ${isQrDeleted}
    ''';
  }
}
