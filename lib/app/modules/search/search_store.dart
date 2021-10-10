import 'package:mobx/mobx.dart';
import 'package:ze_gotinha/app/modules/class/pacientes.dart';

part 'search_store.g.dart';

class SearchStore = SearchStoreBase with _$SearchStore;

abstract class SearchStoreBase with Store {
  @observable
  String cpf = "";

  @action
  setCpf(n) {
     cpf = n;
  }

  getPacientes() {
    final List<Map<String, String>> pacientes = [
      {"name": "Carlos", "cpf": "1234567890"},
      {"name": "Larissa", "cpf": "0987654321"},
      {"name": "Marcelo", "cpf": "1234509876"}
    ];

    return pacientes;
  }


}
