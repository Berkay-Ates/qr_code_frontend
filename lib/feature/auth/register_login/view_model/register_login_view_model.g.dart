// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_login_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegisterLoginViewModel on _RegisterLoginViewModelBase, Store {
  late final _$isloginPageAtom =
      Atom(name: '_RegisterLoginViewModelBase.isloginPage', context: context);

  @override
  bool get isloginPage {
    _$isloginPageAtom.reportRead();
    return super.isloginPage;
  }

  @override
  set isloginPage(bool value) {
    _$isloginPageAtom.reportWrite(value, super.isloginPage, () {
      super.isloginPage = value;
    });
  }

  late final _$pageIndexAtom =
      Atom(name: '_RegisterLoginViewModelBase.pageIndex', context: context);

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

  late final _$isloadingAtom =
      Atom(name: '_RegisterLoginViewModelBase.isloading', context: context);

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

  late final _$islockAtom =
      Atom(name: '_RegisterLoginViewModelBase.islock', context: context);

  @override
  bool get islock {
    _$islockAtom.reportRead();
    return super.islock;
  }

  @override
  set islock(bool value) {
    _$islockAtom.reportWrite(value, super.islock, () {
      super.islock = value;
    });
  }

  late final _$loginUserAsyncAction =
      AsyncAction('_RegisterLoginViewModelBase.loginUser', context: context);

  @override
  Future<void> loginUser() {
    return _$loginUserAsyncAction.run(() => super.loginUser());
  }

  late final _$registerUserAsyncAction =
      AsyncAction('_RegisterLoginViewModelBase.registerUser', context: context);

  @override
  Future<void> registerUser() {
    return _$registerUserAsyncAction.run(() => super.registerUser());
  }

  late final _$_RegisterLoginViewModelBaseActionController =
      ActionController(name: '_RegisterLoginViewModelBase', context: context);

  @override
  void changeLoading() {
    final _$actionInfo = _$_RegisterLoginViewModelBaseActionController
        .startAction(name: '_RegisterLoginViewModelBase.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$_RegisterLoginViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeVisibility() {
    final _$actionInfo = _$_RegisterLoginViewModelBaseActionController
        .startAction(name: '_RegisterLoginViewModelBase.changeVisibility');
    try {
      return super.changeVisibility();
    } finally {
      _$_RegisterLoginViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changePage(int index) {
    final _$actionInfo = _$_RegisterLoginViewModelBaseActionController
        .startAction(name: '_RegisterLoginViewModelBase.changePage');
    try {
      return super.changePage(index);
    } finally {
      _$_RegisterLoginViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isloginPage: ${isloginPage},
pageIndex: ${pageIndex},
isloading: ${isloading},
islock: ${islock}
    ''';
  }
}
