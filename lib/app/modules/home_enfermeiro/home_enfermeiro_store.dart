import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ze_gotinha/app/modules/class/fake_bd.dart';

part 'home_enfermeiro_store.g.dart';

class HomeEnfermeiroStore = HomeEnfermeiroStoreBase with _$HomeEnfermeiroStore;

abstract class HomeEnfermeiroStoreBase with Store implements Disposable {
  String? enfermeiro;

  @action
  getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final user = await prefs.getString("user");
    this.enfermeiro = user;
  }

  final pageViewController = PageController();

  @override
  void dispose() {
    pageViewController.dispose();
  }

  @action
  getPage(int index) {
    if (index == 0) {
      setQR(q: false);
    } else if (index == 1) {
      return Modular.to.pushNamed("./cartao_vacina/");
    } else if (index == 2) {
      return Modular.to.pushNamed("./consulta/");
    }
  }

  @observable
  int pageIndex = 0;

  @action
  setIndex(int i) {
    pageIndex = i;
  }

  @observable
  bool qr = false;

  @action
  setQR({bool? q}) {
    qr = q ?? !qr;
  }

  vinculo(int corem) async {

    final _bd = Modular.get<BD>(defaultValue: BD());
    var user = _bd.searchUsers(s: "12345678901");
    user![0].addEnfermeiro(corem);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("paciente", user[0].cpf);
                                
    await Future.delayed(const Duration(seconds: 2));
    return true;
  }
}
