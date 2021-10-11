import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:ze_gotinha/app/modules/class/fake_bd.dart';
import 'package:ze_gotinha/app/modules/class/usuario.dart';

part 'search_store.g.dart';

class SearchStore = SearchStoreBase with _$SearchStore;

abstract class SearchStoreBase with Store {
  @observable
  String cpf = "";

  @action
  setCpf(n) {
    cpf = n;
  }

  getPacientes({String s = ""}) {
    final _bd = Modular.get<BD>(defaultValue: BD());
    var _users = _bd.searchUsers(s: s);
    //var _users = users != null ? users : _bd.usuarios;

    List<Map<String, String>>? pacientes;

    for (var element in _users!) {
      print(element.cpf);
      pacientes != null
          ? pacientes.add({"name": element.name, "cpf": element.cpf})
          : pacientes = [
              {"name": element.name, "cpf": element.cpf}
            ];
    }

    return pacientes;
  }
}
