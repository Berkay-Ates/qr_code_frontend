// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_generate_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$QrGenerateViewModel on _QrGenerateViewModelBase, Store {
  Computed<List<QrGenerateModel>>? _$QRmodelsComputed;

  @override
  List<QrGenerateModel> get QRmodels => (_$QRmodelsComputed ??=
          Computed<List<QrGenerateModel>>(() => super.QRmodels,
              name: '_QrGenerateViewModelBase.QRmodels'))
      .value;

  late final _$selectedIndexAtom =
      Atom(name: '_QrGenerateViewModelBase.selectedIndex', context: context);

  @override
  int get selectedIndex {
    _$selectedIndexAtom.reportRead();
    return super.selectedIndex;
  }

  @override
  set selectedIndex(int value) {
    _$selectedIndexAtom.reportWrite(value, super.selectedIndex, () {
      super.selectedIndex = value;
    });
  }

  late final _$qrCodeOptionsEnumAtom = Atom(
      name: '_QrGenerateViewModelBase.qrCodeOptionsEnum', context: context);

  @override
  QrCodeOptionsEnum get qrCodeOptionsEnum {
    _$qrCodeOptionsEnumAtom.reportRead();
    return super.qrCodeOptionsEnum;
  }

  @override
  set qrCodeOptionsEnum(QrCodeOptionsEnum value) {
    _$qrCodeOptionsEnumAtom.reportWrite(value, super.qrCodeOptionsEnum, () {
      super.qrCodeOptionsEnum = value;
    });
  }

  late final _$_QrGenerateViewModelBaseActionController =
      ActionController(name: '_QrGenerateViewModelBase', context: context);

  @override
  void setSelectedIndex(int index) {
    final _$actionInfo = _$_QrGenerateViewModelBaseActionController.startAction(
        name: '_QrGenerateViewModelBase.setSelectedIndex');
    try {
      return super.setSelectedIndex(index);
    } finally {
      _$_QrGenerateViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedIndex: ${selectedIndex},
qrCodeOptionsEnum: ${qrCodeOptionsEnum},
QRmodels: ${QRmodels}
    ''';
  }
}
