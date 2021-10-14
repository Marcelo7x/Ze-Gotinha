import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ze_gotinha/app/modules/class/loggin.dart';
import 'package:ze_gotinha/app/modules/consulta/consulta_page.dart';
import 'package:ze_gotinha/app/modules/home/home_module.dart';
import 'package:ze_gotinha/app/modules/home/home_store.dart';
import 'package:ze_gotinha/app/modules/search/search_store.dart';
import 'package:ze_gotinha/app/modules/widgets/button.dart';

class SearchPage extends StatefulWidget {
  final String title;
  const SearchPage({Key? key, this.title = "Search"}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends ModularState<SearchPage, SearchStore> {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    final _searchController = TextEditingController();

    final Map _user = Modular.get(defaultValue: Loggin.loggin);

    var _pacientes = controller.getPacientes();
    _getDataRows() {
      List<DataRow> _dataRows = [
        DataRow(cells: <DataCell>[
          DataCell(Text("name")),
          DataCell(Text("cpf")),
        ])
      ];

      for (var i = 0; i < _pacientes.length; i++) {
        _dataRows.add(DataRow(
            selected: _pacientes[i]["cpf"] == controller.cpf,
            onSelectChanged: (s) {
              controller.setCpf(_pacientes[i]["cpf"]);
              //_getDataRows();
            },
            cells: <DataCell>[
              DataCell(Text(_pacientes[i]["name"]!)),
              DataCell(Text(_pacientes[i]["cpf"]!)),
            ]));
      }

      _dataRows.removeAt(0);
      return _dataRows;
    }

    return Container(
      //********************************************************* Search */
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: _width * .46,
            height: 50,
            margin: const EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.horizontal(
                    left: Radius.circular(16), right: Radius.circular(16)),
                color: Colors.white,
                border: Border.all(color: Colors.black)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: _width * .35,
                  height: 50,
                  padding: const EdgeInsets.only(left: 10),
                  child: TextField(
                      //login
                      controller: _searchController,
                      autofocus: true,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(Icons.person,
                              color: Theme.of(context).colorScheme.secondary),
                          hintText: "Digite o nome do Paciente"),
                      style: TextStyle(fontSize: 20)),
                ),
                Container(
                    //********************************************************* Search Button */
                    //margin: const EdgeInsets.only(top: 20),
                    width: _width * .1,
                    height: 50,
                    //decoration: BoxDecoration(
                    //borderRadius: BorderRadius.circular(20)),
                    child: elevatedButton(context, "Buscar Paciente", () {
                      _pacientes =
                          controller.getPacientes(s: _searchController.text);
                      controller.setCpf(""); //como isso atualiza a tabela
                      //_getDataRows();
                    })),
              ],
            ),
          ),
          SingleChildScrollView(
              child: SizedBox(
                  height: _height * .5,
                  width: _width * .45,
                  child: Observer(builder: (_) {
                    return DataTable(columns: const [
                      DataColumn(
                          label: Text("Nome",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold))),
                      DataColumn(
                          label: Text("CPF",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)))
                    ], rows: _getDataRows());
                  }))),
          Padding(
            //************************************************************ Solicitar Vinculo, Fazer consulta*/
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                    height: 35,
                    child: elevatedButton(context, "Solicitar Vinculo", () {
                      var v =
                          controller.getViculacion(int.parse(_user["user"]));//verifica se ja esta vinculado

                      if (!v && controller.cpf != "") {//faz vinculo
                        controller
                            .setmedicoVinculacion(int.parse(_user["user"]));
                      }

                      showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: v == true
                              ? Text("Você já está viculado a esste paciente.")
                              : controller.cpf != ""
                                  ? Text("Paciente Vinculado com Sucesso")
                                  : Text(
                                      "Você deve selecionar um paciente antes de solicitar um vinculo."),
                          actions: [
                            elevatedButton(context, "OK", () {
                              Navigator.pop(context);
                            }),
                          ],
                        ),
                      );
                    })),
                SizedBox(
                    height: 35,
                    child: elevatedButton(context, "Fazer Consulta", () {
                      final v =
                          controller.getViculacion(int.parse(_user["user"]));//verifica se esta vinculado
                      if (!v) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: controller.cpf == ""? Text("Selecione um Paciente para fazer a consulta e tente novamente.") : Text(
                                "Você não está vinculado a este paciente. \nSolicite o vinculo antes de prosseguir para a consulta."),
                            actions: [
                              elevatedButton(context, "OK", () {
                                Navigator.pop(context);
                              }),
                            ],
                          ),
                        );
                      } else {
                        Modular.to.pushNamed("/home/medico/consulta");                     
                      }
                    })),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
