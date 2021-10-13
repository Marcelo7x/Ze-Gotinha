import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  //@observable
  //String page = "";

  @observable
  Widget page = Card();

  @action
  setpage(Widget pg) { //seta a paginha que fica dentro do quando branco na HOME
    page = pg;
  }
}
