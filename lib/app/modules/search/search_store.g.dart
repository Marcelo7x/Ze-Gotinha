// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SearchStore on SearchStoreBase, Store {
  final _$cpfAtom = Atom(name: 'SearchStoreBase.cpf');

  @override
  String get cpf {
    _$cpfAtom.reportRead();
    return super.cpf;
  }

  @override
  set cpf(String value) {
    _$cpfAtom.reportWrite(value, super.cpf, () {
      super.cpf = value;
    });
  }

  final _$pacientesAtom = Atom(name: 'SearchStoreBase.pacientes');

  @override
  List<Map<String, String>>? get pacientes {
    _$pacientesAtom.reportRead();
    return super.pacientes;
  }

  @override
  set pacientes(List<Map<String, String>>? value) {
    _$pacientesAtom.reportWrite(value, super.pacientes, () {
      super.pacientes = value;
    });
  }

  final _$getUserAsyncAction = AsyncAction('SearchStoreBase.getUser');

  @override
  Future getUser() {
    return _$getUserAsyncAction.run(() => super.getUser());
  }

  final _$SearchStoreBaseActionController =
      ActionController(name: 'SearchStoreBase');

  @override
  dynamic setCpf(dynamic n) {
    final _$actionInfo = _$SearchStoreBaseActionController.startAction(
        name: 'SearchStoreBase.setCpf');
    try {
      return super.setCpf(n);
    } finally {
      _$SearchStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getPacientes({String s = ""}) {
    final _$actionInfo = _$SearchStoreBaseActionController.startAction(
        name: 'SearchStoreBase.getPacientes');
    try {
      return super.getPacientes(s: s);
    } finally {
      _$SearchStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cpf: ${cpf},
pacientes: ${pacientes}
    ''';
  }
}
