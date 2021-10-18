import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ze_gotinha/app/modules/class/fake_bd.dart';
import 'package:ze_gotinha/app/modules/class/vacina.dart';

part 'vacina_store.g.dart';

class VacinaStore = VacinaStoreBase with _$VacinaStore;

abstract class VacinaStoreBase with Store {
  @observable
  String vacina = ""; //paciente selecionado

  @action
  setVacina(String vacina, String dose, String data, String lote) async {
    Vacina v = Vacina(vacina);

    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? userName = prefs.getString("paciente");
    final _bd = Modular.get<BD>(defaultValue: BD());
    var user = _bd.searchUsers(s: userName!);
    if (user == null) {
      return;
    }

    user.first.addVacina(v, dose, data, lote);
    print(user.first.cartaoVacina);
  }

  getVacina({String s = ""}) {
    //gera lista de vacinas
    final _bd = Modular.get<BD>(defaultValue: BD());
    var _vacina = _bd.vacina;

    List<String>? vacinas;

    for (var element in _vacina!) {
      //print(element.cpf);
      vacinas != null ? vacinas.add(element.nome) : vacinas = [element.nome];
    }

    return vacinas;
  }
}
