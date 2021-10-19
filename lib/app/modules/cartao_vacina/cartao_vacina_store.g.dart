// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cartao_vacina_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CartaoVacinaStore on CartaoVacinaStoreBase, Store {
  final _$dataRowAtom = Atom(name: 'CartaoVacinaStoreBase.dataRow');

  @override
  List<DataRow> get dataRow {
    _$dataRowAtom.reportRead();
    return super.dataRow;
  }

  @override
  set dataRow(List<DataRow> value) {
    _$dataRowAtom.reportWrite(value, super.dataRow, () {
      super.dataRow = value;
    });
  }

  final _$CartaoVacinaStoreBaseActionController =
      ActionController(name: 'CartaoVacinaStoreBase');

  @override
  dynamic setDataRow(List<DataRow> d) {
    final _$actionInfo = _$CartaoVacinaStoreBaseActionController.startAction(
        name: 'CartaoVacinaStoreBase.setDataRow');
    try {
      return super.setDataRow(d);
    } finally {
      _$CartaoVacinaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
dataRow: ${dataRow}
    ''';
  }
}
