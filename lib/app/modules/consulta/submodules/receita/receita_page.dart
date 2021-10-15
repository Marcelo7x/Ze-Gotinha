import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

    List<Padding> medication = [
      Padding(
          padding: const EdgeInsets.only(left: 5),
          child: SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 20,
                  width: _width * .15,
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Text("Medicamento", style: TextStyle(fontSize: 18)),
                ),
                Container(
                  height: 20,
                  width: _width * .1,
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Text("Quantidade", style: TextStyle(fontSize: 18)),
                ),
                Container(
                  height: 20,
                  width: _width * .25,
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Text("Observações", style: TextStyle(fontSize: 18)),
                ),
              ],
            ),
          ))
    ];
    //medication.removeAt(0);

    _listMedicamentos() {
      medication.add(Padding(
        padding: const EdgeInsets.only(left: 5),
        child: SizedBox(
          width: _width * 59,
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                alignment: Alignment.center,
                height: 30,
                width: _width * .15,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.horizontal(
                        left: Radius.circular(16), right: Radius.circular(16)),
                    color: Colors.white,
                    border: Border.all(color: Colors.black)),
                child: Text(controller.medicamentos!.last["remedio"]!,
                    style: TextStyle(fontSize: 14)),
              ),
              Container(
                  height: 30,
                  width: _width * .1,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.horizontal(
                          left: Radius.circular(16),
                          right: Radius.circular(16)),
                      color: Colors.white,
                      border: Border.all(color: Colors.black)),
                  child: Text(controller.medicamentos!.last["quantidade"]!,
                      style: TextStyle(fontSize: 14))),
              Container(
                  height: 30,
                  width: _width * .25,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.horizontal(
                          left: Radius.circular(16),
                          right: Radius.circular(16)),
                      color: Colors.white,
                      border: Border.all(color: Colors.black)),
                  child: Text(controller.medicamentos!.last["observacao"]!,
                      style: TextStyle(fontSize: 14))),
            ],
          ),
        ),
      ));

      return controller.medicamentos == null ? [Container()] : medication;
    }

    return Container(
      height: _height * .74,
      width: _width * .59,
      padding: const EdgeInsets.fromLTRB(10, 30, 10, 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Gerar receita", style: TextStyle(fontSize: 20)),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Observer(builder: (_) {
                    return Container(
                        margin: const EdgeInsets.only(top: 20),
                        height: controller.listHeight,
                        width: _width * .55,
                        child: Observer(builder: (_) {
                          return Column(
                              children: controller.medicamentos == null
                                  ? [Container()]
                                  : _listMedicamentos());
                        }));
                  }),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                height: 70,
                width: _width * .55,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            //margin: const EdgeInsets.only(top: 20),
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
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.horizontal(
                                    left: Radius.circular(16),
                                    right: Radius.circular(16)),
                                color: Colors.white,
                                border: Border.all(color: Colors.black)),
                            child: TextField(
                                keyboardType: TextInputType.number,
                                controller: _qtd,
                                autofocus: true,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9]')),
                                ],
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
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
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
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 20),
                    child: elevatedButton(context, "Adicionar medicamento", () {
                      if (_remedio.text == "" ||
                          _qtd.text == "" ||
                          _obs.text == "") {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text(
                                "Todos os campos devem ser preenchidos. Tente novamente."),
                            actions: [
                              elevatedButton(context, "OK", () {
                                Navigator.pop(context);
                              }),
                            ],
                          ),
                        );
                      } else {
                        controller.setMedicamentos(
                            _remedio.text, _qtd.text, _obs.text);
                        _remedio.clear();
                        _qtd.clear();
                        _obs.clear();
                        controller.getlistHeight();
                      }
                    }),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  elevatedButton(context, "Finalizar", () {}),
                  elevatedButton(context, "Cancelar", () {
                    Modular.to.pushNamed("/home/medico/search/");
                  })
                ]),
          )
        ],
      ),
    );
  }
}
