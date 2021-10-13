//import 'package:flutter/material.dart';
import 'package:ze_gotinha/app/modules/class/Enfermeiro.dart';
import 'package:ze_gotinha/app/modules/class/medico.dart';
import 'package:ze_gotinha/app/modules/class/usuario.dart';

class BD { //* Simula o banco de dados do projeto para fins de teste
  final List<Usuario> _users = [
    Usuario("Carlos", "12345678901"),
    Usuario("Larissa", "09876543210"),
    Usuario("Marcelo", "12345098760"),
  ];

  final List<Medico> _medicos = [Medico(1), Medico(2), Medico(3)];

  final List<Enfermeiro> _enfermeiros = [
    Enfermeiro(1),
    Enfermeiro(2),
    Enfermeiro(3)
  ];

  List<Usuario> get usuarios => _users;
  List<Medico> get medicos => _medicos;
  List<Enfermeiro> get enfermeiros => _enfermeiros;

  List<Usuario>? searchUsers({String s = ""}) {
    if (s == "") {
      return _users;
    }

    List<Usuario>? list;
    for (var element in _users) {
      if (element.name.toLowerCase().compareTo(s.toLowerCase()) == 0 ||
          element.cpf.toLowerCase().compareTo(s.toLowerCase()) == 0) {
        list != null ? list.add(element) : list = [element];
      }
    }

    if (list == null) {
      return _users;
    }

    return list;
  }

  Medico? searchMedico(int crm) {
    for (var element in _medicos) {
      if (element.crm == crm) {
        return element;
      }
    }
    return null;
  }

  Enfermeiro? searchEnfermeiro(int corem) {
    for (var element in _enfermeiros) {
      if (element.corem == corem) {
        return element;
      }
    }
    return null;
  }
}
