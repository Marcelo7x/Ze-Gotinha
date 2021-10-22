import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ze_gotinha/app/modules/consulta/submodules/historico/historico_store.dart';
import 'package:ze_gotinha/app/modules/widgets/button.dart';

class HistoricoPage extends StatefulWidget {
  final String title;
  const HistoricoPage({Key? key, this.title = "Historico"}) : super(key: key);

  @override
  _HistoricoPageState createState() => _HistoricoPageState();
}

class _HistoricoPageState extends ModularState<HistoricoPage, HistoricoStore> {
  List<Map<String, String>>? _consultas;
  List<DataRow>? dataRow = [
    const DataRow(
        cells: [DataCell(Text("")), DataCell(Text("")), DataCell(Text(""))])
  ];

  _popup(Map<String, String> list) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: SizedBox(
          height: MediaQuery.of(context).size.height * .5,
          width: MediaQuery.of(context).size.width * .5,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Sintomas",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text(list["sintomas"]!, style: const TextStyle(fontSize: 14)),
                  const Text("\nMedicamentos",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text(list["medicamentos"]!,
                      style: const TextStyle(fontSize: 14)),
                ],
              ),
            ),
          ),
        ),
        actions: [
          elevatedButton(
              context,
              const Text("OK",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )), () {
            Navigator.pop(context);
          }),
        ],
      ),
    );
  }

  _getDataRows() async {
    _consultas = await controller.getHistory();

    if (_consultas == null) {
      return;
    }

    List<DataRow> _dataRows = [
      const DataRow(cells: <DataCell>[
        DataCell(Text("data")),
        DataCell(Text("sintomas")),
        DataCell(Text("medicamentos")),
      ])
    ];

    for (var i = 0; i < _consultas!.length; i++) {
      _dataRows.add(DataRow(cells: <DataCell>[
        DataCell(Text(_consultas![i]["data"]!),
            onTap: () => _popup(_consultas![i])),
        DataCell(Text(_consultas![i]["sintomas"]!),
            onTap: () => _popup(_consultas![i])),
        DataCell(Text(_consultas![i]["medicamentos"]!),
            onTap: () => _popup(_consultas![i])),
      ]));
    }

    _dataRows.removeAt(0);
    if (dataRow == _dataRows) return;
    dataRow = _dataRows;

    setState(() {
      dataRow;
    });
  }

  @override
  void initState() {
    super.initState();
    _getDataRows();
  }

  @override
  void dispose() {
    dataRow!.clear();
    super.dispose();
  }

  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return Container(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              GestureDetector(
                  onTap: () => Modular.to.pushNamed("/home/consulta/"),
                  child: Icon(Icons.arrow_back)),
              Text("voltar"),
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
                        label: Text("Data",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text("Sintomas",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text("Medicamentos",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold))),
                  ], rows: dataRow!);
                }))),
      ],
    ));
  }
}
