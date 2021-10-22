import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ze_gotinha/app/modules/class/Enfermeiro.dart';
import 'package:ze_gotinha/app/modules/class/fake_bd.dart';
import 'package:ze_gotinha/app/modules/class/loggin.dart';
import 'package:ze_gotinha/app/modules/class/medico.dart';
import 'package:ze_gotinha/app/modules/class/usuario.dart';

part 'login_store.g.dart';

class LoginStore = LoginStoreBase with _$LoginStore;

abstract class LoginStoreBase with Store {
  @observable
  bool logginError = false;

  @observable
  String username = "";

  @observable
  String password = "";

  Medico? medico;
  Enfermeiro? enfermeiro;

  @action
  setUserPassword(String u, String p) {
    //tratamento do da username e senha da tela de login
    print(u);
    print(p);
    username = u;
    password = p;
  }

  @action
  Future<bool> login() async {
    //faz o login
    if (await loginMedico()) {
      return true;
    } else if (await loginEnfermeiro()) {
      return true;
    }
    //TODO: fazer login do paciente e enfermeira
    return !logginError;
  }

  Future<bool> loginMedico() async {
    //tenta fazer login do medico //TODO:fazer do enfermeiro e usuario tambem
    final _bd = Modular.get<BD>(defaultValue: BD());
    medico = _bd.searchMedico(int.parse(username));

    if (medico != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('user', "${medico!.crm}");
      prefs.setString('type', "medico");

      Modular.get(defaultValue: Loggin.setLoggin(medico: medico));
      return true;
    }
    return false;
  }

  Future<bool> loginEnfermeiro() async {
    final _bd = Modular.get<BD>(defaultValue: BD());
    enfermeiro = _bd.searchEnfermeiro(int.parse(username));

    if (enfermeiro != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('user', "${enfermeiro!.corem}");
      prefs.setString('type', "enfermeiro");

      Modular.get(defaultValue: Loggin.setLoggin(enfermeiro: enfermeiro));
      return true;
    }
    return false;
  }
}
