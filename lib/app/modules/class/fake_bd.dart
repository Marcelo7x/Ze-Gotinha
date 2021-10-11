import 'package:flutter/material.dart';
import 'package:ze_gotinha/app/modules/class/usuario.dart';

class BD {
  List<Usuario> _users = [
    Usuario("Calos", "12345678901"),
    Usuario("Larissa", "09876543210"),
    Usuario("Marcelo", "12345098760"),
  ];

  List<Usuario> get usuarios => _users;

  List<Usuario>? searchUsers({String? s}) {
    if (s == null) {
      return _users;
    }

    List<Usuario>? list;
    _users.forEach((element) {
      if (element.name.compareTo(s) == true ||
          element.cpf.compareTo(s) == true) {
        list != null ? list?.add(element) : list = [element];
      }
    });

    return list;
  }
}
