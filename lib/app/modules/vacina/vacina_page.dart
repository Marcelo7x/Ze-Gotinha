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

    var _vacinas = controller.getVacina();
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
      child: SingleChildScrollView(
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
    );
  }
}
