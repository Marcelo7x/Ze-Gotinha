import 'package:flutter/gestures.dart';
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

    //var _vacinas = controller.getVacinas();
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
                    style: TextStyle(fontSize: 14)),
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
                  controller.setVacina(
                      vacina, _dose.text, _data.text, _lote.text);
                  Navigator.pop(context);
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
              children:  [
                GestureDetector(onTap: () => Modular.to.popAndPushNamed("/home/medico/") ,child: Icon(Icons.arrow_back)),
                Text("voltar"),
              ],
            ),
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
                    child: elevatedButton(context, "Buscar Vacina", () {
                      controller.getVacinas(s: _searchController.text);
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
                      child: ListView(
                          children: controller.vacina!.length != 0
                              ? controller.vacina!
                                  .map(
                                    (vacina) => ListTile(
                                        title: Text(vacina),
                                        enableFeedback: true,
                                        onTap: () {
                                          _setVacina(vacina);
                                        },
                                    ),

                                  )
                                  .toList()
                              : [
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: ListTile(
                                      title: Text("Vacinas", style: TextStyle(fontSize: 20)),
                                    ),
                                  ),
                                ]),
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
