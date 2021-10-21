import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ze_gotinha/app/modules/class/fake_bd.dart';

part 'search_store.g.dart';

class SearchStore = SearchStoreBase with _$SearchStore;

abstract class SearchStoreBase with Store {
  String? user;
  
  @action
  getUser() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final user = await prefs.getString("user");
      this.user = user;
    }
  
  @observable
  String cpf = "";//paciente selecionado

  @action
  setCpf(n) {
    cpf = n;
  }

  @observable
   List<Map<String, String>>? pacientes = [];

  @action
  getPacientes({String s = ""}) {//gera lista de pacientes
    final _bd = Modular.get<BD>(defaultValue: BD());
    var _users = _bd.searchUsers(s: s);
    //var _users = users != null ? users : _bd.usuarios;

    List<Map<String, String>>? p;

    for (var element in _users!) {
      //print(element.cpf);
      p != null
          ? p.add({"name": element.name, "cpf": element.cpf})
          : p = [
              {"name": element.name, "cpf": element.cpf}
            ];
    }

    pacientes = p;
  }

  getViculacion(int crm) {//verifica o vinculo do medico e paciente
    final _bd = Modular.get<BD>(defaultValue: BD());
    var user = _bd.searchUsers(s: cpf);
    return user![0].getMedico(crm) == true ? true : false;
  }

  setmedicoVinculacion(int crm) {//faz vinculo de medico e paciente
    final _bd = Modular.get<BD>(defaultValue: BD());
    var user = _bd.searchUsers(s: cpf);
    user![0].addMedico(crm);
  }
}
