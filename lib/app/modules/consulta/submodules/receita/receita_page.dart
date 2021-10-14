import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ze_gotinha/app/modules/consulta/submodules/receita/receita_store.dart';

class ReceitaPage extends StatefulWidget {
  final String title;
  const ReceitaPage({Key? key, this.title = "Receita"}) : super(key: key);

  @override
  _ReceitaPageState createState() => _ReceitaPageState();
}

class _ReceitaPageState extends ModularState<ReceitaPage, ReceitaStore> {
  Widget build(BuildContext context) {
    return Container(child: const Text("Gerar receita"));
  }
}
