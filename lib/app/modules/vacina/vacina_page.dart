import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ze_gotinha/app/modules/home/home_store.dart';
import 'package:ze_gotinha/app/modules/home_enfermeiro/home_enfermeiro_store.dart';
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

    getUser() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final user = prefs.getString("type");
      //final user = Modular.get(defaultValue: Loggin.loggin);
      return user;
    }

    //List<String>? _vacinas = controller.getVacinas();
    _setVacina(String vacina) {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text(vacina),
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
                        left: Radius.circular(16), right: Radius.circular(16)),
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
                          color: Theme.of(context).colorScheme.onSecondary),
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
                        left: Radius.circular(16), right: Radius.circular(16)),
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
                          color: Theme.of(context).colorScheme.onSecondary),
                    ),
                    style: const TextStyle(fontSize: 14)),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10),
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                height: 60,
                width: _width * .1,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.horizontal(
                        left: Radius.circular(16), right: Radius.circular(16)),
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
                          color: Theme.of(context).colorScheme.onSecondary),
                    ),
                    style: const TextStyle(fontSize: 14)),
              )
            ]),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                elevatedButton(
                    context,
                    const Text("Cancelar",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )), () {
                  Navigator.pop(context);
                }),
                elevatedButton(
                    context,
                    const Text("Vacinar",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )), () {
                  controller.setVacina(
                      vacina, _dose.text, _data.text, _lote.text);
                  Navigator.pop(context);
                  _popup(context, "Aplicação cadastrada com sucesso");
                }),
              ],
            ),
          ],
        ),
      );
    }

    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                GestureDetector(
                    onTap: () async {
                      if (await getUser() == "enfermeiro") {
                        Modular.get(defaultValue: HomeEnfermeiroStore())
                            .setIndex(0);
                      } else if (await getUser() == "medico") {
                        Modular.get(defaultValue: HomeStore()).setIndex(0);
                      }
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back)),
                const Text("voltar"),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            height: 60,
            child: elevatedButton(context, const Text("Ver vacinas aplicadas"),
                () async {
              //Modular.get(defaultValue: HomeEnfermeiroStore()).setIndex(1);
              if (await getUser() == "medico") {
                Modular.to.pushNamed("/home/cartao_vacina/");
              } else {
                Modular.to.pushNamed("/home-enfermeiro/cartao/");
              }

            }),
          ),
          Container(
            //********************************************************** Search */
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
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                    //********************************************************* Search Button */
                    //margin: const EdgeInsets.only(top: 20),
                    width: _width * .1,
                    height: 50,
                    //decoration: BoxDecoration(
                    //borderRadius: BorderRadius.circular(20)),
                    child: elevatedButton(
                        context,
                        const Text("Buscar Vacina",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            )), () {
                      controller.getVacinas(s: _searchController.text);
                      if (controller.vacina == null) {
                        _popup(
                            context, "A vacina não foi encontrada.\nVerifique o nome e tente novamente.");
                      }
                    })),
              ],
            ),
          ),
          SingleChildScrollView(
            child: SizedBox(
              height: _height * .5,
              width: _width * .45,
              child: Column(
                children: [
                  Observer(builder: (_) {
                    return Container(
                      height: _height * .5,
                      width: _width * .45,
                      padding: const EdgeInsets.only(top: 20),
                      child: SingleChildScrollView(
                        child: DataTable(
                            showCheckboxColumn: false,
                            columns: const [
                              DataColumn(
                                label: Text(
                                  "Nome da Vacina",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                            rows: controller.vacina != null
                                ? controller.vacina!
                                    .map(
                                      (vacina) => DataRow(
                                          onSelectChanged: (s) async {
                                            _setVacina(vacina);
                                          },
                                          cells: <DataCell>[
                                            DataCell(Text(vacina))
                                          ]),
                                    )
                                    .toList()
                                : [
                                    const DataRow(
                                      cells: [
                                        DataCell(
                                          Text("-----"),
                                        ),
                                      ],
                                    ),
                                  ]),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

_popup(BuildContext context, String msg) {
  return showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text(msg),
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
