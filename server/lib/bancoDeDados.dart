import 'package:postgres/postgres.dart';

class BD {
  static PostgreSQLConnection? _bd;

  static createConnection() async {
    print('Criando conexao...');

    var connection = PostgreSQLConnection("localhost", 5432, "zegotinha",
        username: "postgres", password: "kelum");

    await connection.open();
    _bd = connection;
  }

  static PostgreSQLConnection? get bd => _bd;
}
