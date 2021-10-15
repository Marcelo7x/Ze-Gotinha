import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ze_gotinha/app/modules/class/fake_bd.dart';

part 'historico_store.g.dart';

class HistoricoStore = HistoricoStoreBase with _$HistoricoStore;

abstract class HistoricoStoreBase with Store {
  Future<List<Map<String, String>>?> getHistory() async {
    final _bd = Modular.get<BD>(defaultValue: BD());
    _bd.addHistory();//*******************************lembrar que introduz linhas duplicadas //! eh para teste apenas */

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String cpf = prefs.getString("paciente")!;

    var _history = _bd.getHistory(cpf);
    //var _history = history != null ? history : _bd.usuarios;

    return _history;
  }
}
