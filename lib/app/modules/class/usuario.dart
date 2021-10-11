class Usuario {
  String _name = "";
  String _cpf = "";
  String _senha = "";
  String _email = "";
  String _telefone = "";
  DateTime _data = DateTime.now();
  String _sexo = "";

  void set name(String name) {
    _name = name;
  }

  void set cpf(String cpf) {
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

  void set email(String email) {
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

  void set telefone(String telefone) {
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

  void set data(DateTime data) {
    _data = data;
  }

  void set sexo(String sexo) {
    if (sexo != "masculino" || sexo != "feminino") {
      return;
    }
    _sexo = sexo;
  }

  String get name => _name;
  String get cpf => _cpf;
  String get senha => _senha;
  String get telefone => _telefone;
  String get email => _email;
  DateTime get data => _data;
  String get sexo => _sexo;

  Usuario(String name, String cpf) {
    this.name = name;
    this.cpf = cpf;
    print(this.name);
  }
}
