import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store implements Disposable {
  final pageViewController = PageController();

  @override
  void dispose() {
    pageViewController.dispose();
  }

  @action
  getPage(int index) {
    if (index == 0) {
      return Modular.to.pushNamed("/home/search/");
    } else if (index == 1) {
      return Modular.to.pushNamed("/home/cartao_vacina/");
    } else if (index == 2) {
      return Modular.to.pushNamed("/home/consulta/");
    }
  }

  @observable
  int pageIndex = 0;

  @action
  setIndex(int i) {
    pageIndex = i;
  }

}
