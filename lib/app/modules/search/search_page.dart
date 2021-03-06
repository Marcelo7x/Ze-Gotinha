import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

    controller.getUser();

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
                        hintText: "Digite o nome do paciente"),
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                    //********************************************************* Search Button */
                    width: _width * .1,
                    height: 50,
                    child: elevatedButton(
                        context,
                        const Text("Buscar Paciente",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            )), () {
                      controller.getPacientes(s: _searchController.text);
                      controller.setCpf(""); //como isso atualiza a tabela
                      if (controller.pacientes == null) {
                        _popup(context,
                            "Paciente n??o encontrado.\nVerifique o nome e tente novamente.");
                      }
                    })),
              ],
            ),
          ),
          SingleChildScrollView(
            child: SizedBox(
              height: _height * .5,
              width: _width * .45,
              child: Observer(
                builder: (_) {
                  return DataTable(
                    showCheckboxColumn: false,
                    columns: const [
                      DataColumn(
                          label: Text("Nome",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold))),
                      DataColumn(
                          label: Text("CPF",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)))
                    ],
                    rows: controller.pacientes != null
                        ? controller.pacientes!.map((paciente) {
                            return DataRow(
                                selected: paciente["cpf"] == controller.cpf,
                                color: MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                    if (states
                                        .contains(MaterialState.selected)) {
                                      return Theme.of(context)
                                          .colorScheme
                                          .background
                                          .withOpacity(0.4);
                                    } else {
                                      return Theme.of(context)
                                          .colorScheme
                                          .surface;
                                    } // Use the component's default.
                                  },
                                ),
                                onSelectChanged: (s) async {
                                  controller.setCpf(paciente["cpf"]);
                                  SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  prefs.setString("paciente", paciente["cpf"]!);
                                },
                                cells: <DataCell>[
                                  DataCell(
                                    Text(paciente["name"]!),
                                  ),
                                  DataCell(
                                    Text(paciente["cpf"]!),
                                  ),
                                ]);
                          }).toList()
                        : [
                            const DataRow(
                              cells: [
                                DataCell(
                                  Text("-----"),
                                ),
                                DataCell(
                                  Text("-----"),
                                ),
                              ],
                            ),
                          ],
                  );
                },
              ),
            ),
          ),
          Padding(
            //************************************************************ Solicitar Vinculo, Fazer consulta*/
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                    height: 35,
                    child: elevatedButton(
                        context,
                        const Text("Solicitar V??nculo",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            )), () async {
                      var v = controller.getViculacion(int.parse(
                          controller.user!)); //verifica se ja esta vinculado

                      if (!v && controller.cpf != "") {
                        //faz vinculo
                        controller
                            .setmedicoVinculacion(int.parse(controller.user!));
                      }

                      showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: v == true
                              ? const Text(
                                  "Voc?? j?? est?? vinculado a esste paciente.")
                              : controller.cpf != ""
                                  ? const Text("Paciente vinculado com sucesso")
                                  : const Text(
                                      "Voc?? deve selecionar um paciente antes de solicitar um v??nculo."),
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
                    })),
                SizedBox(
                  height: 35,
                  child: elevatedButton(
                      context,
                      const Text("Fazer Consulta",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          )), () async {
                    final v = controller.getViculacion(int.parse(
                        controller.user!)); //verifica se esta vinculado
                    if (!v) {
                      print(Modular.get(defaultValue: HomeStore()).setIndex(2));
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: controller.cpf == ""
                              ? const Text(
                                  "Selecione um Paciente para fazer a consulta e tente novamente.")
                              : const Text(
                                  "Voc?? n??o est?? vinculado a este paciente. \nSolicite o v??nculo antes de prosseguir para a consulta."),
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
                    } else {
                      Modular.get(defaultValue: HomeStore()).setIndex(2);
                      Modular.to.pushNamed("/home/consulta/");
                    }
                  }),
                ),
                SizedBox(
                  height: 35,
                  child: elevatedButton(
                      context,
                      const Text(
                        "Vacinar",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ), () async {
                    final v = controller.getViculacion(int.parse(
                        controller.user!)); //verifica se esta vinculado
                    if (!v) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: controller.cpf == ""
                              ? const Text(
                                  "Selecione um Paciente para vacinar e tente novamente.")
                              : const Text(
                                  "Voc?? n??o est?? vinculado a este paciente. \nSolicite o vinculo antes de prosseguir para a vacina."),
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
                    } else {
                      Modular.get(defaultValue: HomeStore()).setIndex(1);
                      Modular.to.pushNamed("/home/vacina/");
                    }
                  }),
                ),
              ],
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
