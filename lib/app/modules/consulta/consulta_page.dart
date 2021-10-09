import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ze_gotinha/app/modules/consulta/consulta_store.dart';

class ConsultaPage extends StatefulWidget {
  final String title;
  const ConsultaPage({Key? key, this.title = "Consulta"}) : super(key: key);

  @override
  _ConsultaPageState createState() => _ConsultaPageState();
}

class _ConsultaPageState extends ModularState<ConsultaPage, ConsultaStore> {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return Container(child:Text("Consulta"));
  }
}
