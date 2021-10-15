import 'package:mobx/mobx.dart';

part 'receita_store.g.dart';

class ReceitaStore = ReceitaStoreBase with _$ReceitaStore;

abstract class ReceitaStoreBase with Store {
  @observable
  List<Map<String, String>>? medicamentos;

  @observable
  double? listHeight;

  @action
  setMedicamentos(String remedio, String quantidade, String observacao) {
    if (medicamentos == null) {
      medicamentos = [
        {"remedio": remedio, "quantidade": quantidade, "observacao": observacao}
      ];
    } else {
      medicamentos!.add({
        "remedio": remedio,
        "quantidade": quantidade,
        "observacao": observacao
      });
    }

    print(medicamentos!.length);
  }

  @action
  getlistHeight() {
    if (medicamentos == null) {
      listHeight = 30;
    } else {
      listHeight = 20 + medicamentos!.length * 60;
      print("list height ${listHeight}");
    }
  }
}
