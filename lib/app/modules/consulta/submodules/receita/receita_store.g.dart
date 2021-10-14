// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receita_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ReceitaStore on ReceitaStoreBase, Store {
  final _$medicamentosAtom = Atom(name: 'ReceitaStoreBase.medicamentos');

  @override
  List<Map<String, String>>? get medicamentos {
    _$medicamentosAtom.reportRead();
    return super.medicamentos;
  }

  @override
  set medicamentos(List<Map<String, String>>? value) {
    _$medicamentosAtom.reportWrite(value, super.medicamentos, () {
      super.medicamentos = value;
    });
  }

  final _$ReceitaStoreBaseActionController =
      ActionController(name: 'ReceitaStoreBase');

  @override
  dynamic setMedicamentos(
      String remedio, String quantidade, String observacao) {
    final _$actionInfo = _$ReceitaStoreBaseActionController.startAction(
        name: 'ReceitaStoreBase.setMedicamentos');
    try {
      return super.setMedicamentos(remedio, quantidade, observacao);
    } finally {
      _$ReceitaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
medicamentos: ${medicamentos}
    ''';
  }
}
