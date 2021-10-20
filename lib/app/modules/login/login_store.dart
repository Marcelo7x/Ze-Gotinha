import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ze_gotinha/app/modules/class/Enfermeiro.dart';
import 'package:ze_gotinha/app/modules/class/fake_bd.dart';
import 'package:ze_gotinha/app/modules/class/medico.dart';
import 'package:ze_gotinha/app/modules/class/usuario.dart';
import 'package:http/http.dart' as http;

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

  @action
  setUserPassword(String u, String p) {
    username = u;
    password = p;
  }

  @action
  Future<bool> login() async {
    //faz o login
    if (await loginMedico()) {
      return true;
    }
    //TODO: fazer login do paciente e enfermeira
    logginError = true;
    return false;
  }

  Future<bool> loginMedico() async {
    //tenta fazer login do medico //TODO:fazer do enfermeiro e usuario tambem
    var result = await http.get(Uri.parse(
        "http://127.0.0.1:8080/get-medico/$username/")); //56782-ES crm valido

    List medico = json.decode(result.body);

    if (medico.length > 0) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('user', "${medico.first["medico"]["crm"]}");
      prefs.setString('type', "medico");

      return true;
    }

    return false;
  }

  // Enfermeiro loginEnfermeiro() {}
}
