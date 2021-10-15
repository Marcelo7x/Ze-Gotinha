import 'package:flutter_modular/flutter_modular.dart';
import 'package:ze_gotinha/app/modules/class/Enfermeiro.dart';
import 'package:ze_gotinha/app/modules/class/fake_bd.dart';
import 'package:ze_gotinha/app/modules/class/medico.dart';

class Usuario {
  String _name = "";
  String _cpf = "";
  String _senha = "";
  String _email = "";
  String _telefone = "";
  DateTime _data = DateTime.now();
  String _sexo = "";

  List<Medico>? _medicos = [];
  List<Enfermeiro>? _enfermeiros = [];
  List<Map<String, String>>? _history;

  set name(String name) {
    _name = name;
  }

  set cpf(String cpf) {
    if (cpf.length != 11) {
      return;
    }

    final numericRegularExpression =
        RegExp(r'^-?(([0-9]*)|(([0-9]*)\.([0-9]*)))$');
    if (numericRegularExpression.hasMatch(cpf) == true) {
      _cpf = cpf;
    } else {
      print("cpf invalido");
    }
    _cpf = cpf;
  }

  set email(String email) {
    if (email.length < 5) {
      print("email invalido");
      return;
    }
    if (!email.contains("@")) {
      print("email invalido");
      return;
    }
    _email = email;
  }

  set telefone(String telefone) {
    if (telefone.length < 8) {
      return;
    }

    final numericRegularExpression =
        RegExp(r'^-?(([0-9]*)|(([0-9]*)\.([0-9]*)))$');
    if (numericRegularExpression.hasMatch(telefone) == true) {
      _telefone = telefone;
    } else {
      print("telefone invalido");
    }
  }

  set data(DateTime data) {
    _data = data;
  }

  set sexo(String sexo) {
    if (sexo != "masculino" || sexo != "feminino") {
      return;
    }
    _sexo = sexo;
  }

  void addMedico(int crm) {
    final bd = Modular.get<BD>(defaultValue: BD());
    final medico = bd.searchMedico(crm);

    if (medico == null) {
      return;
    }
    if (_medicos != null) {
      _medicos?.add(medico);
    } else {
      _medicos = [medico];
    }
    //print(_medicos);
  }

  void addEnfermeiro(int corem) {
    final bd = Modular.get<BD>(defaultValue: BD());
    final enfermeiro = bd.searchEnfermeiro(corem);

    if (enfermeiro != null) {
      return;
    }
    if (_enfermeiros != null) {
      _enfermeiros?.add(enfermeiro!);
    } else {
      _enfermeiros = [enfermeiro!];
    }
  }

  void addHistory(String data, String sintomas, String medicamentos) {
    _history == null
        ? _history = [
            {"data": data, "sintomas": sintomas, "medicamentos": medicamentos}
          ]
        : _history!.add(
            {"data": data, "sintomas": sintomas, "medicamentos": medicamentos});
  }

  String get name => _name;
  String get cpf => _cpf;
  String get senha => _senha;
  String get telefone => _telefone;
  String get email => _email;
  DateTime get data => _data;
  String get sexo => _sexo;

  bool getMedico(int crm) {
    if (_medicos == null) {
      return false;
    }

    for (var element in _medicos!) {
      if (element.crm == crm) return true;
    }
    return false;
  }

  bool getEnfermeiro(int corem) {
    if (_enfermeiros == null) {
      return false;
    }
    for (var element in _enfermeiros!) {
      if (element.corem == corem) return true;
    }
    return false;
  }

  get history => _history;

  Usuario(String name, String cpf) {
    this.name = name;
    this.cpf = cpf;
    //print(this.name);
  }
}
