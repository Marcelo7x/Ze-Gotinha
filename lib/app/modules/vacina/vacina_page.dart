import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ze_gotinha/app/modules/vacina/vacina_store.dart';
import 'package:ze_gotinha/app/modules/widgets/button.dart';

class VacinaPage extends StatefulWidget {
  final String title;
  const VacinaPage({Key? key, this.title = "Vacina"}) : super(key: key);

  @override
  _VacinaPageState createState() => _VacinaPageState();
}

class _VacinaPageState extends ModularState<VacinaPage, VacinaStore> {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    final _data = TextEditingController();
    final _lote = TextEditingController();
    final _dose = TextEditingController();
    final _searchController = TextEditingController();

    var _vacinas = controller.getVacinas();
    _getDataRows() {
      List<DataRow> _dataRows = [
        const DataRow(cells: <DataCell>[
          DataCell(Text("nome")),
          //DataCell(Text("cpf")),
        ])
      ];

      for (var i = 0; i < _vacinas.length; i++) {
        _dataRows.add(DataRow(cells: <DataCell>[
          DataCell(Text(_vacinas[i]!), onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: Text(_vacinas[i]),
                content: Container(
                  width: _width * .4,
                  height: _height * .2,
                  child: Row(children: [
                    Container(
                      //margin: const EdgeInsets.only(top: 20),
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      height: 60,
                      width: _width * .1,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.horizontal(
                              left: Radius.circular(16),
                              right: Radius.circular(16)),
                          color: Colors.white,
                          border: Border.all(color: Colors.black)),
                      child: TextField(
                          //login
                          controller: _dose,
                          autofocus: true,
                          decoration: InputDecoration(
                            labelText: "Dose",
                            border: InputBorder.none,
                            icon: Icon(Icons.medication,
                                color:
                                    Theme.of(context).colorScheme.onSecondary),
                          ),
                          style: TextStyle(fontSize: 14)),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      height: 60,
                      width: _width * .15,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.horizontal(
                              left: Radius.circular(16),
                              right: Radius.circular(16)),
                          color: Colors.white,
                          border: Border.all(color: Colors.black)),
                      child: TextField(
                          //login
                          controller: _data,
                          autofocus: true,
                          decoration: InputDecoration(
                            labelText: "Data",
                            border: InputBorder.none,
                            icon: Icon(Icons.medication,
                                color:
                                    Theme.of(context).colorScheme.onSecondary),
                          ),
                          style: TextStyle(fontSize: 14)),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      height: 60,
                      width: _width * .1,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.horizontal(
                              left: Radius.circular(16),
                              right: Radius.circular(16)),
                          color: Colors.white,
                          border: Border.all(color: Colors.black)),
                      child: TextField(
                          //login
                          controller: _lote,
                          autofocus: true,
                          decoration: InputDecoration(
                            labelText: "Lote",
                            border: InputBorder.none,
                            icon: Icon(Icons.medication,
                                color:
                                    Theme.of(context).colorScheme.onSecondary),
                          ),
                          style: TextStyle(fontSize: 14)),
                    )
                  ]),
                ),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      elevatedButton(context, "Cancelar", () {
                        Navigator.pop(context);
                      }),
                      elevatedButton(context, "Vacinar", () {
                        controller.setVacina(_vacinas[i], _dose.text, _data.text, _lote.text);
                        Navigator.pop(context);
                      }),
                    ],
                  ),
                ],
              ),
            );
          }),
        ]));
      }

      _dataRows.removeAt(0);
      return _dataRows;
    }

    return Container(
      child: Column(
        children: [
          Container(//********************************************************** Search */
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
                          hintText: "Digite o nome da vacina"),
                      style: TextStyle(fontSize: 20),),
                ),
                Container(
                    //********************************************************* Search Button */
                    //margin: const EdgeInsets.only(top: 20),
                    width: _width * .1,
                    height: 50,
                    //decoration: BoxDecoration(
                    //borderRadius: BorderRadius.circular(20)),
                    child: elevatedButton(context, "Buscar Vacina", () {
                      _vacinas =
                          controller.getVacinas(s: _searchController.text);
                      //controller.setVacina(""); //como isso atualiza a tabela
                      _getDataRows();
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
                ], rows: _getDataRows());
              }),
            ),
          ),
        ],
      ),
    );
  }
}
