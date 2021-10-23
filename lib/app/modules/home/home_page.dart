import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ze_gotinha/app/modules/home/home_store.dart';
import 'package:ze_gotinha/app/modules/widgets/button.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height; //screen height
    double _width = MediaQuery.of(context).size.width; //screen width

    controller.getPage(0);

    return Scaffold(
      body: Container(
        //* ******************************************************************** Backgroud
        color: Theme.of(context).colorScheme.background,
        height: _height,
        width: _width,
        child: Column(children: [
          Container(
            //********************************************************* Navigation bar */
            margin: const EdgeInsets.only(top: 40),
            width: _width * .5,
            height: _height * 0.09,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).colorScheme.surface,
            ),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Observer(builder: (_) {
                    return GestureDetector(
                      onTap: () {
                        controller.setIndex(0);
                        controller.getPage(0);
                      },
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Container(
                          width: (_width * .5) / 4,
                          height: _height * 0.09,
                          decoration: BoxDecoration(
                            color: 0 == controller.pageIndex
                                ? Theme.of(context).colorScheme.secondary
                                : Theme.of(context).colorScheme.surface,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Tab(
                            icon: Icon(Icons.home),
                            text: "Zé Gotinha",
                          ),
                        ),
                      ),
                    );
                  }),
                  Observer(builder: (_) {
                    return GestureDetector(
                      onTap: () async {
                        if (await _buscaPaciente() == false) {
                          _pacienteErro(context);
                        } else {
                          controller.setIndex(1);
                          controller.getPage(1);
                        }
                      },
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Container(
                          width: (_width * .5) / 4,
                          height: _height * 0.09,
                          decoration: BoxDecoration(
                            color: 1 == controller.pageIndex
                                ? Theme.of(context).colorScheme.secondary
                                : Theme.of(context).colorScheme.surface,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Tab(
                            icon: Icon(Icons.document_scanner_outlined),
                            text: "Cartão de Vacina",
                          ),
                        ),
                      ),
                    );
                  }),
                  Observer(builder: (_) {
                    return GestureDetector(
                      onTap: () async {
                        if (await _buscaPaciente() == false) {
                          _pacienteErro(context);
                        } else {
                          controller.setIndex(2);
                          controller.getPage(2);
                        }
                      },
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Container(
                          width: (_width * .5) / 4,
                          height: _height * 0.09,
                          decoration: BoxDecoration(
                            color: 2 == controller.pageIndex
                                ? Theme.of(context).colorScheme.secondary
                                : Theme.of(context).colorScheme.surface,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Tab(
                            icon: Icon(Icons.medical_services),
                            text: "Consulta",
                          ),
                        ),
                      ),
                    );
                  }),
                  Observer(builder: (_) {
                    return GestureDetector(
                      onTap: () {
                        controller.setIndex(3);
                      },
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Container(
                          width: (_width * .5) / 4,
                          height: _height * 0.09,
                          decoration: BoxDecoration(
                            color: 3 == controller.pageIndex
                                ? Theme.of(context).colorScheme.secondary
                                : Theme.of(context).colorScheme.surface,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Tab(
                            icon: Icon(Icons.person),
                            text: "Usuário",
                          ),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
          Container(
              //**************************************************************** White box
              height: _height * .75,
              width: _width * .6,
              margin: const EdgeInsets.only(top: 40),
              //color: ThemeData.light().cardColor,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: PageView(
                controller: controller.pageViewController,
                children: [RouterOutlet()],
              ))
        ]),
      ),
    );
  }
}

Future<bool> _buscaPaciente() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? cpf = prefs.getString("paciente");

  return cpf == null ? false : true;
}

_pacienteErro(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text(
          "Selecione um paciente que já esteja vinculado e tente novamente."),
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
