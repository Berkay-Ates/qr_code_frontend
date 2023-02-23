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

  late final _$isloadingAtom =
      Atom(name: '_QrGenerateViewModelBase.isloading', context: context);

  @override
  bool get isloading {
    _$isloadingAtom.reportRead();
    return super.isloading;
  }

  @override
  set isloading(bool value) {
    _$isloadingAtom.reportWrite(value, super.isloading, () {
      super.isloading = value;
    });
  }

  late final _$socialMediaEnumsAtom =
      Atom(name: '_QrGenerateViewModelBase.socialMediaEnums', context: context);

  @override
  SocialMediaEnums get socialMediaEnums {
    _$socialMediaEnumsAtom.reportRead();
    return super.socialMediaEnums;
  }

  @override
  set socialMediaEnums(SocialMediaEnums value) {
    _$socialMediaEnumsAtom.reportWrite(value, super.socialMediaEnums, () {
      super.socialMediaEnums = value;
    });
  }

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

  late final _$model1Atom =
      Atom(name: '_QrGenerateViewModelBase.model1', context: context);

  @override
  QrGenerateModel get model1 {
    _$model1Atom.reportRead();
    return super.model1;
  }

  @override
  set model1(QrGenerateModel value) {
    _$model1Atom.reportWrite(value, super.model1, () {
      super.model1 = value;
    });
  }

  late final _$model2Atom =
      Atom(name: '_QrGenerateViewModelBase.model2', context: context);

  @override
  QrGenerateModel get model2 {
    _$model2Atom.reportRead();
    return super.model2;
  }

  @override
  set model2(QrGenerateModel value) {
    _$model2Atom.reportWrite(value, super.model2, () {
      super.model2 = value;
    });
  }

  late final _$model3Atom =
      Atom(name: '_QrGenerateViewModelBase.model3', context: context);

  @override
  QrGenerateModel get model3 {
    _$model3Atom.reportRead();
    return super.model3;
  }

  @override
  set model3(QrGenerateModel value) {
    _$model3Atom.reportWrite(value, super.model3, () {
      super.model3 = value;
    });
  }

  late final _$model4Atom =
      Atom(name: '_QrGenerateViewModelBase.model4', context: context);

  @override
  QrGenerateModel get model4 {
    _$model4Atom.reportRead();
    return super.model4;
  }

  @override
  set model4(QrGenerateModel value) {
    _$model4Atom.reportWrite(value, super.model4, () {
      super.model4 = value;
    });
  }

  late final _$model5Atom =
      Atom(name: '_QrGenerateViewModelBase.model5', context: context);

  @override
  QrGenerateModel get model5 {
    _$model5Atom.reportRead();
    return super.model5;
  }

  @override
  set model5(QrGenerateModel value) {
    _$model5Atom.reportWrite(value, super.model5, () {
      super.model5 = value;
    });
  }

  late final _$model6Atom =
      Atom(name: '_QrGenerateViewModelBase.model6', context: context);

  @override
  QrGenerateModel get model6 {
    _$model6Atom.reportRead();
    return super.model6;
  }

  @override
  set model6(QrGenerateModel value) {
    _$model6Atom.reportWrite(value, super.model6, () {
      super.model6 = value;
    });
  }

  late final _$model7Atom =
      Atom(name: '_QrGenerateViewModelBase.model7', context: context);

  @override
  QrGenerateModel get model7 {
    _$model7Atom.reportRead();
    return super.model7;
  }

  @override
  set model7(QrGenerateModel value) {
    _$model7Atom.reportWrite(value, super.model7, () {
      super.model7 = value;
    });
  }

  late final _$model8Atom =
      Atom(name: '_QrGenerateViewModelBase.model8', context: context);

  @override
  QrGenerateModel get model8 {
    _$model8Atom.reportRead();
    return super.model8;
  }

  @override
  set model8(QrGenerateModel value) {
    _$model8Atom.reportWrite(value, super.model8, () {
      super.model8 = value;
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
  void changeLoading() {
    final _$actionInfo = _$_QrGenerateViewModelBaseActionController.startAction(
        name: '_QrGenerateViewModelBase.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$_QrGenerateViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void navigateAndBuildQR() {
    final _$actionInfo = _$_QrGenerateViewModelBaseActionController.startAction(
        name: '_QrGenerateViewModelBase.navigateAndBuildQR');
    try {
      return super.navigateAndBuildQR();
    } finally {
      _$_QrGenerateViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeSocialEnum(SocialMediaEnums socialEnum) {
    final _$actionInfo = _$_QrGenerateViewModelBaseActionController.startAction(
        name: '_QrGenerateViewModelBase.changeSocialEnum');
    try {
      return super.changeSocialEnum(socialEnum);
    } finally {
      _$_QrGenerateViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isloading: ${isloading},
socialMediaEnums: ${socialMediaEnums},
selectedIndex: ${selectedIndex},
qrCodeOptionsEnum: ${qrCodeOptionsEnum},
model1: ${model1},
model2: ${model2},
model3: ${model3},
model4: ${model4},
model5: ${model5},
model6: ${model6},
model7: ${model7},
model8: ${model8},
QRmodels: ${QRmodels}
    ''';
  }
}
