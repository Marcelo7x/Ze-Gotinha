// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vacina_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$VacinaStore on VacinaStoreBase, Store {
  final _$vacinaAtom = Atom(name: 'VacinaStoreBase.vacina');

  @override
  List<String>? get vacina {
    _$vacinaAtom.reportRead();
    return super.vacina;
  }

  @override
  set vacina(List<String>? value) {
    _$vacinaAtom.reportWrite(value, super.vacina, () {
      super.vacina = value;
    });
  }

  final _$setVacinaAsyncAction = AsyncAction('VacinaStoreBase.setVacina');

  @override
  Future setVacina(String vacina, String dose, String data, String lote) {
    return _$setVacinaAsyncAction
        .run(() => super.setVacina(vacina, dose, data, lote));
  }

  @override
  String toString() {
    return '''
vacina: ${vacina}
    ''';
  }
}
