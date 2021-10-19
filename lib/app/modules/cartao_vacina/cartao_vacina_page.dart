import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ze_gotinha/app/modules/cartao_vacina/cartao_vacina_store.dart';
import 'package:ze_gotinha/app/modules/class/vacina.dart';
import 'package:ze_gotinha/app/modules/widgets/button.dart';

class CartaoVacinaPage extends StatefulWidget {
  final String title;
  const CartaoVacinaPage({Key? key, this.title = "CataoVacina"})
      : super(key: key);

  @override
  _CartaoVacinaPageState createState() => _CartaoVacinaPageState();
}

class _CartaoVacinaPageState
    extends ModularState<CartaoVacinaPage, CartaoVacinaStore> {
  Widget build(BuildContext context) {
    _getDataRows() async {
      List<Map<String, String>>? _consultas;
      _consultas = await controller.getVacinas();

      if (_consultas == null) {
        return;
      }

      List<DataRow> _dataRows = [
        const DataRow(cells: <DataCell>[
          DataCell(Text("nome")),
          DataCell(Text("dose")),
          DataCell(Text("data")),
          DataCell(Text("lote")),
        ])
      ];

      for (var i = 0; i < _consultas.length; i++) {
        _dataRows.add(
          DataRow(
            cells: <DataCell>[
              DataCell(
                Text(_consultas[i]["vacina"]!),
              ),
              DataCell(
                Text(_consultas[i]["dose"]!),
              ),
              DataCell(
                Text(_consultas[i]["data"]!),
              ),
              DataCell(
                Text(_consultas[i]["lote"]!),
              ),
            ],
          ),
        );
      }

      _dataRows.removeAt(0);

      controller.setDataRow(_dataRows);
    }

    _getDataRows();

    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return Container(
        child: Column(
      children: [
        SingleChildScrollView(
          child: SizedBox(
            height: _height * .5,
            width: _width * .45,
            child: Observer(builder: (_) {
              return DataTable(columns: const [
                DataColumn(
                  label: Text(
                    "Nome",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    "Dose",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    "Data",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    "Lote",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ], rows: controller.dataRow);
            }),
          ),
        ),
      ],
    ));
  }
}
