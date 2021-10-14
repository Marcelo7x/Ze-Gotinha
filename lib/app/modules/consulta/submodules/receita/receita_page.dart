import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ze_gotinha/app/modules/consulta/submodules/receita/receita_store.dart';
import 'package:ze_gotinha/app/modules/widgets/button.dart';

class ReceitaPage extends StatefulWidget {
  final String title;
  const ReceitaPage({Key? key, this.title = "Receita"}) : super(key: key);

  @override
  _ReceitaPageState createState() => _ReceitaPageState();
}

class _ReceitaPageState extends ModularState<ReceitaPage, ReceitaStore> {
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    final _remedio = TextEditingController();
    final _qtd = TextEditingController();
    final _obs = TextEditingController();

    List<Padding>? medication;
    _listMedicamentos() {
          print("akii");
      if (medication == null && controller.medicamentos != null) {
        for (var element in controller.medicamentos!) {
          medication = [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: SizedBox(
                width: 100,
                height: 60,
                child: Row(
                  children: [
                    Text(element["remedio"]!),
                    Text(element["quantidade"]!),
                    Text(element["observacao"]!),
                  ],
                ),
              ),
            )
          ];
        }
      } else {
        for (var element in controller.medicamentos!) {
          medication!.add(Padding(
            padding: const EdgeInsets.only(left: 20),
            child: SizedBox(
              width: 100,
              height: 60,
              child: Row(
                children: [
                  Text(element["remedio"]!),
                  Text(element["quantidade"]!),
                  Text(element["observacao"]!),
                ],
              ),
            ),
          ));
        }
      }

      return controller.medicamentos == null ? [Container()] : medication;
    }

    return Container(
      height: _height * .74,
      width: _width * .59,
      child: Column(
        children: [
          Text("Gerar receita", style: TextStyle(fontSize: 20)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Builder(
                  builder: (context) => SizedBox(
                        height: controller.medicamentos == null
                            ? 60
                            : 60 +
                                (60 *
                                    controller.medicamentos!.length
                                        .roundToDouble()),
                        width: _width * .55,
                        child: ListView(children: [
                          Observer(builder: (_) {
                            return SizedBox(
                                height: controller.medicamentos == null
                                    ? 2
                                    : 60 *
                                        controller.medicamentos!.length
                                            .roundToDouble(),
                                width: _width * .55,
                                child: Observer(builder: (_) {
                                  return ListView(
                                      scrollDirection: Axis.vertical,
                                      children: controller.medicamentos == null
                                          ? [
                                              Container(
                                                child: Text("data"),
                                              )
                                            ]
                                          : _listMedicamentos()!);
                                }));
                          }),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                //margin: const EdgeInsets.only(top: 20),
                                padding:
                                    const EdgeInsets.fromLTRB(10, 0, 10, 0),
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
                                    controller: _remedio,
                                    autofocus: true,
                                    decoration: InputDecoration(
                                      labelText: "Medicamento",
                                      border: InputBorder.none,
                                      icon: Icon(Icons.medication,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSecondary),
                                    ),
                                    style: TextStyle(fontSize: 14)),
                              ),
                              Container(
                                height: 60,
                                width: _width * .1,
                                //margin: const EdgeInsets.only(top: 20),
                                padding:
                                    const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.horizontal(
                                        left: Radius.circular(16),
                                        right: Radius.circular(16)),
                                    color: Colors.white,
                                    border: Border.all(color: Colors.black)),
                                child: TextField(
                                    //login
                                    controller: _qtd,
                                    autofocus: true,
                                    decoration: const InputDecoration(
                                      labelText: "Quantidade",
                                      border: InputBorder.none,
                                    ),
                                    style: TextStyle(fontSize: 14)),
                              ),
                              Container(
                                height: 60,
                                width: _width * .25,
                                //margin: const EdgeInsets.only(top: 20),
                                padding:
                                    const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.horizontal(
                                        left: Radius.circular(16),
                                        right: Radius.circular(16)),
                                    color: Colors.white,
                                    border: Border.all(color: Colors.black)),
                                child: TextField(
                                    //login
                                    controller: _obs,
                                    autofocus: true,
                                    decoration: InputDecoration(
                                      labelText: "Observações",
                                      border: InputBorder.none,
                                    ),
                                    style: TextStyle(fontSize: 14)),
                              ),
                            ],
                          ),
                        ]),
                      ))
            ],
          ),
          elevatedButton(context, "Adicionar medicamnto", () {
            controller.setMedicamentos(_remedio.text, _qtd.text, _obs.text);
            _remedio.clear();
            _qtd.clear();
            _obs.clear();
          }),
        ],
      ),
    );
  }
}
