import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ze_gotinha/app/modules/consulta/submodules/historico/historico_store.dart';

class HistoricoPage extends StatefulWidget {
  final String title;
  const HistoricoPage({Key? key, this.title = "Historico"}) : super(key: key);

  @override
  _HistoricoPageState createState() => _HistoricoPageState();
}

class _HistoricoPageState extends ModularState<HistoricoPage, HistoricoStore> {
  Widget build(BuildContext context) {
    return Container(child: const Text("Historico"));
  }
}