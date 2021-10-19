import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ze_gotinha/app/modules/class/fake_bd.dart';
import 'package:ze_gotinha/app/modules/class/vacina.dart';

part 'cartao_vacina_store.g.dart';

class CartaoVacinaStore = CartaoVacinaStoreBase with _$CartaoVacinaStore;

abstract class CartaoVacinaStoreBase with Store {
  @observable
  List<DataRow> dataRow = [
    const DataRow(cells: [
      DataCell(Text("nome")),
      DataCell(Text("dose")),
      DataCell(Text("data")),
      DataCell(Text("lote")),
    ])
  ];

  @action
  setDataRow(List<DataRow> d) {
    dataRow = d;
  }

  Future<List<Map<String, String>>?> getVacinas() async {
    final _bd = Modular.get<BD>(defaultValue: BD());
    //_bd.addVacina(); //*******************************lembrar que introduz linhas duplicadas //! eh para teste apenas */

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String cpf = prefs.getString("paciente")!;

    var _vacinas = _bd.getCartaoVacinas(cpf);
    if (_vacinas == null) {
      _bd.addVacina();
      _vacinas = _bd.getCartaoVacinas(cpf);
    }

    return _vacinas;
  }
}
