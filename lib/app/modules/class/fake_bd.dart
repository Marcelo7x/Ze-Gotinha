import 'package:flutter/material.dart';
import 'package:ze_gotinha/app/modules/class/usuario.dart';

class BD {
  List<Usuario> _users = [
    Usuario("Carlos", "12345678901"),
    Usuario("Larissa", "09876543210"),
    Usuario("Marcelo", "12345098760"),
  ];

  List<Usuario> get usuarios => _users;

  List<Usuario>? searchUsers({String s = ""}) {
    if (s == "") {
      return _users;
    }

    List<Usuario>? list;
    _users.forEach((element) {
      print("${element.name} , ${s}");
      if (element.name.toLowerCase().compareTo(s.toLowerCase()) == 0 ||
          element.cpf.toLowerCase().compareTo(s.toLowerCase()) == 0) {
        list != null ? list?.add(element) : list = [element];
      }
    });
    
    if (list == null) {return _users;}

    return list;
  }
}
