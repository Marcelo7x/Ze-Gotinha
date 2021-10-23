// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_enfermeiro_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeEnfermeiroStore on HomeEnfermeiroStoreBase, Store {
  final _$pageIndexAtom = Atom(name: 'HomeEnfermeiroStoreBase.pageIndex');

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

  final _$qrAtom = Atom(name: 'HomeEnfermeiroStoreBase.qr');

  @override
  bool get qr {
    _$qrAtom.reportRead();
    return super.qr;
  }

  @override
  set qr(bool value) {
    _$qrAtom.reportWrite(value, super.qr, () {
      super.qr = value;
    });
  }

  final _$getUserAsyncAction = AsyncAction('HomeEnfermeiroStoreBase.getUser');

  @override
  Future getUser() {
    return _$getUserAsyncAction.run(() => super.getUser());
  }

  final _$HomeEnfermeiroStoreBaseActionController =
      ActionController(name: 'HomeEnfermeiroStoreBase');

  @override
  dynamic getPage(int index) {
    final _$actionInfo = _$HomeEnfermeiroStoreBaseActionController.startAction(
        name: 'HomeEnfermeiroStoreBase.getPage');
    try {
      return super.getPage(index);
    } finally {
      _$HomeEnfermeiroStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setIndex(int i) {
    final _$actionInfo = _$HomeEnfermeiroStoreBaseActionController.startAction(
        name: 'HomeEnfermeiroStoreBase.setIndex');
    try {
      return super.setIndex(i);
    } finally {
      _$HomeEnfermeiroStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setQR({bool? q}) {
    final _$actionInfo = _$HomeEnfermeiroStoreBaseActionController.startAction(
        name: 'HomeEnfermeiroStoreBase.setQR');
    try {
      return super.setQR(q: q);
    } finally {
      _$HomeEnfermeiroStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pageIndex: ${pageIndex},
qr: ${qr}
    ''';
  }
}
